#ifndef SIMULATION_HTTP_CLIENT_HPP
#define SIMULATION_HTTP_CLIENT_HPP

#include <Arduino.h>
#include <freertos/FreeRTOS.h>
#include <freertos/semphr.h>

#include <mutex>
#include <unordered_map>
#include <vector>

typedef enum {
  HTTP_CODE_CONTINUE = 100,
  HTTP_CODE_SWITCHING_PROTOCOLS = 101,
  HTTP_CODE_PROCESSING = 102,
  HTTP_CODE_OK = 200,
  HTTP_CODE_CREATED = 201,
  HTTP_CODE_ACCEPTED = 202,
  HTTP_CODE_NON_AUTHORITATIVE_INFORMATION = 203,
  HTTP_CODE_NO_CONTENT = 204,
  HTTP_CODE_RESET_CONTENT = 205,
  HTTP_CODE_PARTIAL_CONTENT = 206,
  HTTP_CODE_MULTI_STATUS = 207,
  HTTP_CODE_ALREADY_REPORTED = 208,
  HTTP_CODE_IM_USED = 226,
  HTTP_CODE_MULTIPLE_CHOICES = 300,
  HTTP_CODE_MOVED_PERMANENTLY = 301,
  HTTP_CODE_FOUND = 302,
  HTTP_CODE_SEE_OTHER = 303,
  HTTP_CODE_NOT_MODIFIED = 304,
  HTTP_CODE_USE_PROXY = 305,
  HTTP_CODE_TEMPORARY_REDIRECT = 307,
  HTTP_CODE_PERMANENT_REDIRECT = 308,
  HTTP_CODE_BAD_REQUEST = 400,
  HTTP_CODE_UNAUTHORIZED = 401,
  HTTP_CODE_PAYMENT_REQUIRED = 402,
  HTTP_CODE_FORBIDDEN = 403,
  HTTP_CODE_NOT_FOUND = 404,
  HTTP_CODE_METHOD_NOT_ALLOWED = 405,
  HTTP_CODE_NOT_ACCEPTABLE = 406,
  HTTP_CODE_PROXY_AUTHENTICATION_REQUIRED = 407,
  HTTP_CODE_REQUEST_TIMEOUT = 408,
  HTTP_CODE_CONFLICT = 409,
  HTTP_CODE_GONE = 410,
  HTTP_CODE_LENGTH_REQUIRED = 411,
  HTTP_CODE_PRECONDITION_FAILED = 412,
  HTTP_CODE_PAYLOAD_TOO_LARGE = 413,
  HTTP_CODE_URI_TOO_LONG = 414,
  HTTP_CODE_UNSUPPORTED_MEDIA_TYPE = 415,
  HTTP_CODE_RANGE_NOT_SATISFIABLE = 416,
  HTTP_CODE_EXPECTATION_FAILED = 417,
  HTTP_CODE_MISDIRECTED_REQUEST = 421,
  HTTP_CODE_UNPROCESSABLE_ENTITY = 422,
  HTTP_CODE_LOCKED = 423,
  HTTP_CODE_FAILED_DEPENDENCY = 424,
  HTTP_CODE_UPGRADE_REQUIRED = 426,
  HTTP_CODE_PRECONDITION_REQUIRED = 428,
  HTTP_CODE_TOO_MANY_REQUESTS = 429,
  HTTP_CODE_REQUEST_HEADER_FIELDS_TOO_LARGE = 431,
  HTTP_CODE_INTERNAL_SERVER_ERROR = 500,
  HTTP_CODE_NOT_IMPLEMENTED = 501,
  HTTP_CODE_BAD_GATEWAY = 502,
  HTTP_CODE_SERVICE_UNAVAILABLE = 503,
  HTTP_CODE_GATEWAY_TIMEOUT = 504,
  HTTP_CODE_HTTP_VERSION_NOT_SUPPORTED = 505,
  HTTP_CODE_VARIANT_ALSO_NEGOTIATES = 506,
  HTTP_CODE_INSUFFICIENT_STORAGE = 507,
  HTTP_CODE_LOOP_DETECTED = 508,
  HTTP_CODE_NOT_EXTENDED = 510,
  HTTP_CODE_NETWORK_AUTHENTICATION_REQUIRED = 511
} t_http_codes;

class HTTPClient {
 public:
  HTTPClient();
  ~HTTPClient();
  void useHTTP10();

  void begin(String const &url);
  void end();

  void addHeader(String const &name, String const &value);

  int GET();
  int POST(String body);

  String const &getStream() const;

  static String errorToString(int error);

 private:
  bool m_useHTTP10 = false;
  std::string m_path;
  std::unordered_map<std::string, std::string> m_headers;
  uint32_t m_reqId = 0;
  String m_lastResponseBody;

  SemaphoreHandle_t m_responseNotification;
  std::mutex m_responseLock;
  std::vector<char> m_response;
  uint32_t m_responseReqId = 0;

  std::vector<char> encodeRequest(char const *verb);
  void writeFullRequest(std::vector<char> const &buf);
  std::vector<char> awaitResponse(uint32_t reqId);
  int parseResponse(std::vector<char> const &res);
};

#endif  // !defined(SIMULATION_HTTP_CLIENT_HPP)
