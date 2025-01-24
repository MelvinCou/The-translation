#ifndef ACTIVE_MODULE_HPP
#define ACTIVE_MODULE_HPP

enum class ActiveModule { NONE = 0, CONVEYOR, SORTER, TAG_READER, DOLIBARR, EOL_SENSOR };

static constexpr ActiveModule ACTIVE_MODULES[] = {ActiveModule::NONE,       ActiveModule::CONVEYOR, ActiveModule::SORTER,
                                                  ActiveModule::TAG_READER, ActiveModule::DOLIBARR, ActiveModule::EOL_SENSOR};
static constexpr size_t ACTIVE_MODULES_SIZE = sizeof(ACTIVE_MODULES) / sizeof(ACTIVE_MODULES[0]);
static constexpr char const *ACTIVE_MODULE_NAMES[6] = {"NONE", "CONVEYOR", "SORTER", "TAG_READER", "DOLIBARR", "EOL_SENSOR"};

#endif  // !defined(ACTIVE_MODULE_HPP)
