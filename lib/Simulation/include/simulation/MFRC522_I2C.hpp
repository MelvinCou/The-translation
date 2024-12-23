#ifndef SIMULATION_MFRC522_I2C_HPP
#define SIMULATION_MFRC522_I2C_HPP

#include "simulation/Arduino.hpp"
#include "simulation/Wire.hpp"

class MFRC522_I2C {
 public:
  typedef struct {
    byte size;
    byte uidByte[10];
    byte sak;
  } Uid;

  Uid uid;

  MFRC522_I2C(byte chipAddress, byte resetPowerDownPin, TwoWire *TwoWireInstance = &Wire);

  void PCD_Init();
  void PCD_DumpVersionToSerial();

  bool PICC_IsNewCardPresent();
  bool PICC_ReadCardSerial();
};

#endif  // !defined(SIMULATION_MFRC522_I2C_HPP)
