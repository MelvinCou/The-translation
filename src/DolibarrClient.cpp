#include <ArduinoJson.h>

#include "DolibarrClient.hpp"
#include "Logger.hpp"
#include "TheTranslationConfig.hpp"

DolibarrClientStatus DolibarrClient::configure(const char* endpoint, const char* key) {
    status = DolibarrClientStatus::CONFIGURING;
    
    // We need to use http 1.0, otherwise connection is unstable (connection lost error)
    client.useHTTP10();

    String statusEndpoint = String(endpoint);
    bool _ = statusEndpoint.concat("/status");
    client.begin(statusEndpoint);
    client.addHeader("DOLAPIKEY", key);

    int httpCode = client.GET();

    statusEndpoint.clear();

    if(httpCode <= 0) {
        status = DolibarrClientStatus::ERROR;
        LOG_ERROR("[HTTP] Invalid endpoint %s\n", endpoint);
    } else if(httpCode >= HTTP_CODE_BAD_REQUEST) {
        status = DolibarrClientStatus::ERROR;
        LOG_ERROR("[HTTP] Invalid endpoint %s or api key %s\n", endpoint, key);
    } else {
        status = DolibarrClientStatus::READY;
        if(tagEndpoint != nullptr) {
            tagEndpoint.clear();
            bool _ = tagEndpoint.concat(endpoint);
            _ = tagEndpoint.concat("/products?limit=1&mode=1&sqlfilters=(t.barcode%3A%3D%3A'");
        } else {
            tagEndpoint = String(endpoint);
            bool _ = tagEndpoint.concat("/products?limit=1&mode=1&sqlfilters=(t.barcode%3A%3D%3A'");
        }
        
        if(stockMovementEndpoint != nullptr) {
            stockMovementEndpoint.clear();
            bool _ = stockMovementEndpoint.concat(endpoint);
            _ = stockMovementEndpoint.concat("/stockmovements");
        } else {
            stockMovementEndpoint = String(endpoint);
            bool _ = stockMovementEndpoint.concat("/stockmovements");
        }

        this->key = key;
    }

    client.end();

    return status;
}

DolibarrClientStatus DolibarrClient::getStatus() {
    return status;
}
