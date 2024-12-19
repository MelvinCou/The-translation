#include "simulation/Print.hpp"

#include <cstdarg>
#include <cstdio>
#include <cstdlib>
#include <cstring>

Print::~Print() {}

size_t Print::write(const uint8_t *buffer, size_t size) {
  for (size_t i = 0; i < size; i++) {
    if (this->write(buffer[i]) == 0) return i;
  }
  return size;
}

size_t Print::print(const char msg[]) { return this->write(reinterpret_cast<const uint8_t *>(msg), strlen(msg)); }

size_t Print::print([[maybe_unused]] unsigned char c, [[maybe_unused]] int fmt) {
  // TODO: stub
  return 0;
}

size_t Print::println(const char msg[]) { return this->print(msg) + this->write('\n'); }

size_t Print::println(std::string const &msg) { return this->println(msg.c_str()); }

size_t Print::println(int i) { return this->printf("%d\n", i); }

size_t Print::println() { return this->write('\n'); }

size_t Print::printf(const char *format, ...) {
  char *buf;
  va_list args;
  va_start(args, format);
  int res = vasprintf(&buf, format, args);
  va_end(args);
  if (res < 0) {
    return 0;
  }
  size_t written = this->write(reinterpret_cast<const uint8_t *>(buf), static_cast<size_t>(res));
  std::free(buf);
  return written;
}

int sniprintf(char *buf, size_t buf_size, const char *format, ...) {
  va_list args;
  va_start(args, format);
  int res = vsnprintf(buf, buf_size, format, args);
  va_end(args);
  return res;
}
