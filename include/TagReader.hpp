#ifndef TAG_READER_HPP
#define TAG_READER_HPP

#include <MFRC522_I2C.h>

enum class TagReaderStatus { CONFIGURING, READY, ERROR };

class TagReader {
 public:
  TagReader() = default;
  ~TagReader();

  /// @brief Delayed initialization of the tag reader
  /// @param wire The I2C bus.
  void begin(TwoWire *wire);

  bool isNewTagPresent();

  /// @brief Reads the NFC tag and returns the number of bytes copied to the buffer.
  /// @param buffer The buffer to copy the tag data to, MUST BE AT LEAST 10 BYTES.
  /// @return The number of bytes copied to the buffer, or 0 if no tag was read.
  unsigned char readTag(unsigned char *buffer);

  void selfTest();

  TagReaderStatus getStatus();

  bool isStuck();
  void setIsStuck(const bool isStuck);

 private:
  MFRC522_I2C *m_mfrc522;
  TagReaderStatus m_status;
  bool m_isStuck;
};

#endif  // !defined(TAG_READER_HPP)
