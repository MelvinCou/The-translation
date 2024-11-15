#include "Modes.hpp"
#include "Logger.hpp"

void Mode::begin()
{
  LOG_DEBUG("[MODE] Initializing...\n");
  // configuration mode is the default
  m_modeType = ModeTypes::CONFIGURATION;
}

void Mode::startConfiguration()
{
  m_modeType = ModeTypes::CONFIGURATION;
  LOG_DEBUG("[MODE] Configuration mode \n");
}

void Mode::startMaintenance()
{
  m_modeType = ModeTypes::MAINTENANCE;
  LOG_DEBUG("[MODE] Production mode \n");
}

void Mode::startProduction()
{
  m_modeType = ModeTypes::PRODUCTION;
  LOG_DEBUG("[MODE] Production mode \n");
}