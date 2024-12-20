#ifndef SORTER_HPP
#define SORTER_HPP

enum class SorterDirection {
  LEFT = 1,
  MIDDLE,
  RIGHT,
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
  void setDesiredAngle(SorterDirection direction);

 private:
  int m_desiredAngle;
  int m_currentAngle;
};

#endif  // !defined(SORTER_HPP)
