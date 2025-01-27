#include <doctest.h>

#include "SimProcess.hpp"
#include "sim/Client.hpp"
#include "sim/ClientThread.hpp"
#include "sim/Controller.hpp"
#include "sim/ControllerThread.hpp"
#include "sim/Message.hpp"

TEST_CASE("Spawn TheTranslation") {
  SimProcess process;
  REQUIRE_EQ(process.spawn(), 0);

  sim::ClientThread clientThread;
  std::shared_ptr<sim::Client> client = clientThread.getClient();

  sim::ControllerThread controllerThread(client);
  std::shared_ptr<sim::Controller> ctrl = controllerThread.getController();
  ctrl->registerDefaultReceiveHandlers();

  S2CMessage message;
  REQUIRE_MESSAGE(ctrl->awaitConnection(), "Failed to connect to the server, timed out");
  ctrl->awaitSimulationReady();

  SUBCASE("Production mode - start and stop conveyor") {
    // Conveyor should start when 'A' is pressed
    bool started = ctrl->expectReceive(S2COpcode::CONVEYOR_SET_SPEED, [ctrl] { ctrl->pressButton(0); }, &message);
    CHECK_UNARY(started);
    CHECK_GT(message.conveyorSetSpeed, 0);

    // Conveyor should stop when 'C' is pressed
    bool stopped = ctrl->expectReceive(S2COpcode::CONVEYOR_SET_SPEED, [ctrl] { ctrl->pressButton(2); }, &message);
    CHECK_UNARY(stopped);
    CHECK_EQ(message.conveyorSetSpeed, 0);
  }

  CHECK_EQ(1, 1);
}
