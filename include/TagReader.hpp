#ifndef TAG_READER_HPP
#define TAG_READER_HPP

class TagReader
{
public:
    TagReader() = default;
    ~TagReader() = default;

    void begin();

    bool isNewTagPresent();

    /// @brief Reads the NFC tag and returns the number of bytes copied to the buffer.
    /// @param buffer The buffer to copy the tag data to, MUST BE AT LEAST 10 BYTES.
    /// @return The number of bytes copied to the buffer, or 0 if no tag was read.
    unsigned char readTag(unsigned char *buffer);
};

#endif // !defined(TAG_READER_HPP)
