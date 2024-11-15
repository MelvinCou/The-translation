#include "WebConfigurator.hpp"

#include "Logger.hpp"

#define AP_SSID "ap_ssid"
#define AP_PASSWORD "ap_password"

#define API_URL "api_url"
#define API_KEY "api_key"
#define API_WAREHOUSE "api_warehouse"

#define CONVEYOR_SPEED "conveyor_speed"

// clang-format off

const String params = "["
  "{"
    "'name':'"+String(AP_SSID)+"',"
    "'label':'Name of SSID',"
    "'type':"+String(INPUTTEXT)+","
    "'default':''"
  "},"
  "{"
    "'name':'"+AP_PASSWORD+"',"
    "'label':'SSID Password',"
    "'type':"+String(INPUTPASSWORD)+","
    "'default':''"
  "},"
  "{"
    "'name':'"+API_URL+"',"
    "'label':'URL of the Dolibarr API',"
    "'type':"+String(INPUTTEXT)+","
    "'default':'http://...:8080/api/index.php'"
  "},"
  "{"
    "'name':'"+API_KEY+"',"
    "'label':'API key of Dolibarr',"
    "'type':"+String(INPUTPASSWORD)+","
    "'default':''"
  "},"
  "{"
    "'name':'"+API_WAREHOUSE+"',"
    "'label':'Default error warehouse',"
    "'type':"+String(INPUTNUMBER)+","
    "'min':1,'max':3,"
    "'default':'3'"
  "},"
  "{"
    "'name':'"+CONVEYOR_SPEED+"',"
    "'label':'Conveyor speed',"
    "'type':"+String(INPUTNUMBER)+","
    "'min':200,'max':1000,"
    "'default':'350'"
  "}"
  "]";

// clang-format on

void WebConfigurator::configure() {
  m_conf.setDescription(params);
  if (!m_conf.readConfig()) {
    LOG_ERROR("Error reading configuration file");
  }
}

void WebConfigurator::serverListen() {
  m_server.on("/", [this] { m_conf.handleFormRequest(&m_server); });
  m_server.begin(80);
}

void WebConfigurator::serverClose() { m_server.close(); }

void WebConfigurator::handleClient() { m_server.handleClient(); }

const char* WebConfigurator::getApSsid() { return m_conf.getValue(AP_SSID); }

const char* WebConfigurator::getApPassword() { return m_conf.getValue(AP_PASSWORD); }

const char* WebConfigurator::getApiUrl() { return m_conf.getValue(API_URL); }

const char* WebConfigurator::getApiKey() { return m_conf.getValue(API_KEY); }

int WebConfigurator::getApiWarhouseError() { return m_conf.getInt(API_WAREHOUSE); }

int WebConfigurator::getConveyorSpeed() { return m_conf.getInt(CONVEYOR_SPEED); }
