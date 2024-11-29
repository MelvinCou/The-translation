#ifndef ACTIVEMODULE_HPP
#define ACTIVEMODULE_HPP


enum class ActiveModule {
  NONE=0,
  CONVEYOR,
  SORTER,
  TAG_READER,
  DOLIBARR
};

static char const *ACTIVE_MODULES[5] = {"NONE", "CONVEYOR", "SORTER", "TAG_READER", "DOLIBARR"};

#endif // !defined(ACTIVEMODULE_HPP)