#include "MaintenanceMode.hpp"
#include "Logger.hpp"

void MaintenanceMode::begin()
{
    LOG_DEBUG("[MAINT.] Starting...\n");
}

void MaintenanceMode::stop()
{
    LOG_DEBUG("[MAINT.] Stopping\n");
}

void MaintenanceMode::changeModule(int range)
{
  if(range >= 0 && range <= 3) {
      switch (range) {
          case 0 : m_currentActiveModule = ActiveModule::CONVEYOR; break;
          case 1 : m_currentActiveModule = ActiveModule::SORTER; break;
          case 2 : m_currentActiveModule = ActiveModule::TAG_READER; break;
          case 3 : m_currentActiveModule = ActiveModule::DOLIBARR; break;
          default: m_currentActiveModule = ActiveModule::NONE;
      }
  }
}

void MaintenanceMode::changeRange(int increment)
{
  m_range += increment;
}

ActiveModule MaintenanceMode::getCurrentModule(){ return m_currentActiveModule; }
int MaintenanceMode::getRange(){ return m_range; }
