#ifndef _HTTP_CLIENT_HPP_
#define _HTTP_CLIENT_HPP_

enum class HttpClientStatus {
    CONFIGURING = 0,
    READY,
    SENDING,
    ERROR
};

/// @brief Interface for HTTP client
class IHttpClient {
private:
    HttpClientStatus status;
public:
    virtual ~IHttpClient() = default;

    virtual void setAccessPoint(const char* ssid, const char* password) = 0;
    virtual void setAPI(const char* api_url, const char* api_key) = 0;

    virtual int sendTag(int tag) = 0;
    virtual void sendStockMovement(int warehouse_source, int warehouse_destination, int product, int quantity) = 0;

    virtual HttpClientStatus getStatus() = 0;
};

#endif  // _HTTP_CLIENT_HPP_