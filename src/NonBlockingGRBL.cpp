#include "NonBlockingGRBL.hpp"

#include "taskUtil.hpp"

Module_GRBL::Module_GRBL(uint8_t addr) { this->addr = addr; }

void Module_GRBL::Init(TwoWire *wire) { _Wire = wire; }

void Module_GRBL::Init(TwoWire *wire, uint32_t x_step, uint32_t y_step, uint32_t z_step, uint32_t acc) {
  _Wire = wire;
  if (x_step) {
    char code[256];
    sprintf(code, "$0=%d", x_step);
    sendGcode(code);
  }
  if (y_step) {
    char code[256];
    sprintf(code, "$1=%d", y_step);
    sendGcode(code);
  }
  if (z_step) {
    char code[256];
    sprintf(code, "$2=%d", z_step);
    sendGcode(code);
  }
  if (acc) {
    char code[256];
    sprintf(code, "$8=%d", acc);
    sendGcode(code);
  }
}

void Module_GRBL::sendGcode(char *c) {
  _Wire->beginTransmission(addr);
  while ((*c) != 0) {
    _Wire->write(*c);
    c++;
  }
  _Wire->write(0x0d);
  _Wire->write(0x0a);
  _Wire->endTransmission();
}

void Module_GRBL::sendByte(byte b) {
  _Wire->beginTransmission(addr);
  _Wire->write(b);
  _Wire->endTransmission();
}

void Module_GRBL::sendBytes(uint8_t *data, size_t size) {
  _Wire->beginTransmission(addr);
  _Wire->write(data, size);
  _Wire->endTransmission();
}

[[nodiscard]] GRBLCancellable Module_GRBL::readClean() {
  do {
    uint8_t i = 0;
    char data[10];
    _Wire->requestFrom(addr, 10);
    while (_Wire->available() > 0) {
      data[i++] = _Wire->read();
    }
    if (data[9] == 0xff) return GRBLCancellable::CONTINUE;
  } while (interruptibleTaskPause(1));
  return GRBLCancellable::CANCELLED;
}

void Module_GRBL::unLock() {
  this->sendByte(0x18);
  delay(5);
  char bytes[] = "$X\r\n";
  this->sendBytes((uint8_t *)bytes, 4);
}

void Module_GRBL::setMotor(int x, int y, int z, int speed) {
  char code[256];
  memset(code, 0, sizeof(char) * 256);
  sprintf(code, "G1 X%dY%dZ%d F%d", x, y, z, speed);
  return this->sendGcode(code);
}

void Module_GRBL::setMode(String mode) {
  if (mode == "distance") {
    char bytes[] = "G91\n";
    this->sendBytes((uint8_t *)bytes, 4);
    this->mode = mode;
  } else if (mode == "absolute") {
    char bytes[] = "G90\n";
    this->sendBytes((uint8_t *)bytes, 4);
    this->mode = mode;
  }
}

[[nodiscard]] GRBLCancellable Module_GRBL::waitIdle() {
  if (this->readClean() == GRBLCancellable::CANCELLED) {
    return GRBLCancellable::CANCELLED;
  }
  do {
    this->sendByte('@');
    char state;
    _Wire->requestFrom(addr, 1);
    if (_Wire->available() > 0) {
      state = _Wire->read();
    }
    if (state == 'I') {
      return GRBLCancellable::CONTINUE;
    }
  } while (interruptibleTaskPauseMs(5));
  return GRBLCancellable::CANCELLED;
}

// read grbl return message

[[nodiscard]] GRBLCancellable Module_GRBL::readLine(String *line) {
  *line = "";
  do {
    uint8_t i = 0;
    char data[10];
    _Wire->requestFrom(addr, 10);
    while (_Wire->available() > 0) {
      data[i] = static_cast<char>(_Wire->read());
      i++;
    }
    *line += data;
    if (data[9] == 0xff) {
      return GRBLCancellable::CONTINUE;
    }
  } while (interruptibleTaskPause(1));
  return GRBLCancellable::CANCELLED;
}

[[nodiscard]] GRBLCancellable Module_GRBL::readStatus(String *line) {
  if (this->readClean() == GRBLCancellable::CANCELLED) {
    return GRBLCancellable::CANCELLED;
  }
  this->sendByte('@');
  return this->readLine(line);
}