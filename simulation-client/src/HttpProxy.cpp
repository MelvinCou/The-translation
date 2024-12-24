#include "HttpProxy.hpp"

#include <netdb.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>

#include <SimulationClient.hpp>
#include <algorithm>
#include <cstdio>
#include <cstring>
#include <string>

void HttpProxy::begin(uint32_t reqId, char const *host, size_t hostLen, uint16_t port) {
  m_partialHttpRequests[reqId] = Request{reqId, std::string(host, hostLen), port, {}};
}

void HttpProxy::append(uint32_t reqId, char const *buf, size_t len) {
  auto it = m_partialHttpRequests.find(reqId);
  if (it != m_partialHttpRequests.end()) {
    it->second.data.insert(it->second.data.end(), buf, buf + len);
  } else {
    fprintf(stderr, "Warning: appending to HTTP request with ID %d not found!\n", reqId);
  }
}

void HttpProxy::end(uint32_t reqId, SimulationClient &client) {
  auto it = m_partialHttpRequests.find(reqId);

  if (it == m_partialHttpRequests.end()) {
    fprintf(stderr, "Warning: ended HTTP request with ID %d not found!\n", reqId);
    return;
  }
  Request req;
  std::swap(req, it->second);
  m_partialHttpRequests.erase(it);
  std::vector<char> res = sendRequest(req);
  sendResponse(req, res, client);
}

std::vector<char> HttpProxy::sendRequest(Request const &req) {
  auto reqLineEnd = std::find(req.data.cbegin(), req.data.cend(), '\r');

  printf("HTTP(%u) => %s\n", req.id, std::string(req.data.begin(), reqLineEnd).c_str());

  addrinfo hints = {};
  addrinfo *resolved = nullptr;
  hints.ai_family = AF_INET;
  hints.ai_socktype = SOCK_STREAM;

  if (getaddrinfo(req.host.c_str(), nullptr, &hints, &resolved) != 0) {
    fprintf(stderr, "Error resolving host %s: %s\n", req.host.c_str(), strerror(errno));
    return {};
  }

  int sockFd = socket(hints.ai_family, hints.ai_socktype, 0);
  if (sockFd < 0) {
    fprintf(stderr, "Error creating socket for request to %s: %s\n", req.host.c_str(), strerror(errno));
    freeaddrinfo(resolved);
    return {};
  }

  auto *serverAddr = reinterpret_cast<sockaddr_in *>(resolved->ai_addr);
  serverAddr->sin_port = htons(req.port);

  if (connect(sockFd, resolved->ai_addr, resolved->ai_addrlen) < 0) {
    fprintf(stderr, "Error connecting to %s: %s\n", req.host.c_str(), strerror(errno));
    close(sockFd);
    freeaddrinfo(resolved);
    return {};
  }

  // Send the request
  ssize_t totalSent = 0;
  ssize_t reqSize = req.data.size();
  while (totalSent < reqSize) {
    ssize_t sent = send(sockFd, req.data.data() + totalSent, reqSize - totalSent, 0);
    if (sent < 0) {
      fprintf(stderr, "Error while sending request to %s: %s\n", req.host.c_str(), strerror(errno));
      close(sockFd);
      freeaddrinfo(resolved);
      return {};
    }
    totalSent += sent;
  }

  printf("HTTP Request sent successfully\n");
  // Read the response
  char buffer[256];
  std::vector<char> res;
  ssize_t bytesRead;
  while ((bytesRead = recv(sockFd, buffer, sizeof(buffer) - 1, 0)) > 0) {
    res.insert(res.end(), buffer, buffer + bytesRead);
  }

  if (bytesRead < 0) {
    fprintf(stderr, "Error reading response from %s: %s\n", req.host.c_str(), strerror(errno));
    close(sockFd);
    freeaddrinfo(resolved);
    return {};
  }

  // Close the socket
  close(sockFd);
  freeaddrinfo(resolved);

  return res;
}

void HttpProxy::sendResponse(Request const &req, std::vector<char> const &res, SimulationClient &client) {
  auto const resLineEnd = std::find(res.cbegin(), res.cend(), '\r');
  printf("HTTP(%u) <= %s\n", req.id, std::string(res.cbegin(), resLineEnd).c_str());

  C2SMessage httpMsg{C2SOpcode::HTTP_BEGIN, {}};
  httpMsg.httpBegin.reqId = req.id;
  httpMsg.httpBegin.port = req.port;
  httpMsg.httpBegin.len = std::min(req.host.length(), sizeof(httpMsg.httpBegin.host));
  memcpy(httpMsg.httpBegin.host, req.host.c_str(), httpMsg.httpBegin.len);
  client.pushToServer(std::move(httpMsg));

  // Send response chunk by chunk
  size_t offset = 0;
  while (offset < res.size()) {
    size_t len = std::min(res.size() - offset, sizeof(httpMsg.httpWrite.buf));
    httpMsg.opcode = C2SOpcode::HTTP_WRITE;
    httpMsg.httpWrite.reqId = req.id;
    httpMsg.httpWrite.len = len;
    memcpy(httpMsg.httpWrite.buf, res.data() + offset, len);
    offset += len;
    client.pushToServer(std::move(httpMsg));
  }

  httpMsg.opcode = C2SOpcode::HTTP_END;
  httpMsg.httpEnd.reqId = req.id;
  client.pushToServer(std::move(httpMsg));
}
