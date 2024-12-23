#include "simulation/MFRC522_I2C.hpp"

MFRC522_I2C::MFRC522_I2C([[maybe_unused]] byte chipAddress, [[maybe_unused]] byte resetPowerDownPin,
                         [[maybe_unused]] TwoWire* TwoWireInstance)
    : uid() {
  // TODO: stub
}

byte MFRC522_I2C::PCD_ReadRegister(byte reg) {
  if (reg == VersionReg) {
    return 0x88;
  }
  return STATUS_ERROR;
}

void MFRC522_I2C::PCD_Init() {
  // TODO: stub
}

void MFRC522_I2C::PCD_DumpVersionToSerial() {
  // TODO: stub
}

bool MFRC522_I2C::PICC_IsNewCardPresent() {
  // TODO: stub
  return false;
}

bool MFRC522_I2C::PICC_ReadCardSerial() {
  // TODO: stub
  return false;
}