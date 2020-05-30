#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 1024

static const int MAXPENDING = 5; // Maximum outstanding connection requests

void encrypt(char* str, int size) {
	for(int i = 0; i < size; i++) {
			str[i] = str[i] + 1;
	}
}

int file_check(char* fileName) {
	struct stat buffer;
  if (stat (fileName, &buffer) == 0) {
  	return 1;
  }
  return 0;
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

	// Server Loop
	for (;;) {
		struct sockaddr_in clntAddr;
		socklen_t clntAddrLen = sizeof(clntAddr);
		char sim_msg[20];
		// Wait for a client to connect
		int clntSock =
				accept(servSock, (struct sockaddr *) &clntAddr, &clntAddrLen);
		if (clntSock < 0) {
			perror("accept() failed");
			exit(-1);
		}

		char clntIpAddr[INET_ADDRSTRLEN];
		if (inet_ntop(AF_INET, &clntAddr.sin_addr.s_addr,
				clntIpAddr, sizeof(clntIpAddr)) != NULL) {
			printf("----\nHandling client %s %d\n",
					clntIpAddr, ntohs(clntAddr.sin_port));
		} else {
			puts("----\nUnable to get client IP Address");
		}

		// Receive data
		char buffer[BUFSIZE];
		memset(buffer, 0, BUFSIZE);
		ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
		if (recvLen < 0) {
			perror("recv() failed");
			exit(-1);
		}
		buffer[recvLen] = '\n';
		fputs(buffer, stdout);

		// give back response
		strcpy(sim_msg, "ok");
		encrypt(sim_msg, 2);
		ssize_t sentLen = send(clntSock, sim_msg, 2, 0);
		if (sentLen < 0) {
			perror("send() failed");
			exit(-1);
		} else if (sentLen != 2) {
			perror("send() sent unexpected number of bytes - response");
			exit(-1);
		}

		char keyword[20];
		strcpy(keyword, buffer);
		memset(buffer, 0, BUFSIZE);

		if (strcmp(keyword, "check\n") == 0) {
			// Receive data - fileName
			memset(buffer, 0, BUFSIZE);
			ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
			if (recvLen < 0) {
				perror("recv() failed");
				exit(-1);
			}
			buffer[recvLen] = '\0';
			fputs(buffer, stdout);

			// now check if file exists
			if(file_check(buffer) == 1) {
				// good
				// give back response
				strcpy(sim_msg, "ok");
				encrypt(sim_msg, 2);
				ssize_t sentLen = send(clntSock, sim_msg, 2, 0);
				if (sentLen < 0) {
					perror("send() failed");
					exit(-1);
				} else if (sentLen != 2) {
					perror("send() sent unexpected number of bytes - response");
					exit(-1);
				}
			} else { // error
				// give back response
				strcpy(sim_msg, "no");
				encrypt(sim_msg, 2);
				ssize_t sentLen = send(clntSock, sim_msg, 2, 0);
				if (sentLen < 0) {
					perror("send() failed");
					exit(-1);
				} else if (sentLen != 2) {
					perror("send() sent unexpected number of bytes - response");
					exit(-1);
				}
			}
		} else if (strcmp(keyword, "send\n") == 0) {

			// Receive data - fileName
			memset(buffer, 0, BUFSIZE);
			ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
			if (recvLen < 0) {
				perror("recv() failed");
				exit(-1);
			}
			buffer[recvLen] = '\0';
			fputs(buffer, stdout);

			// give back response
			strcpy(sim_msg, "ok");
			encrypt(sim_msg, 2);
			ssize_t sentLen = send(clntSock, sim_msg, 2, 0);
			if (sentLen < 0) {
				perror("send() failed");
				exit(-1);
			} else if (sentLen != 2) {
				perror("send() sent unexpected number of bytes - response");
				exit(-1);
			}

			// receive file
			FILE *fp = fopen(buffer, "wb");
	    if (fp == NULL) {
        perror("Error opening file");
        exit(1);
	    }

			int currFBuff, currFileLen = 0;
			memset(buffer, 0, BUFSIZE);
	    while ((currFBuff = recv(clntSock, buffer, BUFSIZE, 0)) > 0) {
        if (currFBuff == -1) {
            perror("Error receiving data");
            exit(1);
        }

        if (fwrite(buffer, sizeof(char), currFBuff, fp) != currFBuff) {
            perror("fwrite system call error");
            exit(1);
        }
        memset(buffer, 0, BUFSIZE);
        currFileLen += currFBuff;
	    }
	    // printf("Receive Success, NumBytes = %ld\n", currFileLen);

	    fclose(fp);
		} else if (strcmp(keyword, "receive\n") == 0) {

			// Receive data
			memset(buffer, 0, BUFSIZE);
			ssize_t recvLen = recv(clntSock, buffer, BUFSIZE - 1, 0);
			if (recvLen < 0) {
				perror("recv() failed");
				exit(-1);
			}
			buffer[recvLen] = '\0';
			fputs(buffer, stdout);

			// now check if file exists
			if(file_check(buffer)) {
				// good
				// give back response
				strcpy(sim_msg, "ok");
				encrypt(sim_msg, 2);
				ssize_t sentLen = send(clntSock, sim_msg, 2, 0);
				if (sentLen < 0) {
					perror("send() failed");
					exit(-1);
				} else if (sentLen != 2) {
					perror("send() sent unexpected number of bytes - response");
					exit(-1);
				}
			} else { // error
				// give back response
				strcpy(sim_msg, "no");
				encrypt(sim_msg, 2);
				ssize_t sentLen = send(clntSock, sim_msg, 2, 0);
				if (sentLen < 0) {
					perror("send() failed");
					exit(-1);
				} else if (sentLen != 2) {
					perror("send() sent unexpected number of bytes - response");
					exit(-1);
				}
			}

			// send the file
			FILE *fp = fopen(buffer, "rb");
	    if (fp == NULL) {
	        perror("Error opening file");
	        exit(1);
	    }

			int currFBuff, currFileLen = 0;
			memset(buffer, 0, BUFSIZE);
	    while ((currFBuff = fread(buffer, sizeof(char), BUFSIZE, fp)) > 0) {
        if (currFBuff != BUFSIZE && ferror(fp)) {
            perror("Error getting text from file");
            exit(1);
        }
        // now we have the buffer so send data
        encrypt(buffer, strlen(buffer));
        if (send(clntSock, buffer, currFBuff, 0) == -1) {
            perror("Can't send file");
            exit(1);
        }
        memset(buffer, 0, BUFSIZE);
		    currFileLen += currFBuff;
	    }
	    // printf("Send Success, NumBytes = %ld\n", currFileLen);
	    fclose(fp);
		}

		close(clntSock);
		// printf("End of Server Loop\n");
	}

	printf("End of Program\n");

}
