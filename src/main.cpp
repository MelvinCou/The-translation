/*
*******************************************************************************
* Copyright (c) 2021 by  M5Stack
*                 Equipped with M5Core sample source code
*                          配套  M5Core 示例源代码
* Visit for more information: https://docs.m5stack.com/en/core/gray
* 获取更多资料请访问: https://docs.m5stack.com/zh_CN/core/gray
*
* Describe: Hello World
* Date: 2021/7/15
*******************************************************************************
*/
#include <M5Stack.h>
#include <Wire.h>
#include <driver/rmt.h>
#include <math.h>

#include "GoPlus2.h"

GoPlus2 goPlus;

#define X_LOCAL 40
#define Y_LOCAL 30

#define X_OFFSET                160
#define Y_OFFSET                23
#define rrmt_item32_timemout_us 9500

int _hub1, hub1 = 0;
rmt_item32_t signals[1024];

size_t received = 0;

int flag = 0;
int num  = 0;

void header(const char *string, uint16_t color) {
    M5.Lcd.fillScreen(color);
    M5.Lcd.setTextSize(1);
    M5.Lcd.setTextColor(TFT_WHITE, TFT_BLACK);
    M5.Lcd.fillRect(0, 0, 320, 30, TFT_BLACK);
    M5.Lcd.setTextDatum(TC_DATUM);
    M5.Lcd.drawString(string, 160, 3, 4);
}

void rx_channel_init() {
    rmt_config_t rmt_rx;
    rmt_rx.channel                       = RMT_CHANNEL_0;
    rmt_rx.gpio_num                      = GPIO_NUM_35;
    rmt_rx.clk_div                       = 80;
    rmt_rx.mem_block_num                 = 4;
    rmt_rx.rmt_mode                      = RMT_MODE_RX;
    rmt_rx.rx_config.filter_en           = false;
    rmt_rx.rx_config.filter_ticks_thresh = 0;
    rmt_rx.rx_config.idle_threshold      = 5000;

    rmt_config(&rmt_rx);
    rmt_driver_install(rmt_rx.channel, 1000, 0);
}

void tx_channel_init() {
    rmt_config_t rmt_tx;
    rmt_tx.rmt_mode                       = RMT_MODE_TX;
    rmt_tx.channel                        = RMT_CHANNEL_4;
    rmt_tx.gpio_num                       = GPIO_NUM_5;
    rmt_tx.mem_block_num                  = 4;
    rmt_tx.clk_div                        = 80;
    rmt_tx.tx_config.loop_en              = false;
    rmt_tx.tx_config.carrier_duty_percent = 50;
    rmt_tx.tx_config.carrier_freq_hz      = 38000;
    rmt_tx.tx_config.carrier_level        = RMT_CARRIER_LEVEL_HIGH;
    rmt_tx.tx_config.carrier_en           = 1;
    rmt_tx.tx_config.idle_level           = RMT_IDLE_LEVEL_LOW;
    rmt_tx.tx_config.idle_output_en       = true;
    rmt_config(&rmt_tx);
    rmt_driver_install(rmt_tx.channel, 0, 0);
}

void Servo() {
    while (num == 1) {
        M5.Lcd.fillRect(0, 40, 320, 100, TFT_BLACK);
        M5.Lcd.setCursor(20, 40, 4);
        M5.Lcd.println("Servo Test");
        M5.Lcd.setCursor(20, 60, 4);
        M5.Lcd.println("Servo Angle: 0");
        goPlus.Servo_write_angle(SERVO_NUM0, 0);
        goPlus.Servo_write_angle(SERVO_NUM1, 0);
        goPlus.Servo_write_angle(SERVO_NUM2, 0);
        goPlus.Servo_write_angle(SERVO_NUM3, 0);
        delay(1000);
        M5.Lcd.fillRect(0, 60, 320, 100, TFT_BLACK);
        M5.Lcd.setCursor(20, 60, 4);
        M5.Lcd.println("Pluse Width: 2000");
        goPlus.Servo_write_plusewidth(SERVO_NUM0_PW, 2500);
        goPlus.Servo_write_plusewidth(SERVO_NUM1_PW, 2500);
        goPlus.Servo_write_plusewidth(SERVO_NUM2_PW, 2500);
        goPlus.Servo_write_plusewidth(SERVO_NUM3_PW, 2500);
        delay(1000);
    }
}

void rmt_tx_task() {
    M5.Lcd.println("send...");
    M5.Lcd.println(received);
    rmt_write_items(RMT_CHANNEL_4, signals, received, false);
    rmt_wait_tx_done(RMT_CHANNEL_4, 2000);
    M5.Lcd.println("send done");
}

void rmt_rx_task() {
    RingbufHandle_t rb = NULL;
    rmt_get_ringbuf_handle(RMT_CHANNEL_0, &rb);
    rmt_rx_start(RMT_CHANNEL_0, 1);

    size_t rx_size = 0;
    M5.Lcd.setCursor(20, 40, 4);
    M5.Lcd.println("wait ir signal...");
    rmt_item32_t *item = (rmt_item32_t *)xRingbufferReceive(rb, &rx_size, 3000);
    rmt_rx_stop(RMT_CHANNEL_0);
    if (!item) {
        M5.Lcd.println("no data received");
        return;
    }
    M5.Lcd.print("received items: ");
    M5.Lcd.println(rx_size);

    memcpy(signals, item, sizeof(rmt_item32_t) * rx_size);
    for (int i = 0; i < rx_size; ++i) {
        signals[i].level0 = ~signals[i].level0;
        signals[i].level1 = ~signals[i].level1;
    }
    received = rx_size;
    vRingbufferReturnItem(rb, (void *)item);
    M5.Lcd.println("recv done");
    rmt_rx_stop(RMT_CHANNEL_0);
    rmt_tx_task();
}

void IR() {
    while (num == 3) {
        M5.Lcd.fillRect(0, 40, 320, 200, TFT_BLACK);
        rmt_rx_task();
    }
}

void doTask() {
    if (num == 4) {
        num = 0;
    } else {
        num++;
    }
    Serial.println(num);
}

/* After M5Core is started or reset
the program in the setUp () function will be run, and this part will only be run
once. */
void setup() {
    M5.begin();        // Init M5Core. 
    M5.Power.begin();  // Init Power module.
    /* Power chip connected to gpio21, gpio22, I2C device
      Set battery charging voltage and current
      If used battery, please call this function in your project */
    // M5.Lcd.print("Hello World");  // Print text on the screen (string)
    goPlus.begin();
    delay(100);
    rx_channel_init();
    tx_channel_init();
    header("GoPlus 2", TFT_BLACK);
    M5.Lcd.setTextColor(TFT_GREEN, TFT_BLACK);
    attachInterrupt(digitalPinToInterrupt(38), doTask, RISING);
                                  
}

/* After the program in setup() runs, it runs the program in loop()
The loop() function is an infinite loop in which the program runs repeatedly */
void loop() {
  Servo();
  IR();
}