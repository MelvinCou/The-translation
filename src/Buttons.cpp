
#include "TheTranslationConfig.hpp"
#include "Buttons.hpp"

#ifdef ENV_M5STACK
#include <M5Stack.h>

void Buttons::begin()
{
    BtnA = &M5.BtnA;
    BtnB = &M5.BtnB;
    BtnC = &M5.BtnC;
}

Buttons::~Buttons()
{
    BtnA = nullptr;
    BtnB = nullptr;
    BtnC = nullptr;
}

#else

void Buttons::begin()
{
    // Note: not all GPIO pins support pull-up resistors, so it is important to check the datasheet for the specific ESP32 module being used.
    BtnA = new Button(SIMPLE_BUTTON_A_PIN, SIMPLE_BUTTONS_DEBOUNCE_MS, false, true);
    BtnB = new Button(SIMPLE_BUTTON_B_PIN, SIMPLE_BUTTONS_DEBOUNCE_MS, false, true);
    BtnC = new Button(SIMPLE_BUTTON_C_PIN, SIMPLE_BUTTONS_DEBOUNCE_MS, false, true);
    BtnA->begin();
    BtnB->begin();
    BtnC->begin();
}

Buttons::~Buttons()
{
    delete BtnA;
    delete BtnB;
    delete BtnC;
    BtnA = nullptr;
    BtnB = nullptr;
    BtnC = nullptr;
}

#endif // defined(ENV_M5STACK)

Buttons::Buttons() : BtnA(nullptr), BtnB(nullptr), BtnC(nullptr)
{
}

void Buttons::update()
{
    BtnA->read();
    BtnB->read();
    BtnC->read();
}
