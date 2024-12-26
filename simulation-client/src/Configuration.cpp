#include "Configuration.hpp"

#include <cstring>
#include <fstream>
#include <unordered_map>

#include "SimulationClient.hpp"
#include "SimulationMessage.hpp"

ConfigField::ConfigField() : type(CONFIG_FIELD_TYPE_TEXT), textValue{} { memset(textValue, 0, sizeof(textValue)); }

void ConfigField::resetToDefault() {
  if (type == CONFIG_FIELD_TYPE_TEXT || type == CONFIG_FIELD_TYPE_PASSWORD) {
    strncpy(textValue, defaultValue.c_str(), sizeof(textValue));
  } else if (type == CONFIG_FIELD_TYPE_INT) {
    intValue = std::stoi(defaultValue);
  }
}

bool ConfigField::isDefault() const {
  if (type == CONFIG_FIELD_TYPE_TEXT || type == CONFIG_FIELD_TYPE_PASSWORD) {
    return strcmp(textValue, defaultValue.c_str()) == 0;
  }
  if (type == CONFIG_FIELD_TYPE_INT) {
    return intValue == std::stoi(defaultValue);
  }
  return true;
}

Configuration::Configuration() : m_exposed(false) {}

void Configuration::resetSchema() { m_fields.clear(); }

void Configuration::define(S2CMessage const &msg) {
  ConfigField field;
  auto const buf = reinterpret_cast<char const *>(msg.configSchemaDefine.buf);
  field.type = msg.configSchemaDefine.type;
  field.name = std::string(buf, msg.configSchemaDefine.nameLen);
  field.label = std::string(buf + msg.configSchemaDefine.nameLen, msg.configSchemaDefine.labelLen);
  field.defaultValue =
      std::string(buf + msg.configSchemaDefine.nameLen + msg.configSchemaDefine.labelLen, msg.configSchemaDefine.defaultLen);
  field.resetToDefault();
  m_fields.push_back(field);
}

bool Configuration::isExposed() const { return m_exposed; }

void Configuration::setExposed(bool exposed) { m_exposed = exposed; }

std::vector<ConfigField> &Configuration::getFields() { return m_fields; }

void Configuration::applyChanges(SimulationClient &client) {
  for (auto &field : m_fields) {
    if (field.changed) {
      sendSetValue(client, field);
      field.changed = false;
    }
  }
}

void Configuration::saveToFile(std::string const &filename) {
  printf("Saving configuration to file: %s\n", filename.c_str());

  std::ofstream file(filename);
  if (!file.is_open()) {
    fprintf(stderr, "Failed to open configuration file for writing: %s\n", filename.c_str());
    return;
  }

  for (const auto &field : m_fields) {
    if (field.type == CONFIG_FIELD_TYPE_TEXT || field.type == CONFIG_FIELD_TYPE_PASSWORD) {
      file << field.name << "=" << field.textValue << "\n";
    } else if (field.type == CONFIG_FIELD_TYPE_INT) {
      file << field.name << "=" << field.intValue << "\n";
    }
  }

  file.close();
  printf("Finished saving configuration!\n");
}

void Configuration::loadFromFile(std::string const &filename) {
  printf("Loading configuration from file: %s\n", filename.c_str());

  std::ifstream file(filename);
  if (!file.is_open()) {
    fprintf(stderr, "Failed to open configuration file: %s\n", filename.c_str());
  }

  std::unordered_map<std::string, std::string> config;

  std::string line;
  while (std::getline(file, line)) {
    size_t sep = line.find('=');
    if (sep == std::string::npos) {
      fprintf(stderr, "ignoring config line: %s\n", line.c_str());
      continue;
    }
    std::string key = line.substr(0, sep);
    std::string value = line.substr(sep + 1);
    config[key] = value;
  }

  for (auto &field : m_fields) {
    auto res = config.find(field.name);
    if (res == config.end()) {
      field.resetToDefault();
      fprintf(stderr, "No value found for config field: %s\n", field.name.c_str());
      continue;
    }
    if (field.type == CONFIG_FIELD_TYPE_TEXT || field.type == CONFIG_FIELD_TYPE_PASSWORD) {
      strncpy(field.textValue, res->second.c_str(), sizeof(field.textValue));
    } else if (field.type == CONFIG_FIELD_TYPE_INT) {
      field.intValue = std::stoi(res->second);
    }
  }

  file.close();
  printf("Finished loading configuration!\n");
}

void Configuration::doFullConfigRead(SimulationClient &client) {
  printf("Sending full config read to client\n");
  for (auto const &field : m_fields) {
    sendSetValue(client, field);
  }
  client.sendConfigFullReadEnd();
  printf("Done sending full config read to client\n");
}

void Configuration::sendSetValue(SimulationClient &client, ConfigField const &field) {
  if (field.type == CONFIG_FIELD_TYPE_TEXT || field.type == CONFIG_FIELD_TYPE_PASSWORD) {
    client.sendConfigSetValue(field.name.c_str(), field.textValue);
  } else if (field.type == CONFIG_FIELD_TYPE_INT) {
    client.sendConfigSetValue(field.name.c_str(), std::to_string(field.intValue).c_str());
  } else {
    fprintf(stderr, "Cannot send value for unknown field type: %d\n", field.type);
  }
}
