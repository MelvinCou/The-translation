#include "simulation/HTTPClient.hpp"

#include <esp_log.h>

#include <SimulationServer.hpp>
#include <WiFi.hpp>
#include <algorithm>
#include <string>
#include <unordered_map>

static const std::unordered_map<int, std::string> HTTP_STATUS_CODES = {
    {100, "Continue"},
    {101, "Switching Protocols"},
    {102, "Processing"},
    {200, "OK"},
    {201, "Created"},
    {202, "Accepted"},
    {203, "Non-Authoritative Information"},
    {204, "No Content"},
    {205, "Reset Content"},
    {206, "Partial Content"},
    {207, "Multi-Status"},
    {208, "Already Reported"},
    {226, "IM Used"},
    {300, "Multiple Choices"},
    {301, "Moved Permanently"},
    {302, "Found"},
    {303, "See Other"},
    {304, "Not Modified"},
    {305, "Use Proxy"},
    {307, "Temporary Redirect"},
    {308, "Permanent Redirect"},
    {400, "Bad Request"},
    {401, "Unauthorized"},
    {402, "Payment Required"},
    {403, "Forbidden"},
    {404, "Not Found"},
    {405, "Method Not Allowed"},
    {406, "Not Acceptable"},
    {407, "Proxy Authentication Required"},
    {408, "Request Timeout"},
    {409, "Conflict"},
    {410, "Gone"},
    {411, "Length Required"},
    {412, "Precondition Failed"},
    {413, "Payload Too Large"},
    {414, "URI Too Long"},
    {415, "Unsupported Media Type"},
    {416, "Range Not Satisfiable"},
    {417, "Expectation Failed"},
    {418, "I'm a teapot"},
    {421, "Misdirected Request"},
    {422, "Unprocessable Entity"},
    {423, "Locked"},
    {424, "Failed Dependency"},
    {425, "Too Early"},
    {426, "Upgrade Required"},
    {428, "Precondition Required"},
    {429, "Too Many Requests"},
    {431, "Request Header Fields Too Large"},
    {451, "Unavailable For Legal Reasons"},
    {500, "Internal Server Error"},
    {501, "Not Implemented"},
    {502, "Bad Gateway"},
    {503, "Service Unavailable"},
    {504, "Gateway Timeout"},
    {505, "HTTP Version Not Supported"},
    {506, "Variant Also Negotiates"},
    {507, "Insufficient Storage"},
    {508, "Loop Detected"},
    {510, "Not Extended"},
    {511, "Network Authentication Required"},
};

HTTPClient::HTTPClient() : m_responseNotification(xSemaphoreCreateBinary()) {
  SimServer.registerHttpOnResponse([this](uint32_t reqId, std::vector<char> res) {
    {
      std::unique_lock<std::mutex> lock(m_responseLock);
      m_response = res;
      m_responseReqId = reqId;
    }
    xSemaphoreGive(m_responseNotification);
  });
}

HTTPClient::~HTTPClient() { vSemaphoreDelete(m_responseNotification); }

void HTTPClient::useHTTP10() { m_useHTTP10 = true; }

static bool checkWifi() {
  if (WiFiClass::getMode() != WIFI_MODE_STA) {
    ESP_LOGE("CLIENT", "WiFi not in STA mode, cannot send HTTP requests, current: %d", static_cast<int>(WiFiClass::getMode()));
    return false;
  }
  if (WiFiClass::status() != WL_CONNECTED) {
    ESP_LOGE("CLIENT", "WiFi not connected, cannot send HTTP requests, current: %d", static_cast<int>(WiFiClass::status()));
    return false;
  }
  return true;
}

void HTTPClient::begin(String const& url) {
  m_reqId++;

  if (url.find("http://") != 0) {
    ESP_LOGE("CLIENT", "only http:// scheme is supported");
    return;
  } else if (!checkWifi()) {
    return;
  }
  auto const end = url.cend();
  auto const hostBegin = url.cbegin() + 7;
  auto const pathBegin = std::find(hostBegin, end, '/');
  auto const portBegin = std::find(hostBegin, pathBegin, ':');

  int port = portBegin == end ? 80 : std::stoi(std::string(portBegin + 1, pathBegin));
  auto host = std::string(hostBegin, portBegin == end ? pathBegin : portBegin);

  m_lastResponseBody.clear();
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

std::vector<char> HTTPClient::encodeRequest(char const* verb) {
  std::vector<char> buf;
  const auto httpVersion = m_useHTTP10 ? " HTTP/1.0\r\n" : " HTTP/1.1\r\n";

  // HTTP Request line
  buf.reserve(strlen(verb) + 1 + m_path.length() + strlen(httpVersion));
  buf.insert(buf.end(), verb, verb + strlen(verb));
  buf.push_back(' ');
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

void HTTPClient::writeFullRequest(std::vector<char> const& buf) {
  uint32_t reqId = m_reqId;

  // Send message chunk by chunk
  size_t offset = 0;
  while (offset < buf.size()) {
    offset += SimServer.sendHttpWrite(reqId, buf.data() + offset, buf.size() - offset);
  }
}

int HTTPClient::GET() {
  if (!checkWifi()) {
    return -1;
  }
  std::vector<char> const buf = encodeRequest("GET");
  writeFullRequest(buf);
  SimServer.sendHttpEnd(m_reqId);
  std::vector<char> const res = awaitResponse(m_reqId);
  return parseResponse(res);
}

int HTTPClient::POST(String body) {
  if (!checkWifi()) {
    return -1;
  }
  m_headers["Content-Length"] = std::to_string(body.length());
  std::vector<char> buf = encodeRequest("POST");
  buf.insert(buf.end(), body.begin(), body.end());
  writeFullRequest(buf);
  SimServer.sendHttpEnd(m_reqId);
  std::vector<char> const res = awaitResponse(m_reqId);
  return parseResponse(res);
}

String const& HTTPClient::getStream() const { return m_lastResponseBody; }

String HTTPClient::errorToString(int error) {
  auto it = HTTP_STATUS_CODES.find(error);
  if (it != HTTP_STATUS_CODES.end()) {
    return it->second;
  }
  return "Unknown response";
}

std::vector<char> HTTPClient::awaitResponse(uint32_t reqId) {
  std::vector<char> res;

  if (xSemaphoreTake(m_responseNotification, pdMS_TO_TICKS(3000)) == pdTRUE) {
    std::unique_lock<std::mutex> lock(m_responseLock);
    if (reqId == m_responseReqId) {
      std::swap(res, m_response);
      m_response.clear();
      m_responseReqId = 0;
    } else {
      ESP_LOGE("CLIENT", "Unexpected response for request: expected %u, got %u", reqId, m_responseReqId);
    }
  } else {
    ESP_LOGE("CLIENT", "HTTP response timeout after 3s");
  }
  return res;
}

int HTTPClient::parseResponse(std::vector<char> const& res) {
  if (res.size() < 12) {
    return HTTP_CODE_NOT_FOUND;
  }
  int code = std::stoi(std::string(res.begin() + 9, res.begin() + 12));
  char const* separator = "\r\n\r\n";
  auto it = std::search(res.begin(), res.end(), separator, separator + 4);
  if (it != res.end()) {
    m_lastResponseBody = std::string(it + 4, res.end());
  } else {
    m_lastResponseBody.clear();
  }
  return code;
}
