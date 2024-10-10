#include "TheTranslationConfig.hpp"

#include "TagReader.hpp"

#ifdef HARDWARE_MFRC522
#include <MFRC522.h>

MFRC522 mfrc522(SS, UINT8_MAX);
#elif defined(HARDWARE_MFRC522_I2C)
#include <MFRC522_I2C.h>

MFRC522_I2C mfrc522(0x28, 0);
#endif

#if defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)

void TagReader::begin()
{
    mfrc522.PCD_Init();
    mfrc522.PCD_DumpVersionToSerial();
}

bool TagReader::isNewTagPresent()
{
    return mfrc522.PICC_IsNewCardPresent();
}

unsigned char TagReader::readTag(unsigned char *buffer)
{
    if (!mfrc522.PICC_ReadCardSerial())
        return 0;
    memcpy(buffer, mfrc522.uid.uidByte, mfrc522.uid.size);
    return mfrc522.uid.size;
}
#else

void TagReader::begin()
{
}

bool TagReader::isNewTagPresent()
{
    return false;
}

unsigned char TagReader::readTag(unsigned char *buffer)
{
    (void)buffer;
    return 0;
}

#endif // defined(HARDWARE_MFRC522) || defined(HARDWARE_MFRC522_I2C)
