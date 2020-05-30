#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>

#define BUFSIZE 1024

static const int MAXPENDING = 5; // Maximum outstanding connection requests

struct clients{
	int client1;
	int client2;
};

void *monitor(struct clients *sockfds) {
  while(1){
		// Receive data
		char buffer[BUFSIZE];
		memset(buffer, 0, BUFSIZE);
		ssize_t recvLen = recv(sockfds->client1, buffer, BUFSIZE - 1, 0);
		if (recvLen < 0) {
			perror("recv() failed");
			exit(-1);
		} else if (recvLen == 0) {
			perror("Client disconnected");
			strcpy(buffer, "exit");
			ssize_t sentLen = send(sockfds->client2, buffer, recvLen, 0);
			if (sentLen < 0) {
				perror("send() failed");
				exit(-1);
			}
			exit(-1);
		}
		buffer[recvLen] = '\n';
		fputs(buffer, stdout);
		// Send data
		ssize_t sentLen = send(sockfds->client2, buffer, recvLen, 0);
		if (sentLen < 0) {
			perror("send() failed");
			exit(-1);
		}
	}
}

int main(int argc, char ** argv) {

	if (argc != 2) {
		perror("<server port>");
		exit(-1);
	}

	in_port_t servPort = atoi(argv[1]); // Local port

	// create socket for incoming connections
	int servSock;
	if ((servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0) {
		perror("socket() failed");
		exit(-1);
	}

	// Set local parameters
	struct sockaddr_in servAddr;
	memset(&servAddr, 0, sizeof(servAddr));
	servAddr.sin_family = AF_INET;
	servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servAddr.sin_port = htons(servPort);

	// Bind to the local address
	if (bind(servSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0) {
		perror("bind() failed");
		exit(-1);
	}

	// Listen to the client
	if (listen(servSock, MAXPENDING) < 0) {
		perror("listen() failed");
		exit(-1);
	}

	struct sockaddr_in clntAddr, clntAddr2;
	socklen_t clntAddrLen = sizeof(clntAddr);
	socklen_t clntAddrLen2 = sizeof(clntAddr2);

	// Wait for a client to connect
	int clntSock =
			accept(servSock, (struct sockaddr *) &clntAddr, &clntAddrLen);
	int clntSock2 =
	        accept(servSock, (struct sockaddr *) &clntAddr2, &clntAddrLen2);
	if (clntSock < 0 || clntSock2 < 0) {
		perror("accept() failed");
		exit(-1);
	}

	char clntIpAddr[INET_ADDRSTRLEN], clntIpAddr2[INET_ADDRSTRLEN];
	if (inet_ntop(AF_INET, &clntAddr.sin_addr.s_addr,
			clntIpAddr, sizeof(clntIpAddr)) != NULL) {
		printf("----\nHandling one of the client %s %d\n",
				clntIpAddr, ntohs(clntAddr.sin_port));
	} else {
		puts("----\nUnable to get client IP Address");
	}
	if (inet_ntop(AF_INET, &clntAddr2.sin_addr.s_addr,
			clntIpAddr2, sizeof(clntIpAddr2)) != NULL) {
		printf("----\nHandling one of the client %s %d\n",
				clntIpAddr2, ntohs(clntAddr2.sin_port));
	} else {
		puts("----\nUnable to get client IP Address");
	}

  //Seperate threads for 2 clients
  pthread_t clientid1, clientid2;
  struct clients sockfds1, sockfds2;
  sockfds1.client1 = clntSock;
  sockfds1.client2 = clntSock2;
  sockfds2.client1 = clntSock2;
  sockfds2.client2 = clntSock;

  pthread_create(&clientid1, NULL, monitor, &sockfds1);
  pthread_create(&clientid2, NULL, monitor, &sockfds2);

  pthread_join(clientid1, NULL);
  pthread_join(clientid2, NULL);

	close(clntSock);
	close(clntSock2);

	printf("End of Program\n");
}
