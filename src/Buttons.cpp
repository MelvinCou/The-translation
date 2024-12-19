#include "Buttons.hpp"

#include <M5Stack.h>

#include "TheTranslationConfig.hpp"

void Buttons::begin() {
  BtnA = &M5.BtnA;
  BtnB = &M5.BtnB;
  BtnC = &M5.BtnC;
}

Buttons::~Buttons() {
  BtnA = nullptr;
  BtnB = nullptr;
  BtnC = nullptr;
}

Buttons::Buttons() : BtnA(nullptr), BtnB(nullptr), BtnC(nullptr) {}

void Buttons::update() {
  BtnA->read();
  BtnB->read();
  BtnC->read();
}
