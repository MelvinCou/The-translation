#ifndef SORTER_HPP
#define SORTER_HPP

enum class SorterDirection {
  LEFT,
  MIDDLE,
  RIGHT,
};

/// @brief The package sorter, usually driven by a servo motor.
class Sorter {
 public:
  Sorter() = default;
  ~Sorter() = default;

  void begin();
  void move(SorterDirection direction);
  void moveWithSpecificAngle(int angle);
};

#endif  // !defined(SORTER_HPP)
