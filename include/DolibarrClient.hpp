#ifndef DOLIBARR_CLIENT_HPP_
#define DOLIBARR_CLIENT_HPP_

#ifndef ENV_SIMULATION
#include <HTTPClient.h>
#else
#include <Arduino.h>
#endif  // !defined(ENV_SIMULATION)

enum class DolibarrClientStatus { CONFIGURING = 0, READY, SENDING, ERROR };

class DolibarrClient {
 public:
  DolibarrClient() = default;
  ~DolibarrClient() = default;

  /// @brief Configure the
  /// @param endpoint base url of the Dolibarr server
  /// @param key api key
  /// @param warehouse error warehouse
  /// @return default warehouse of the product
  DolibarrClientStatus configure(const char* endpoint, const char* key, int warehouse);

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

  DolibarrClientStatus getStatus() const;

 private:
#ifndef ENV_SIMULATION
  HTTPClient client;
#endif  // !defined(ENV_SIMULATION)
  DolibarrClientStatus status;

  String m_tagEndpoint;
  String m_stockMovementEndpoint;
  String m_key;
  int m_errorWarehouse;
};

#endif  // DOLIBARR_CLIENT_HPP_