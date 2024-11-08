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
    /// @param key api key
    /// @return default warehouse of the product
    DolibarrClientStatus configure(const char* endpoint, const char* key);

    /// @brief Send product tag to the server
    /// @param barcode barcode of the product
    /// @param[out] product product id associeted with the barcode
    /// @param[out] warehouse default warehouse of the product
    DolibarrClientStatus sendTag(const int barcode, int& product, int& warehouse);
    
    /// @brief Create a stock movement
    /// @param warehouse
    /// @param product 
    /// @param quantity 
    DolibarrClientStatus sendStockMovement(int warehouse, int product, int quantity);

    DolibarrClientStatus getStatus();
private:
    HTTPClient client;
    DolibarrClientStatus status;

    String m_tagEndpoint;
    String m_stockMovementEndpoint;
    String m_key;
};

#endif  // _DOLIBARR_CLIENT_HPP_