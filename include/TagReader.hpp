#ifndef TAG_READER_HPP
#define TAG_READER_HPP

#ifdef HARDWARE_MFRC522
#include <MFRC522.h>
#elif defined(HARDWARE_MFRC522_I2C)
#include <MFRC522_I2C.h>
#endif

class TagReader {
 public:
  TagReader() = default;
  ~TagReader();

#ifdef HARDWARE_MFRC522_I2C
  /// @brief Delayed initialization of the tag reader
  /// @param Wire The I2C bus.
  void begin(TwoWire *Wire);
#else
  /// @brief Delayed initialization of the tag reader
  void begin();
#endif  // defined(HARDWARE_MFRC522_I2C)

  bool isNewTagPresent();

  /// @brief Reads the NFC tag and returns the number of bytes copied to the buffer.
  /// @param buffer The buffer to copy the tag data to, MUST BE AT LEAST 10 BYTES.
  /// @return The number of bytes copied to the buffer, or 0 if no tag was read.
  unsigned char readTag(unsigned char *buffer);

 private:
#ifdef HARDWARE_MFRC522_I2C
  MFRC522_I2C *m_mfrc522;
#elif defined(HARDWARE_MFRC522)
  MFRC522 *m_mfrc522;
#endif
};

#endif  // !defined(TAG_READER_HPP)
