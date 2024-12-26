#ifndef CONFIGURATION_HPP
#define CONFIGURATION_HPP

#include <cstdint>
#include <string>
#include <vector>

class S2CMessage;
class SimulationClient;

#define CONFIG_FIELD_TYPE_TEXT 0
#define CONFIG_FIELD_TYPE_PASSWORD 1
#define CONFIG_FIELD_TYPE_INT 2

#define CONFIG_DEFAULT_PATH "simulation.properties"

struct ConfigField {
  uint8_t type;
  std::string name;
  std::string label;
  std::string defaultValue;
  bool changed;
  union {
    char textValue[64];
    int intValue;
  };

  ConfigField();
  void resetToDefault();
  bool isDefault() const;
};

class Configuration {
 public:
  Configuration();
  void resetSchema();
  void define(S2CMessage const &msg);
  bool isExposed() const;
  void setExposed(bool exposed);
  std::vector<ConfigField> &getFields();
  void applyChanges(SimulationClient &client);
  void saveToFile(std::string const &filename);
  void loadFromFile(std::string const &filename);
  void doFullConfigRead(SimulationClient &client);

 private:
  std::vector<ConfigField> m_fields;
  bool m_exposed;

  void sendSetValue(SimulationClient &client, ConfigField const &field);
};

#endif  // !defined(CONFIGURATION_HPP)
