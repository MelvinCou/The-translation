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

    /// @brief Send product tag to the server
    /// @param product
    /// @return default warehouse of the product
    virtual int sendTag(int product) = 0;
    
    /// @brief Create a stock movement
    /// @param warehouse_source 
    /// @param warehouse_destination 
    /// @param product 
    /// @param quantity 
    virtual void sendStockMovement(int warehouse_source, int warehouse_destination, int product, int quantity) = 0;

    virtual HttpClientStatus getStatus() = 0;
};

#endif  // _HTTP_CLIENT_HPP_