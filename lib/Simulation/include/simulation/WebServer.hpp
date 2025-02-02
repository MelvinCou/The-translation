#ifndef SIMULATION_WEB_SERVER_HPP
#define SIMULATION_WEB_SERVER_HPP

#include <functional>
#include <string>

using Uri = std::string;

class WebConfig;

class WebServer {
 public:
  virtual ~WebServer();
  virtual void begin(uint16_t port);
  virtual void handleClient();

  virtual void close();

  typedef std::function<void(void)> THandlerFunction;
  void on(const Uri &uri, THandlerFunction fn);

 private:
  WebConfig *m_conf;
  friend WebConfig;
};

#endif  // !defined(SIMULATION_WEB_SERVER_HPP)
