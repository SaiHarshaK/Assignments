#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#define BUFSIZE 1024

int main(int argc, char **argv) {

  if (argc != 4) {
    perror("<servIP Address> <servIP Port> <Echo Word>");
    exit(-1);
  }

  char *servIP = argv[1];
  char *echoString = argv[3];
  struct addrinfo args;
  struct addrinfo *result = NULL;

  // Set port number as given by user or as default 12345
  // in_port_t servPort = (argc == 3) ? atoi(argv[2]) : 12345;

  // Set port number as user specifies
  char *servPort = argv[2];

  memset(&args, 0, sizeof(args));
  // initialization
  args.ai_family   = AF_UNSPEC;
  args.ai_socktype = SOCK_STREAM;
  args.ai_flags    = AI_NUMERICSERV;

  struct in6_addr servAddr6;
  if (inet_pton(AF_INET, servIP, &servAddr6) == 1) { // ipv4
    args.ai_family = AF_INET;
    args.ai_flags |= AI_NUMERICHOST;
  } else if (inet_pton(AF_INET6, servIP, &servAddr6) == 1) { // ipv6
    args.ai_family = AF_INET6;
    args.ai_flags |= AI_NUMERICHOST;
  }

  // printf("check1\n");

  int ret = getaddrinfo(servIP, servPort, &args, &result);
  if (ret != 0) {
    printf("Error finding Host --> %s\n", gai_strerror(ret));
    if (ret == EAI_SYSTEM)
      perror("getaddrinfo() failed");
    exit(-1);
  }

  // printf("check3\n");
  //Create a socket
  int sockfd = socket(result->ai_family, result->ai_socktype, result->ai_protocol);
  if (sockfd < 0) {
    perror("socket() failed");
    exit(-1);
  }

  // Connect to servIP
  if (connect(sockfd, result->ai_addr, result->ai_addrlen) < 0) {
    perror("connect() failed");
    exit(-1);
  }

  size_t echoStringLen = strlen(echoString);

  // Send string to servIP
  ssize_t sentLen = send(sockfd, echoString, echoStringLen, 0);
  if (sentLen < 0) {
    perror("send() failed");
    exit(-1);
  } else if (sentLen != echoStringLen) {
    perror("send(): sent unexpected number of bytes");
    exit(-1);
  }

  // Receive string from servIP
  unsigned int totalRecvLen = 0;

  fputs("Received: ", stdout);
  while (totalRecvLen < echoStringLen) {
    char buffer[BUFSIZE];
    memset(buffer, 0, BUFSIZE);
    ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
    if (recvLen < 0) {
      perror("recv() failed");
      exit(-1);
    } else if (recvLen == 0) {
      perror("recv() connection closed prematurely");
      exit(-1);
    }

    totalRecvLen += recvLen;
    buffer[recvLen] = '\n';
    fputs(buffer, stdout);
  }

  close(sockfd);
  exit(0);
}
