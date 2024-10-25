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

int DolibarrClient::sendTag(String barcode) {
    status = DolibarrClientStatus::SENDING;

    int value = -1;
    String endpoint = String(tagEndpoint);
    bool _ = endpoint.concat(barcode);
    _ = endpoint.concat("')");

    client.begin(endpoint);
    client.addHeader("DOLAPIKEY", key);

    int httpCode = client.GET();
    endpoint.clear();

    if (httpCode == HTTP_CODE_OK)
    {
        status = DolibarrClientStatus::READY;
        JsonDocument doc;
        DeserializationError error = deserializeJson(doc, client.getStream());
        client.end();

        if(error) {
            status = DolibarrClientStatus::ERROR;
            LOG_ERROR("[HTTP] Error deserializing sendTag payload: %s\n", error.c_str());
        } else {
            value = doc[0]["fk_default_warehouse"].as<int>();

            LOG_DEBUG("[HTTP] default warehouse of %s: %u\n", barcode.c_str(), value);
        }
    } else {
        status = DolibarrClientStatus::ERROR;
        
        LOG_ERROR("[HTTP] Error during sendTag request: %s\n", client.errorToString(httpCode).c_str());
        client.end();
    }

    return value;
}

