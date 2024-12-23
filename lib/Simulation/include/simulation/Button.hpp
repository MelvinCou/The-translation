#ifndef SIMULATION_BUTTON_HPP
#define SIMULATION_BUTTON_HPP

#include <atomic>
#include <memory>

#include "simulation/Arduino.hpp"

class Button {
 public:
  Button(int id, uint8_t invert, uint32_t dbTime);

  void begin();
  
  uint8_t read();
  uint8_t isPressed();
  uint8_t isReleased();
  uint8_t wasPressed();
  uint8_t wasReleased();
  uint8_t pressedFor(uint32_t ms);
  uint8_t pressedFor(uint32_t ms, uint32_t continuous_time);
  uint8_t releasedFor(uint32_t ms);
  uint8_t wasReleasefor(uint32_t ms);
  uint32_t lastChange();

 private:
  std::shared_ptr<std::atomic<bool>> m_actuallyPressed;
  int m_id;
  uint8_t m_puEnable;        // internal pullup resistor enabled
  uint8_t m_invert;          // if 0, interpret high state as pressed, else interpret
                            // low state as pressed
  uint8_t m_state;           // current button state
  uint8_t m_lastState;       // previous button state
  uint8_t m_changed;         // state changed since last read
  uint32_t m_time;           // time of current state (all times are in ms)
  uint32_t m_lastTime;       // time of previous state
  uint32_t m_lastChange;     // time of last state change
  uint32_t m_lastLongPress;  // time of last state change
  uint32_t m_dbTime;         // debounce time
  uint32_t m_pressTime;      // press time
  uint32_t m_hold_time;      // hold time call wasreleasefor
};

#endif  // !defined(SIMULATION_BUTTON_HPP)
