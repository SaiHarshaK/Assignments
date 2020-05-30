#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <pthread.h>

#define BUFSIZE 1024

void *recvImpl(int *sockfd) {
  for (;;) {
  	char buff[BUFSIZE];
    memset(buff, 0 , BUFSIZE);
    read(*sockfd, buff, sizeof(buff)-1);
    fputs("\nFrom Client : ",stdout);
    buff[sizeof(buff) - 1] = '\n';
    fputs(buff, stdout);
    if (strcmp(buff, "exit\n") == 0) {
      printf("Disconnecting client.");
      exit(0);
    }
    printf("\n# : ");
    fflush(stdout);
  }
}
void *senderImpl(int *sockfd) {
  for (;;) {
  	char buff[BUFSIZE];
    scanf("%s", buff);
    write(*sockfd, buff, sizeof(buff)-1);
    printf("\n# : ");
    fflush(stdout);
  }
}

int main(int argc, char **argv) {
	if (argc != 3) {
		perror("<Server Address> <Server Port>");
		exit(-1);
	}

	char *servIP = argv[1];
  // Set port number as user specifies
	in_port_t servPort = atoi(argv[2]);

	//Create a socket
	int sockfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
	if (sockfd < 0) {
		perror("socket() failed");
		exit(-1);
	}

	// Set the server address
	struct sockaddr_in servAddr;
	memset(&servAddr, 0, sizeof(servAddr));
	servAddr.sin_family = AF_INET;
	int err = inet_pton(AF_INET, servIP, &servAddr.sin_addr.s_addr);
	if (err <= 0) {
		perror("inet_pton() failed");
		exit(-1);
	}
	servAddr.sin_port = htons(servPort);

	// Connect to server
	if (connect(sockfd, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0) {
		perror("connect() failed");
		exit(-1);
	}
  printf("# : ");
  pthread_t sender,receiver;
  pthread_create(&sender, NULL, senderImpl, &sockfd);
  pthread_create(&receiver, NULL, recvImpl, &sockfd);

  pthread_join(sender, NULL);
  pthread_join(receiver, NULL);

  close(sockfd);
	exit(0);
}
