#include "DolibarrClient.hpp"

#include <ArduinoJson.h>

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

  if (httpCode <= 0) {
    status = DolibarrClientStatus::ERROR;
    LOG_ERROR("[HTTP] Invalid endpoint %s\n", endpoint);
  } else if (httpCode >= HTTP_CODE_BAD_REQUEST) {
    status = DolibarrClientStatus::ERROR;
    LOG_ERROR("[HTTP] Invalid endpoint %s or api key %s\n", endpoint, key);
  } else {
    status = DolibarrClientStatus::READY;
    if (m_tagEndpoint != nullptr) {
      m_tagEndpoint.clear();
      bool _ = m_tagEndpoint.concat(endpoint);
      _ = m_tagEndpoint.concat(DOLIBARR_ENDPOINT_PRODUCTS);
    } else {
      m_tagEndpoint = String(endpoint);
      bool _ = m_tagEndpoint.concat(DOLIBARR_ENDPOINT_PRODUCTS);
    }

    if (m_stockMovementEndpoint != nullptr) {
      m_stockMovementEndpoint.clear();
      bool _ = m_stockMovementEndpoint.concat(endpoint);
      _ = m_stockMovementEndpoint.concat(DOLIBARR_ENDPOINT_STOCKMOVEMENTS);
    } else {
      m_stockMovementEndpoint = String(endpoint);
      bool _ = m_stockMovementEndpoint.concat(DOLIBARR_ENDPOINT_STOCKMOVEMENTS);
    }

    m_key = key;
  }

  return status;
}

DolibarrClientStatus DolibarrClient::getStatus() { return status; }

DolibarrClientStatus DolibarrClient::sendTag(const int barcode, int& product, int& warehouse) {
  status = DolibarrClientStatus::SENDING;

  String endpoint = String(m_tagEndpoint);
  bool _ = endpoint.concat(barcode);
  _ = endpoint.concat(DOLIBARR_ENDPOINT_PRODUCTS_END);

  client.begin(endpoint);
  client.addHeader(DOLIBARR_HEADER_APIKEY, m_key);

  int httpCode = client.GET();
  endpoint.clear();

  if (httpCode == HTTP_CODE_OK) {
    JsonDocument doc;
    DeserializationError error = deserializeJson(doc, client.getStream());
    client.end();

    if (error) {
      status = DolibarrClientStatus::ERROR;
      LOG_ERROR("[HTTP] Error deserializing sendTag payload: %s\n", error.c_str());
      warehouse = DOLIBARR_WAREHOUSE_ERROR;
    } else {
      product = doc[0]["id"].as<int>();
      warehouse = doc[0]["fk_default_warehouse"].as<int>();

      LOG_DEBUG("[HTTP] barecode %u: id %u ; warehouse %u \n", barcode, product, warehouse);
      status = DolibarrClientStatus::READY;
    }

    doc.clear();
  } else {
    client.end();
    status = DolibarrClientStatus::ERROR;

    LOG_ERROR("[HTTP] Error during sendTag request: %s\n", client.errorToString(httpCode).c_str());

    warehouse = DOLIBARR_WAREHOUSE_ERROR;
  }

  return status;
}

DolibarrClientStatus DolibarrClient::sendStockMovement(int warehouse, int product, int quantity) {
  status = DolibarrClientStatus::SENDING;

  // Prepare JSON document
  String body;
  JsonDocument doc;
  doc["warehouse_id"] = warehouse;
  doc["product_id"] = product;
  doc["qty"] = quantity;

  unsigned int _ = serializeJson(doc, body);

  client.begin(m_stockMovementEndpoint);
  client.addHeader(DOLIBARR_HEADER_APIKEY, m_key);

  int httpCode = client.POST(body);
  client.end();
  body.clear();
  doc.clear();

  if (httpCode == HTTP_CODE_OK) {
    status = DolibarrClientStatus::READY;
  } else {
    status = DolibarrClientStatus::ERROR;

    LOG_ERROR("[HTTP] Error during sendTag request: %s\n", client.errorToString(httpCode).c_str());
  }

  return status;
}
