#ifndef ACTIVE_MODULE_HPP
#define ACTIVE_MODULE_HPP

enum class ActiveModule { NONE = 0, CONVEYOR, SORTER, TAG_READER, DOLIBARR };

static constexpr char const *ACTIVE_MODULES[5] = {"NONE", "CONVEYOR", "SORTER", "TAG_READER", "DOLIBARR"};

#endif  // !defined(ACTIVE_MODULE_HPP)
