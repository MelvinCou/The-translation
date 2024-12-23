#ifndef SIMULATION_MFRC522_I2C_HPP
#define SIMULATION_MFRC522_I2C_HPP

#include "simulation/Arduino.hpp"
#include "simulation/Wire.hpp"

class MFRC522_I2C {
 public:
  enum PCD_Register {
    CommandReg = 0x01,
    ComIEnReg = 0x02,
    DivIEnReg = 0x03,
    ComIrqReg = 0x04,
    DivIrqReg = 0x05,
    ErrorReg = 0x06,
    Status1Reg = 0x07,
    Status2Reg = 0x08,
    FIFODataReg = 0x09,
    FIFOLevelReg = 0x0A,
    WaterLevelReg = 0x0B,
    ControlReg = 0x0C,
    BitFramingReg = 0x0D,
    CollReg = 0x0E,
    ModeReg = 0x11,
    TxModeReg = 0x12,
    RxModeReg = 0x13,
    TxControlReg = 0x14,
    TxASKReg = 0x15,
    TxSelReg = 0x16,
    RxSelReg = 0x17,
    RxThresholdReg = 0x18,
    DemodReg = 0x19,
    MfTxReg = 0x1C,
    MfRxReg = 0x1D,
    SerialSpeedReg = 0x1F,
    CRCResultRegH = 0x21,
    CRCResultRegL = 0x22,
    ModWidthReg = 0x24,
    RFCfgReg = 0x26,
    GsNReg = 0x27,
    CWGsPReg = 0x28,
    ModGsPReg = 0x29,
    TModeReg = 0x2A,
    TPrescalerReg = 0x2B,
    TReloadRegH = 0x2C,
    TReloadRegL = 0x2D,
    TCounterValueRegH = 0x2E,
    TCounterValueRegL = 0x2F,
    TestSel1Reg = 0x31,
    TestSel2Reg = 0x32,
    TestPinEnReg = 0x33,
    TestPinValueReg = 0x34,
    TestBusReg = 0x35,
    AutoTestReg = 0x36,
    VersionReg = 0x37,
    AnalogTestReg = 0x38,
    TestDAC1Reg = 0x39,
    TestDAC2Reg = 0x3A,
    TestADCReg = 0x3B
  };

  enum StatusCode {
    STATUS_OK = 1,
    STATUS_ERROR = 2,
    STATUS_COLLISION = 3,
    STATUS_TIMEOUT = 4,
    STATUS_NO_ROOM = 5,
    STATUS_INTERNAL_ERROR = 6,
    STATUS_INVALID = 7,
    STATUS_CRC_WRONG = 8,
    STATUS_MIFARE_NACK = 9
  };

  typedef struct {
    byte size;
    byte uidByte[10];
    byte sak;
  } Uid;

  Uid uid;

  MFRC522_I2C(byte chipAddress, byte resetPowerDownPin, TwoWire* TwoWireInstance = &Wire);

  byte PCD_ReadRegister(byte reg);

  void PCD_Init();
  void PCD_DumpVersionToSerial();

  bool PICC_IsNewCardPresent();
  bool PICC_ReadCardSerial();
};

#endif  // !defined(SIMULATION_MFRC522_I2C_HPP)
