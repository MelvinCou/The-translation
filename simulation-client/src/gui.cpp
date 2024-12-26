#include <Configuration.hpp>

#include "SimulationClient.hpp"
#include "Status.hpp"
#include "imgui.h"

static void helpMarker(const char *desc) {
  ImGui::SameLine();
  ImGui::TextDisabled("(?)");
  if (ImGui::BeginItemTooltip()) {
    ImGui::PushTextWrapPos(ImGui::GetFontSize() * 35.0f);
    ImGui::TextUnformatted(desc);
    ImGui::PopTextWrapPos();
    ImGui::EndTooltip();
  }
}

static void simulationStatusSection(SimulationClient const &client) {
  bool isConnecting = client.getState() == SimulationClient::State::CONNECTING;
  if (isConnecting) {
    ImGui::TextColored({1.f, 0.f, 0.f, 1.f}, "Connecting...");
  } else {
    ImGui::TextColored({0.f, 1.f, 0.f, 1.f}, "Connected!");
  }
}

static void m5StackSection(SimulationClient &client) {
  ImGui::PushStyleColor(ImGuiCol_Button, static_cast<ImVec4>(ImColor::HSV(0, 0.6f, 0.6f)));
  ImGui::PushStyleColor(ImGuiCol_ButtonHovered, static_cast<ImVec4>(ImColor::HSV(0, 0.7f, 0.7f)));
  ImGui::PushStyleColor(ImGuiCol_ButtonActive, static_cast<ImVec4>(ImColor::HSV(0, 0.8f, 0.8f)));
  if (ImGui::Button("Reset")) {
    client.sendReset();
  }
  ImGui::PopStyleColor(3);
  if (ImGui::Button("Button A")) {
    client.sendSetButton(0, false);
  } else if (ImGui::IsItemClicked()) {
    client.sendSetButton(0, true);
  }
  ImGui::SameLine();
  if (ImGui::Button("Button B")) {
    client.sendSetButton(1, false);
  } else if (ImGui::IsItemClicked()) {
    client.sendSetButton(1, true);
  }
  ImGui::SameLine();
  if (ImGui::Button("Button C")) {
    client.sendSetButton(2, false);
  } else if (ImGui::IsItemClicked()) {
    client.sendSetButton(2, true);
  }
}

static void configurationSection(SimulationClient &client, Configuration &config) {
  bool isExposed = config.isExposed();

  if (config.getFields().empty()) {
    ImGui::TextDisabled("No configuration fields defined.");
  }
  if (!config.isExposed()) {
    ImGui::TextDisabled("Not in configuration mode, cannot edit values");
    ImGui::BeginDisabled();
  }

  if (ImGui::Button("Save to file")) {
    config.saveToFile(CONFIG_DEFAULT_PATH);
  }
  ImGui::SameLine();
  if (ImGui::Button("Apply changes")) {
    config.applyChanges(client);
  }

  int i = 0;
  for (auto &field : config.getFields()) {
    bool isDefault = field.isDefault();

    ImGui::PushID(i);
    if (isExposed && isDefault) {
      ImGui::BeginDisabled();
    }
    if (ImGui::Button("Reset")) {
      field.resetToDefault();
    }
    if (isExposed && isDefault) {
      ImGui::EndDisabled();
    }
    ImGui::SameLine();

    bool changed = false;
    if (field.type == CONFIG_FIELD_TYPE_TEXT) {
      changed = ImGui::InputTextWithHint(field.name.c_str(), "<empty>", field.textValue, sizeof(field.textValue), 0);
    } else if (field.type == CONFIG_FIELD_TYPE_PASSWORD) {
      changed =
          ImGui::InputTextWithHint(field.name.c_str(), "<empty>", field.textValue, sizeof(field.textValue), ImGuiInputTextFlags_Password);
    } else if (field.type == CONFIG_FIELD_TYPE_INT) {
      changed = ImGui::InputInt(field.name.c_str(), &field.intValue);
    } else {
      ImGui::Text("%s (unsupported type %u)", field.name.c_str(), field.type);
    }
    helpMarker(field.label.c_str());
    ImGui::PopID();

    if (changed) {
      field.changed = true;
    }
    ++i;
  }
  if (!isExposed) {
    ImGui::EndDisabled();
  }
}

void drawGui(SimulationClient &client, Configuration &config) {
  ImGui::ShowDemoWindow(nullptr);
  ImGui::SetNextWindowCollapsed(false, ImGuiCond_Once);
  if (!ImGui::Begin("TheTranslation Control Panel", nullptr, 0)) {
    // Early out if the window is collapsed, as an optimization.
    ImGui::End();
    return;
  }

  if (ImGui::CollapsingHeader("Simulation Status", ImGuiTreeNodeFlags_DefaultOpen)) {
    simulationStatusSection(client);
  }
  if (ImGui::CollapsingHeader("M5Stack")) {
    m5StackSection(client);
  }
  if (ImGui::CollapsingHeader("Configuration")) {
    configurationSection(client, config);
  }

  ImGui::End();
}
