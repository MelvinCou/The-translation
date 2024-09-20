/*
*******************************************************************************
* Copyright (c) 2023 by M5Stack
*                  Equipped with M5Core sample source code
*                          配套  M5Core 示例源代码
* Visit for more information: https://docs.m5stack.com/en/core/gray
* 获取更多资料请访问: https://docs.m5stack.com/zh_CN/core/gray
*
* Describe: RFID.
* Date: 2021/8/19
*******************************************************************************
  Please connect to Port A(22、21),Use the RFID Unit to read the Fudan card ID
and display the ID on the screen. 请连接端口A(22、21),使用RFID Unit
读取ID卡并在屏幕上显示。
*/

#include <M5Stack.h>

#include "MFRC522_I2C.h"
#include "Module_GRBL_13.2.h"

#define STEPMOTOR_I2C_ADDR 0x70

Module_GRBL _GRBL = Module_GRBL(STEPMOTOR_I2C_ADDR);

MFRC522_I2C mfrc522(0x28, 0); // Create MFRC522 instance.  创建MFRC522实例

void setup()
{
  M5.begin();            // Init M5Stack.  初始化M5Stack
  M5.Power.begin();      // Init power  初始化电源模块
  M5.lcd.setTextSize(2); // Set the text size to 2.  设置文字大小为2
  M5.Lcd.println("Motor Test");
  Wire.begin(21, 22); // Wire init, adding the I2C bus.  Wire初始化, 加入i2c总线
  _GRBL.Init(&Wire);

  mfrc522.PCD_Init(); // Init MFRC522.  初始化 MFRC522
  M5.Lcd.println("A: G1, B: G2, C: Unlock");
  _GRBL.setMode("distance");
}

// CNC codes: https://www.machinistguides.com/g-codes/
void loop()
{
  if (M5.BtnA.wasPressed()) // A button
  {
    M5.Lcd.println(_GRBL.readStatus());
    _GRBL.setMotor(5, 5, 5, 200);
    _GRBL.setMotor(0, 0, 0, 200);
  }

  if (M5.BtnB.wasPressed())
  {
    M5.Lcd.println(_GRBL.readStatus());
    _GRBL.sendGcode("G2 X5 Y5 I1 J0 F200");
  }

  if (M5.BtnC.wasReleased())
  {
    _GRBL.unLock();
  }
  M5.update();
}
