#include <doctest.h>

#include "SimProcess.hpp"
#include "sim/Client.hpp"
#include "sim/ClientThread.hpp"

TEST_CASE("Spawn TheTranslation") {
  SimProcess process;
  REQUIRE_EQ(process.spawn(), 0);

  sim::ClientThread clientThread;
  sim::Client &client = clientThread.getClient();

  std::this_thread::sleep_for(std::chrono::seconds(2));
  CHECK_EQ(1, 1);
}
