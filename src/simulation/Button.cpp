#include "simulation/Button.hpp"

#include "simulation/SimulationServer.hpp"

Button::Button(int id, uint8_t invert, uint32_t dbTime) : m_actuallyPressed(std::make_shared<std::atomic<bool>>(0)), m_id(id) {
  m_invert = !invert;
  m_dbTime = dbTime;
  m_state = 0;
  if (m_invert != 0) m_state = !m_state;
  m_time = static_cast<uint32_t>(millis());
  m_lastState = m_state;
  m_changed = 0;
  m_hold_time = -1;
  m_lastTime = m_time;
  m_lastChange = m_time;
  m_pressTime = m_time;
}

void Button::begin() { SimServer.registerButton(m_id, m_actuallyPressed); }

uint8_t Button::read() {
  static uint32_t ms;
  static uint8_t pinVal;

  ms = static_cast<uint32_t>(millis());
  pinVal = m_actuallyPressed->load() ? 1 : 0;
  if (m_invert != 0) pinVal = !pinVal;
  if (ms - m_lastChange < m_dbTime) {
    m_lastTime = m_time;
    m_time = ms;
    m_changed = 0;
    return m_state;
  }
  m_lastTime = m_time;
  m_time = ms;
  m_lastState = m_state;
  m_state = pinVal;
  if (m_state != m_lastState) {
    m_lastChange = ms;
    m_changed = 1;
    if (m_state) {
      m_pressTime = m_time;
    }
  } else {
    m_changed = 0;
  }
  return m_state;
}

uint8_t Button::isPressed() { return m_state == 0 ? 0 : 1; }

uint8_t Button::isReleased() { return m_state == 0 ? 1 : 0; }

uint8_t Button::wasPressed() { return m_state && m_changed; }

uint8_t Button::wasReleased() { return !m_state && m_changed && millis() - m_pressTime < m_hold_time; }

uint8_t Button::wasReleasefor(uint32_t ms) {
  m_hold_time = ms;
  return !m_state && m_changed && millis() - m_pressTime >= ms;
}

uint8_t Button::pressedFor(uint32_t ms) { return (m_state == 1 && m_time - m_lastChange >= ms) ? 1 : 0; }

uint8_t Button::pressedFor(uint32_t ms, uint32_t continuous_time) {
  if (m_state == 1 && m_time - m_lastChange >= ms && m_time - m_lastLongPress >= continuous_time) {
    m_lastLongPress = m_time;
    return 1;
  }
  return 0;
}

uint8_t Button::releasedFor(uint32_t ms) { return (m_state == 0 && m_time - m_lastChange >= ms) ? 1 : 0; }

uint32_t Button::lastChange() { return m_lastChange; }
