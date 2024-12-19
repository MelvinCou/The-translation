#ifndef SIMULATION_PRINT_HPP
#define SIMULATION_PRINT_HPP

#include <cstddef>
#include <cstdint>
#include <string>

#define DEC 10
#define HEX 16
#define OCT 8
#define BIN 2

class Print {
 public:
  virtual ~Print();
  virtual size_t write(uint8_t) = 0;
  virtual size_t write(const uint8_t *buffer, size_t size);
  virtual int availableForWrite() { return 0; }
  virtual void flush() { /* Empty implementation for backward compatibility */
  }

  size_t print(const char[]);
  size_t print(unsigned char, int = DEC);

  size_t println(const char[]);
  size_t println(std::string const &);
  size_t println(int);
  size_t println();

  size_t printf(const char *format, ...) __attribute__((format(printf, 2, 3)));
};

int sniprintf(char *, size_t, const char *, ...) __attribute__((format(__printf__, 3, 4)));

#endif  // !defined(SIMULATION_PRINT_HPP)
