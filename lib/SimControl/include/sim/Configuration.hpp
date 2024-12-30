#ifndef SIM_CONFIGURATION_HPP
#define SIM_CONFIGURATION_HPP

#include <cstdint>
#include <string>
#include <vector>

class S2CMessage;
namespace sim {
class Client;

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

/// @brief Process read/write access to the persistent configuration.
class Configuration {
 public:
  Configuration();
  void resetSchema();
  void define(S2CMessage const &msg);
  bool isExposed() const;
  void setExposed(bool exposed);
  std::vector<ConfigField> &getFields();
  void applyChanges(Client &client);
  void saveToFile(std::string const &filename);
  void loadFromFile(std::string const &filename);
  void doFullConfigRead(Client &client);

 private:
  std::vector<ConfigField> m_fields;
  bool m_exposed;

  void sendSetValue(Client &client, ConfigField const &field);
};
}  // namespace sim

#endif  // !defined(SIM_CONFIGURATION_HPP)
