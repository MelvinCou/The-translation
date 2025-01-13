#ifndef SIMULATION_WEB_CONFIG_HPP
#define SIMULATION_WEB_CONFIG_HPP

#include <unordered_map>

#include "simulation/Arduino.hpp"
#include "simulation/WebServer.hpp"
#include "simulation/WiFi.hpp"

#define INPUTTEXT "0"
#define INPUTPASSWORD "1"
#define INPUTNUMBER "2"
#define INPUTDATE "3"
#define INPUTTIME "4"
#define INPUTRANGE "5"
#define INPUTCHECKBOX "6"
#define INPUTRADIO "7"
#define INPUTSELECT "8"
#define INPUTCOLOR "9"
#define INPUTFLOAT "10"
#define INPUTTEXTAREA "11"
#define INPUTMULTICHECK "12"

class WebConfig {
 public:
  WebConfig();
  void setDescription(String parameter);

  void handleFormRequest(WebServer* server);

  boolean readConfig();
  boolean writeConfig();

  const char* getValue(const char* name);
  int getInt(const char* name);
  float getFloat(const char* name);

 private:
  std::unordered_map<String, String> m_strings;
  std::unordered_map<String, double> m_numbers;

  bool popValueChange(bool cancelOnFullReadEnd);

  friend class WebServer;
};

#endif  // !defined(SIMULATION_WEB_CONFIG_HPP)
