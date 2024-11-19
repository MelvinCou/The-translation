#ifndef MAINTENANCE_MODE_HPP
#define MAINTENANCE_MODE_HPP

enum class ActiveModule
{
  CONVEYOR,
  SORTER,
  TAG_READER,
  DOLIBARR,
  NONE
};

static const char *ACTIVE_MODULES_STRINGS[] = {
    "CONVEYOR",
    "SORTER",
    "TAG_READER",
    "DOLIBARR"
};


class MaintenanceMode {
  public:
   MaintenanceMode() = default;
   ~MaintenanceMode() = default;

   void begin();
   void stop();
   void changeModule(int range);
   void changeRange(int number, bool isIncrement);
   ActiveModule getCurrentModule();
   int getRange();

   private:
    ActiveModule m_currentActiveModule = ActiveModule::NONE;
    int m_range = 0;
};

#endif  // !defined(MAINTENANCE_MODE_HPP)