// #include <M5Stack.h>

#include "conveyor.hpp"

#define STEPMOTOR_I2C_ADDR 0x70
#define STEPMOTOR_SPEED "700"
#define STEPMOTOR_DISTANCE "999999"
#define STEPMOTOR_CYCLES_PER_UPDATE 100

GRBLConveyor::GRBLConveyor(TwoWire *wire)
{
    m_grbl = Module_GRBL(STEPMOTOR_I2C_ADDR);
    m_wire = wire;
}

void GRBLConveyor::begin()
{
    m_grbl.Init(m_wire);
    m_desiredStatus = ConveyorStatus::STOPPED;
    m_updateCycle = 0;
}

void GRBLConveyor::start()
{
    m_desiredStatus = ConveyorStatus::RUNNING;
}

void GRBLConveyor::stop()
{
    m_desiredStatus = ConveyorStatus::STOPPED;
}

void GRBLConveyor::update()
{
    if (m_updateCycle++ % STEPMOTOR_CYCLES_PER_UPDATE != 0)
    {
        return;
    }
    m_updateCycle = 0;

    ConveyorStatus current = getCurrentStatus();

    if (current == ConveyorStatus::STOPPED && m_desiredStatus == ConveyorStatus::RUNNING)
    {
        m_grbl.sendGcode("G91"); // force incremental positioning
        m_grbl.sendGcode("G21"); // Set the unit to milimeters
        m_grbl.sendGcode("G1 X" STEPMOTOR_DISTANCE " Y0 Z0 F" STEPMOTOR_SPEED);
    }
    else if (current == ConveyorStatus::RUNNING && m_desiredStatus == ConveyorStatus::STOPPED)
    {
        m_grbl.unLock();
    }
}

ConveyorStatus GRBLConveyor::getCurrentStatus()
{
    return m_grbl.readIdle() ? ConveyorStatus::STOPPED : ConveyorStatus::RUNNING;
}

ConveyorStatus GRBLConveyor::getDesiredStatus()
{
    return m_desiredStatus;
}
