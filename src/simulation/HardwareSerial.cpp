#include "simulation/HardwareSerial.hpp"

#include <cstdio>

HardwareSerial Serial;

void HardwareSerial::begin([[maybe_unused]] unsigned long baud) {
  // TODO: stub
}

size_t HardwareSerial::write(uint8_t b) {
  std::fputc(b, stdout);
  return 1;
}

size_t HardwareSerial::write(const uint8_t *buffer, size_t size) {
  size_t total = 0;
  while (total < size) {
    size_t to_write = size - total;
    size_t written = std::fwrite(buffer + total, sizeof(*buffer), to_write, stdout);
    total += written;
    if (written == 0) {
      break;
    }
  }
  return total;
}
