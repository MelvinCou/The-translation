/*
*******************************************************************************
* Copyright (c) 2023 by M5Stack
*                  Equipped with M5Core sample source code
*                          配套  M5Core 示例源代码
* Visit for more information: https://docs.m5stack.com/en/core/gray
* 获取更多资料请访问: https://docs.m5stack.com/zh_CN/core/gray
*
* Describe: BasicHTTPClient.
* Date: 2021/8/4
******************************************************************************
*/
#include <Arduino.h>
#include <M5Stack.h>
#include <WiFi.h>
#include <WiFiMulti.h>
#include <AsyncTCP.h>

WiFiMulti wifiMulti;
AsyncClient client;

#define SSID ""
#define PASSWORD ""
#define API_KEY ""
#define API_URL "http://192.168.165.36:8080"

void setup() {
    M5.begin();        // Init M5Core.  初始化 M5Core
    M5.Power.begin();  // Init power  初始化电源模块
    wifiMulti.addAP(SSID, PASSWORD);  // Storage wifi configuration information.  存储wifi配置信息
    M5.Lcd.print("\nConnecting Wifi...\n");  // print format output string on
                                             // lcd.  串口格式化输出字符串
    client.onData([](void *obj, AsyncClient *c, void *data, size_t len) {
        M5.Lcd.print("Data received: ");
        M5.Lcd.println((char *)data);
        M5.Lcd.print("Data received: ");
        M5.Lcd.println(len);
        c->close();
    });
    client.onConnect([](void *obj, AsyncClient *c) {
        M5.Lcd.print("Connected\n");
    });
    client.onError([](void *obj, AsyncClient *c, int8_t error) {
        M5.Lcd.print("Error: ");
        M5.Lcd.println(error);
    });
    client.onDisconnect([](void *obj, AsyncClient *c) {
        M5.Lcd.print("Disconnected\n");
    });
    client.onTimeout([](void *obj, AsyncClient *c, uint32_t time) {
        M5.Lcd.print("Timeout\n");
    });
    client.onAck([](void *obj, AsyncClient *c, size_t len, uint32_t time) {
        M5.Lcd.print("Ack: ");
        M5.Lcd.println(len);
    });
}

void loop() {
    M5.Lcd.setCursor(0, 0);  // Set the cursor at (0,0).  设置光标位于(0,0)处
    if ((wifiMulti.run() == WL_CONNECTED)) {  // wait for WiFi connection.  等待连接至wifi
        M5.Lcd.print("[HTTP] begin...\n");


        client.connect("192.168.165.36", 8080);

        M5.Lcd.print("[HTTP] GET...\n");
        client.add("GET / HTTP/1.1\r\n", 16, ASYNC_WRITE_FLAG_MORE);
        client.add("\r\n", 2, ASYNC_WRITE_FLAG_MORE);
        bool status = client.send();

        M5.Lcd.print("Yay\n");
    } else {
        M5.Lcd.print("connect failed");
    }
    delay(1000);
    M5.Lcd.clear();  // clear the screen.  清除屏幕
}
