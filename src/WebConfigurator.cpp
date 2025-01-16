#include "WebConfigurator.hpp"

#include "Logger.hpp"

#define AP_SSID "ap_ssid"
#define AP_PASSWORD "ap_password"

#define API_URL "api_url"
#define API_KEY "api_key"
#define API_WAREHOUSE "api_warehouse"

#define CONVEYOR_SPEED "conveyor_speed"

#define EOL_SENSOR_THRESHOLD "eol_sensor_threshold"

#define SORTER_ANGLE_DELAY "sorter_angle_delay"

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
  "},"
  "{"
    "'name':'"+EOL_SENSOR_THRESHOLD+"',"
    "'label':'Max distance (in cm) for object detection',"
    "'type':"+String(INPUTNUMBER)+","
    "'min':0,'max':400,"
    "'default':'2'"
  "},"
  "{"
    "'name':'"+SORTER_ANGLE_DELAY+"',"
    "'label':'Delay (in ms) between each increase/decrease of the sorter angle',"
    "'type':"+String(INPUTNUMBER)+","
    "'min':1,'max':100,"
    "'default':'30'"
  "}"
  "]";

// clang-format on

void WebConfigurator::configure() {
  m_conf.setDescription(params);
  if (!m_conf.readConfig()) {
    LOG_ERROR("Error reading configuration file");
  }
}

void WebConfigurator::reset() {
  // set a json empty argument to clear whole data
  m_conf.setDescription("[]");
  m_conf.writeConfig();
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

int WebConfigurator::getApiWarehouseError() { return m_conf.getInt(API_WAREHOUSE); }

int WebConfigurator::getConveyorSpeed() { return m_conf.getInt(CONVEYOR_SPEED); }

float WebConfigurator::getEolSensorThreshold() { return m_conf.getFloat(EOL_SENSOR_THRESHOLD); }

int WebConfigurator::getSorterAngleDelay() { return m_conf.getInt(SORTER_ANGLE_DELAY); }