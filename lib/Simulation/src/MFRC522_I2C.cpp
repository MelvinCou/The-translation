#include "simulation/MFRC522_I2C.hpp"

#include <esp_log.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>

#include <taskUtil.hpp>

#include "SimulationServer.hpp"

static I2CAddress getAddress(TwoWire* wire, byte chipAddress) {
  return I2CAddress{static_cast<uint8_t>(wire == &Wire1 ? 1 : 0), chipAddress};
}

MFRC522_I2C::MFRC522_I2C(byte chipAddress, [[maybe_unused]] byte resetPowerDownPin, TwoWire* TwoWireInstance)
    : uid(),
      m_chipAddress(chipAddress),
      m_wire(TwoWireInstance),
      m_versionNotification(xSemaphoreCreateBinary()),
      m_version(0),
      m_newUid() {
  uid.size = 0;
}

MFRC522_I2C::~MFRC522_I2C() { vSemaphoreDelete(m_versionNotification); }

byte MFRC522_I2C::PCD_ReadRegister(byte reg) {
  if (reg == VersionReg) {
    SimServer.sendNfcGetVersion(getAddress(m_wire, m_chipAddress));
    if (xSemaphoreTake(m_versionNotification, pdMS_TO_TICKS(1000)) == pdTRUE) {
      return m_version.load();
    }
  }
  return STATUS_ERROR;
}

void MFRC522_I2C::PCD_Init() {
  SimServer.registerNfc(getAddress(m_wire, m_chipAddress), [this](C2SMessage const& msg) {
    if (msg.opcode == C2SOpcode::NFC_SET_VERSION) {
      m_version.store(msg.nfcSetVersion.version);
      xSemaphoreGive(m_versionNotification);
    } else if (msg.opcode == C2SOpcode::NFC_SET_CARD) {
      std::unique_lock<std::mutex> lock(m_cardLock);
      m_newUid.size = msg.nfcSetCard.uidLen;
      m_newUid.sak = msg.nfcSetCard.sak;
      memcpy(m_newUid.uidByte, msg.nfcSetCard.uid, m_newUid.size);
      m_hasNewCard.store(msg.nfcSetCard.uidLen > 0);
    }
  });
}

void MFRC522_I2C::PCD_DumpVersionToSerial() {
  // TODO: stub
}

bool MFRC522_I2C::PICC_IsNewCardPresent() {
  // Artificial read delay
  return interruptibleTaskPauseMs(100) && m_hasNewCard.load();
}

bool MFRC522_I2C::PICC_ReadCardSerial() {
  // Artificial read delay
  if (!interruptibleTaskPauseMs(100)) {
    return false;
  }
  std::unique_lock<std::mutex> lock(m_cardLock);
  if (!m_hasNewCard.load()) return false;
  std::swap(uid, m_newUid);
  m_hasNewCard.store(false);
  return true;
}