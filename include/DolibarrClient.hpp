#ifndef _DOLIBARR_CLIENT_HPP_
#define _DOLIBARR_CLIENT_HPP_

#include <HTTPClient.h>

enum class DolibarrClientStatus {
    CONFIGURING = 0,
    READY,
    SENDING,
    ERROR
};

class DolibarrClient {
public:
    DolibarrClient() = default;
    ~DolibarrClient() = default;

    /// @brief Configure the 
    /// @param endpoint base url of the Dolibarr server
    /// @param endpoint api key
    /// @return default warehouse of the product
    DolibarrClientStatus configure(const char* endpoint, const char* key);

    /// @brief Send product tag to the server
    /// @param barcode barcode of the product
    /// @param product product id associeted with the barecode
    /// @param warehouse default warehouse of the product
    void sendTag(const String barcode, int& product, int& warehouse);
    
    /// @brief Create a stock movement
    /// @param warehouse_source 
    /// @param product 
    /// @param quantity 
    void sendStockMovement(int warehouse_source, int product, int quantity);

    DolibarrClientStatus getStatus();
private:
    HTTPClient client;
    DolibarrClientStatus status;

    String tagEndpoint;
    String stockMovementEndpoint;
    String key;
};

#endif  // _DOLIBARR_CLIENT_HPP_