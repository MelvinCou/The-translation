#ifndef HTTP_PROXY_HPP
#define HTTP_PROXY_HPP

#include <cstddef>
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>

namespace sim {
class Client;

/// @brief Converts HTTP-related C2S/S2C messages to actual HTTP requests and responses to the outside world.
class HttpProxy {
 public:
  void begin(uint32_t reqId, char const* host, size_t hostLen, uint16_t port);
  void append(uint32_t reqId, char const* buf, size_t len);
  void end(uint32_t reqId, Client& client);
  void setEnabled(bool enabled);

 private:
  struct Request {
    uint32_t id;
    std::string host;
    uint16_t port;
    std::vector<char> data;
  };
  std::unordered_map<uint32_t, Request> m_partialHttpRequests;
  bool m_enabled = true;

  std::vector<char> sendRequest(Request const& req);
  void sendResponse(Request const& req, std::vector<char> const& res, Client& client);
};
}  // namespace sim

#endif  // !defined(HTTP_PROXY_HPP)
