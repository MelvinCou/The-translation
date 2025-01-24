#ifndef SORTER_HPP
#define SORTER_HPP

#include <cstdint>

enum class SorterDirection {
  LEFT = 1,
  MIDDLE,
  RIGHT,
};

static constexpr char const *SORTER_DIRECTIONS[] = {
    "(nothing)",
    "LEFT",
    "MIDDLE",
    "RIGHT",
};

/// @brief The package sorter, usually driven by a servo motor.
class Sorter {
 public:
  Sorter() = default;
  ~Sorter() = default;

  void begin();
  void moveWithSpecificAngle(int angle);
  int getCurrentAngle() const;
  int getDesiredAngle() const;
  SorterDirection getDesiredDirection() const;
  void setDesiredAngle(SorterDirection direction);
  void moveToDesiredAngle(uint32_t delayMs);

 private:
  int m_desiredAngle;
  int m_currentAngle;
};

#endif  // !defined(SORTER_HPP)
