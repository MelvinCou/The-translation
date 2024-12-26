#include "simulation/HTTPClient.hpp"

#include <esp_log.h>

#include <SimulationMessage.hpp>
#include <SimulationServer.hpp>
#include <algorithm>
#include <taskUtil.hpp>

void HTTPClient::useHTTP10() { m_useHTTP10 = true; }

void HTTPClient::begin(String const& url) {
  m_reqId++;

  if (url.find("http://") != 0) {
    ESP_LOGE("CLIENT", "only http:// scheme is supported");
    return;
  }
  auto const end = url.cend();
  auto const hostBegin = url.cbegin() + 7;
  auto const pathBegin = std::find(hostBegin, end, '/');
  auto const portBegin = std::find(hostBegin, pathBegin, ':');

  int port = portBegin == end ? 80 : std::stoi(std::string(portBegin + 1, pathBegin));
  auto host = std::string(hostBegin, portBegin == end ? pathBegin : portBegin);

  SimServer.sendHttpBegin(m_reqId, port, host.c_str(), host.length());
  m_path = std::string(pathBegin, end);
}

void HTTPClient::end() {
  m_path.clear();
  m_headers.clear();
}

void HTTPClient::addHeader(String const& name, String const& value) {
  ESP_LOGI("CLIENT", "Adding header [%s]: [%s]", name.c_str(), value.c_str());
  m_headers[name] = value;
}

std::vector<char> HTTPClient::encodeRequest() {
  std::vector<char> buf;
  constexpr auto verb = "GET ";
  const auto httpVersion = m_useHTTP10 ? " HTTP/1.0\r\n" : " HTTP/1.1\r\n";

  // HTTP Request line
  buf.reserve(strlen(verb) + m_path.length() + strlen(httpVersion));
  buf.insert(buf.end(), verb, verb + strlen(verb));
  buf.insert(buf.end(), m_path.begin(), m_path.end());
  buf.insert(buf.end(), httpVersion, httpVersion + strlen(httpVersion));

  // HTTP Headers
  for (auto it = m_headers.begin(); it != m_headers.end(); ++it) {
    const auto& name = it->first;
    const auto& value = it->second;

    buf.reserve(buf.size() + name.length() + 2 + value.length() + 2);
    buf.insert(buf.end(), name.begin(), name.end());
    buf.push_back(':');
    buf.push_back(' ');
    buf.insert(buf.end(), value.begin(), value.end());
    buf.push_back('\r');
    buf.push_back('\n');
  }

  // End of headers
  buf.push_back('\r');
  buf.push_back('\n');
  return buf;
}

static int parseStatusCode(std::vector<char> const& res) {
  if (res.size() < 12) {
    return HTTP_CODE_NOT_FOUND;
  }
  return std::stoi(std::string(res.begin() + 9, res.begin() + 12));
}

int HTTPClient::GET() {
  std::vector<char> buf = encodeRequest();
  uint32_t reqId = m_reqId;

  // Send message chunk by chunk
  size_t offset = 0;
  while (offset < buf.size()) {
    offset += SimServer.sendHttpWrite(reqId, buf.data() + offset, buf.size() - offset);
  }
  SimServer.sendHttpEnd(reqId);
  std::vector<char> res = awaitResponse(reqId);
  return parseStatusCode(res);
}

int HTTPClient::POST(String body) { return HTTP_CODE_OK; }

String HTTPClient::errorToString([[maybe_unused]] int error) { return "(SOME HTTP ERROR)"; }

std::vector<char> HTTPClient::awaitResponse(uint32_t reqId) {
  std::vector<char> res;

  while ((res = SimServer.popHttpResponse(reqId)).empty()) {
    if (!interruptibleTaskPauseMs(50)) {
      return {};
    }
  }
  return res;
}