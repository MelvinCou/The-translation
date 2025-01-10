#ifndef SIMULATION_WIRE_HPP
#define SIMULATION_WIRE_HPP

class TwoWire {
 public:
  void begin(int a, int b);
};

extern TwoWire Wire;
extern TwoWire Wire1;

#endif  // !defined(SIMULATION_WIRE_HPP)
