#include "simulation/WebConfig.hpp"

#include <ArduinoJson.h>
#include <esp_log.h>

#include <SimulationServer.hpp>
#include <taskUtil.hpp>

WebConfig::WebConfig() {}

void WebConfig::setDescription(String parameter) {
  // ESP_LOGW("WebConfig", "setDescription: %s", parameter.c_str());
  JsonDocument schema;
  DeserializationError err = deserializeJson(schema, parameter);

  m_strings.clear();
  m_ints.clear();
  SimServer.sendConfigSchemaReset();
  if (err) {
    ESP_LOGE("WebConfig", "Failed to deserialize config schema: %s", err.c_str());
    return;
  }
  for (JsonVariant item : schema.as<JsonArray>()) {
    uint8_t type = item["type"];
    const char* name = item["name"];
    const char* label = item["label"];
    const char* def = item["default"];

    ESP_LOGI("WebConfig", "(default) name: %s, label: %s, type: %d, default: %s", name, label, type, def);
    if (type == 0 || type == 1) {
      m_strings[name] = def;
    } else if (type == 2) {
      m_ints[name] = atoi(def);
    }
    SimServer.sendConfigSchemaDefine(type, name, label, def);
  }
  SimServer.sendConfigEndDefine();
}

void WebConfig::handleFormRequest(WebServer* server) { server->m_conf = this; }

boolean WebConfig::readConfig() {
  ESP_LOGI("WebConfig", "Requesting full config read from client");
  SimServer.sendConfigFullReadBegin();
  bool cancelled = false;

  while (popValueChange(true) && !cancelled) {
    cancelled = !interruptibleTaskPauseMs(10);
  }
  return !cancelled;
}

boolean WebConfig::writeConfig() {
  // TODO: stub
  return true;
}

const char* WebConfig::getValue(const char* name) {
  const auto res = m_strings.find(name);
  if (res == m_strings.end()) {
    return nullptr;
  }
  return res->second.c_str();
}

int WebConfig::getInt(const char* name) {
  const auto res = m_ints.find(name);
  if (res == m_ints.end()) {
    return 0;
  }
  return res->second;
}

bool WebConfig::popValueChange(bool cancelOnFullReadEnd) {
  C2SMessage msg;

  while (SimServer.popConfigRead(msg)) {
    if (msg.opcode == C2SOpcode::CONFIG_FULL_READ_END) {
      if (cancelOnFullReadEnd) {
        return false;
      }
    } else if (msg.opcode != C2SOpcode::CONFIG_SET_VALUE) {
      ESP_LOGE("WebConfig", "Unexpected message: %s", msg.name());
      continue;
    }
    std::string name(reinterpret_cast<char*>(msg.configSetValue.buf), msg.configSetValue.nameLen);
    std::string value(reinterpret_cast<char*>(msg.configSetValue.buf + msg.configSetValue.nameLen), msg.configSetValue.valueLen);

    auto strRes = m_strings.find(name);
    if (strRes != m_strings.end()) {
      strRes->second = value;
      ESP_LOGI("WebConfig", "Updated string value: %s = %s", name.c_str(), value.c_str());
    } else {
      auto intRes = m_ints.find(name);
      if (intRes != m_ints.end()) {
        intRes->second = atoi(value.c_str());
        ESP_LOGI("WebConfig", "Updated int value: %s = %d", name.c_str(), intRes->second);
      } else {
        ESP_LOGW("WebConfig", "Unknown config field: %s", name.c_str());
      }
    }
  }
  return true;
}
