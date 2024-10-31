#include <ArduinoJson.h>

#include "DolibarrClient.hpp"
#include "Logger.hpp"
#include "TheTranslationConfig.hpp"

DolibarrClientStatus DolibarrClient::configure(const char* endpoint, const char* key) {
    status = DolibarrClientStatus::CONFIGURING;
    
    // We need to use http 1.0, otherwise connection is unstable (connection lost error)
    client.useHTTP10();

    String statusEndpoint = String(endpoint);
    bool _ = statusEndpoint.concat(DOLIBARR_ENDPOINT_STATUS);
    client.begin(statusEndpoint);
    client.addHeader(DOLIBARR_HEADER_APIKEY, key);

    int httpCode = client.GET();

    client.end();
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
            _ = tagEndpoint.concat(DOLIBARR_ENDPOINT_PRODUCTS);
        } else {
            tagEndpoint = String(endpoint);
            bool _ = tagEndpoint.concat(DOLIBARR_ENDPOINT_PRODUCTS);
        }
        
        if(stockMovementEndpoint != nullptr) {
            stockMovementEndpoint.clear();
            bool _ = stockMovementEndpoint.concat(endpoint);
            _ = stockMovementEndpoint.concat(DOLIBARR_ENDPOINT_STOCKMOVEMENTS);
        } else {
            stockMovementEndpoint = String(endpoint);
            bool _ = stockMovementEndpoint.concat(DOLIBARR_ENDPOINT_STOCKMOVEMENTS);
        }

        this->key = key;
    }

    return status;
}

DolibarrClientStatus DolibarrClient::getStatus() {
    return status;
}

void DolibarrClient::sendTag(const String barcode, int& product, int& warehouse) {
    status = DolibarrClientStatus::SENDING;

    String endpoint = String(tagEndpoint);
    bool _ = endpoint.concat(barcode);
    _ = endpoint.concat(DOLIBARR_ENDPOINT_PRODUCTS_END);

    client.begin(endpoint);
    client.addHeader(DOLIBARR_HEADER_APIKEY, key);

    int httpCode = client.GET();
    endpoint.clear();

    if (httpCode == HTTP_CODE_OK)
    {
        JsonDocument doc;
        DeserializationError error = deserializeJson(doc, client.getStream());
        client.end();

        if(error) {
            status = DolibarrClientStatus::ERROR;
            LOG_ERROR("[HTTP] Error deserializing sendTag payload: %s\n", error.c_str());
            warehouse = DOLIBARR_WAREHOUSE_ERROR;
        } else {
            product = doc[0]["id"].as<int>();
            warehouse = doc[0]["fk_default_warehouse"].as<int>();

            LOG_DEBUG("[HTTP] barecode %s: id %u ; warehouse %u \n", barcode.c_str(), product, warehouse);
            status = DolibarrClientStatus::READY;
        }
    } else {
        status = DolibarrClientStatus::ERROR;
        
        LOG_ERROR("[HTTP] Error during sendTag request: %s\n", client.errorToString(httpCode).c_str());
        client.end();

        warehouse = DOLIBARR_WAREHOUSE_ERROR;
    }
}

void DolibarrClient::sendStockMovement(int warehouse_source, int product, int quantity) {
    status = DolibarrClientStatus::SENDING;

    // Prepare JSON document
    String body;
    JsonDocument doc;
    doc["warehouse_id"] = warehouse_source;
    doc["product_id"] = product;
    doc["qty"] = quantity;

    unsigned int _ = serializeJson(doc, body);

    client.begin(stockMovementEndpoint);
    client.addHeader(DOLIBARR_HEADER_APIKEY, key);

    int httpCode = client.POST(body);

    if (httpCode == HTTP_CODE_OK)
    {
        status = DolibarrClientStatus::READY;
    } else {
        status = DolibarrClientStatus::ERROR;
        
        LOG_ERROR("[HTTP] Error during sendTag request: %s\n", client.errorToString(httpCode).c_str());
    }

    client.end();
}