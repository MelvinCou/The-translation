#include "simulation/WebConfig.hpp"

WebConfig::WebConfig() {
  m_strings["ap_ssid"] = "";
  m_strings["ap_password"] = "";
  m_strings["api_key"] = "";
  m_strings["api_url"] = "http://localhost:8080/api/index.php";
  m_ints["api_warehouse"] = 3;
  m_ints["conveyor_speed"] = 350;
}

void WebConfig::setDescription([[maybe_unused]] String parameter) {
  // TODO: stub
}

void WebConfig::handleFormRequest([[maybe_unused]] WebServer* server) {
  // TODO: stub
}

boolean WebConfig::readConfig() {
  // TODO: stub
  return true;
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
