#ifndef BUTTONS_HPP
#define BUTTONS_HPP

#ifdef ENV_M5STACK
#include <utility/Button.h>
#else
#include <JC_Button.h>
#endif

class Buttons
{
public:
    Buttons();
    ~Buttons();

    /// @brief Delayed initialization of the buttons, allows instances of `Button` to be used as a global variable.
    void begin();
    void update();

    Button *BtnA;
    Button *BtnB;
    Button *BtnC;
};

#endif // !defined(BUTTONS_HPP)
