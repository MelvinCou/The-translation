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
#include "conveyor.hpp"

IConveyor *conveyor;

void printStatus();

void setup()
{
  M5.begin();            // Init M5Stack.  初始化M5Stack
  M5.Power.begin();      // Init power  初始化电源模块
  M5.lcd.setTextSize(2); // Set the text size to 2.  设置文字大小为2
  Wire.begin(21, 22);    // Wire init, adding the I2C bus.  Wire初始化, 加入i2c总线
  M5.Lcd.println("= Motor Test =");
  conveyor = new GRBLConveyor(&Wire);
  conveyor->begin();
  printStatus();
}

// CNC codes: https://www.cnccookbook.com/g-code-m-code-command-list-cnc-mills/
void loop()
{
  if (M5.BtnA.wasPressed())
  {
    conveyor->start();
  }
  else if (M5.BtnC.wasPressed())
  {
    conveyor->stop();
  }

  if (M5.BtnB.wasPressed())
  {
    printStatus();
  }

  conveyor->update();
  M5.update();
}

void printStatus()
{
  M5.Lcd.clearDisplay();
  M5.Lcd.cursor_x = 0;
  M5.Lcd.cursor_y = 0;
  M5.Lcd.println("= Motor Test =");
  M5.Lcd.println("A: Start B: Status C: Stop");

  if (conveyor->getDesiredStatus() == ConveyorStatus::RUNNING)
  {
    M5.Lcd.println("Desired: running");
  }
  else
  {
    M5.Lcd.println("Desired: stopped");
  }

  if (conveyor->getCurrentStatus() == ConveyorStatus::RUNNING)
  {
    M5.Lcd.println("Current: running");
  }
  else
  {
    M5.Lcd.println("Current: stopped");
  }
}
