#ifndef _CONVEYOR_HPP_
#define _CONVEYOR_HPP_

enum class ConveyorStatus
{
    STOPPED,
    RUNNING,
};

/// @brief Conveyor interface
class IConveyor
{
public:
    virtual ~IConveyor() = default;
    virtual void begin() = 0;
    virtual void start() = 0;
    virtual void stop() = 0;
    virtual void update() = 0;
    virtual ConveyorStatus getCurrentStatus() = 0;
    virtual ConveyorStatus getDesiredStatus() = 0;
};

#ifndef EMULATE_M5

#include "Module_GRBL_13.2.h"

/// @brief Conveyor implementation for M5Stack / GRBL
class GRBLConveyor : public IConveyor
{
public:
    GRBLConveyor(TwoWire *Wire);
    ~GRBLConveyor() = default;
    void begin() override;
    void start() override;
    void stop() override;
    void update() override;
    ConveyorStatus getCurrentStatus() override;
    ConveyorStatus getDesiredStatus() override;

private:
    Module_GRBL m_grbl;
    TwoWire *m_wire;
    ConveyorStatus m_desiredStatus;
};

#endif // !defined(EMULATE_M5)

#endif // !defined(_CONVEYOR_HPP_)
