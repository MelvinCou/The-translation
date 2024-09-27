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

#include "Module_GRBL_13.2.h"

#define STEPMOTOR_I2C_ADDR 0x70

Module_GRBL _GRBL = Module_GRBL(STEPMOTOR_I2C_ADDR);

#define STEPMOTOR_SPEED "700"
#define STEPMOTOR_DISTANCE "999999"

bool shouldRotate = false;

void printStatus();
void ensureMotorStatus();

void setup()
{
  M5.begin();            // Init M5Stack.  初始化M5Stack
  M5.Power.begin();      // Init power  初始化电源模块
  M5.lcd.setTextSize(2); // Set the text size to 2.  设置文字大小为2
  Wire.begin(21, 22);    // Wire init, adding the I2C bus.  Wire初始化, 加入i2c总线
  M5.Lcd.println("= Motor Test =");
  _GRBL.Init(&Wire);
  printStatus();
}

// CNC codes: https://www.cnccookbook.com/g-code-m-code-command-list-cnc-mills/
void loop()
{
  if (M5.BtnA.wasPressed())
  {
    shouldRotate = true;
  }
  else if (M5.BtnC.wasPressed())
  {
    shouldRotate = false;
  }

  if (M5.BtnB.wasPressed())
  {
    M5.Lcd.println(_GRBL.readStatus());
  }

  ensureMotorStatus();
  M5.update();
}

void ensureMotorStatus()
{
  bool isIdle = _GRBL.readIdle();

  if (isIdle && shouldRotate)
  {
    _GRBL.sendGcode("G91"); // force incremental positioning
    _GRBL.sendGcode("G21"); // Set the unit to milimeters
    _GRBL.sendGcode("G1 X" STEPMOTOR_DISTANCE " Y0 Z0 F" STEPMOTOR_SPEED);
    printStatus();
  }
  else if (!isIdle && !shouldRotate)
  {
    M5.Lcd.println("Stopping motor");
    _GRBL.unLock();
    printStatus();
  }
}

void printStatus()
{
  M5.Lcd.clearDisplay();
  M5.Lcd.cursor_x = 0;
  M5.Lcd.cursor_y = 0;
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");
  if (shouldRotate)
  {
    M5.Lcd.println("Motor is rotating");
  }
  else
  {
    M5.Lcd.println("Motor is stopped");
  }
}
