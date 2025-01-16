#include "TagReader.hpp"

void TagReader::begin(TwoWire *wire) {
  m_isStuck = false;
  m_status = TagReaderStatus::CONFIGURING;
  m_mfrc522 = new MFRC522_I2C(0x28, 0, wire);
  m_mfrc522->PCD_Init();
  m_mfrc522->PCD_DumpVersionToSerial();
}

TagReader::~TagReader() { delete m_mfrc522; }

bool TagReader::isNewTagPresent() {
  bool result = m_mfrc522->PICC_IsNewCardPresent();
  return result;
}

unsigned char TagReader::readTag(unsigned char *buffer) {
  if (!m_mfrc522->PICC_ReadCardSerial()) return 0;
  memcpy(buffer, m_mfrc522->uid.uidByte, m_mfrc522->uid.size);
  unsigned char read = m_mfrc522->uid.size;
  return read;
}

void TagReader::selfTest() {
  if (m_isStuck) {
    m_status = TagReaderStatus::ERROR;
    return;
  }

  m_status = TagReaderStatus::CONFIGURING;
  byte version = m_mfrc522->PCD_ReadRegister(MFRC522_I2C::PCD_Register::VersionReg);
  switch (version) {
    case 0x88:
    case 0x90:
    case 0x91:
    case 0x92:
    case 0x12:
      m_status = TagReaderStatus::READY;
      break;
    default:
      m_status = TagReaderStatus::ERROR;
      break;
  }
}

TagReaderStatus TagReader::getStatus() { return m_status; }

bool TagReader::isStuck() { return m_isStuck; }

void TagReader::setIsStuck(const bool isStuck) { m_isStuck = isStuck; }
