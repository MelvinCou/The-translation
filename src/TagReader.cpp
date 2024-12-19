#include "TagReader.hpp"

void TagReader::begin(TwoWire *wire) {
  m_mfrc522 = new MFRC522_I2C(0x28, 0, wire);
  m_mfrc522->PCD_Init();
  m_mfrc522->PCD_DumpVersionToSerial();
}

// Common code between the two variants of the MFRC522 hardware

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
