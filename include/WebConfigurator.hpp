#ifndef _WEB_CONFIGURATOR_HPP_
#define _WEB_CONFIGURATOR_HPP_

#include <WebConfig.h>

class WebConfigurator {
public:
  WebConfigurator() = default;

  void configure();

  /// @brief Listen on port 80
  void serverListen();
  /// @brief Close the web server
  void serverClose();

  /// @brief Handle client (must be in a for loop)
  void handleClient();

  const char* getApSsid();

  const char* getApPassword();

  const char* getApiUrl();
  const char* getApiKey();
  int getApiWarhouseError();

  int getConveyorSpeed();

private:
  WebServer m_server;
  WebConfig m_conf;
};

#endif  // _WEB_CONFIGURATOR_HPP_
