#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 1024

void decrypt(char* str, int size) {
	for(int i = 0; i < size; i++) {
		str[i] = str[i] - 1;
	}
}

int main(int argc, char **argv) {

	if (argc != 5) {
		perror("<Server Address> <Server Port> <keyword> <fileName>");
		exit(-1);
	}

	char *servIP = argv[1];
	char *keyword = argv[3];
	char *fileName = argv[4];

	// Set port number as given by user or as default 12345
	// in_port_t servPort = (argc == 3) ? atoi(argv[2]) : 12345;

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
	int err = inet_pton(AF_INET, servIP, &servAddr.sin_addr.s_addr); // Convert IPv4 and IPv6 addresses from text to binary form
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

	size_t keywordLen = strlen(keyword);
	size_t fileNameLen = strlen(fileName);

	// send keyword
	ssize_t sentLen = send(sockfd, keyword, keywordLen, 0);
	if (sentLen < 0) {
		perror("send() failed");
		exit(-1);
	} else if (sentLen != keywordLen) {
		perror("send(): sent unexpected number of bytes");
		exit(-1);
	}

	// Receive response from server
	unsigned int totalRecvLen = 0;

	// fputs("Received: ", stdout);
	char buffer[BUFSIZE];
	memset(buffer, 0, BUFSIZE);
	ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
	decrypt(buffer, strlen(buffer));
	if (recvLen < 0) {
		perror("recv() failed");
		exit(-1);
	} else if (recvLen == 0) {
		perror("recv() connection closed prematurely");
		exit(-1);
	}
	totalRecvLen += recvLen;
	buffer[recvLen] = '\n';
	// fputs(buffer, stdout);

	if (strcmp(buffer, "ok\n") == 0) {
		// now based on send or receive or check
		// if check we are done
		if (strcmp(keyword, "check") == 0) {
			// send fileName
			ssize_t sentLen = send(sockfd, fileName, fileNameLen, 0);
			if (sentLen < 0) {
				perror("send() failed");
				exit(-1);
			} else if (sentLen != fileNameLen) {
				perror("send(): sent unexpected number of bytes");
				exit(-1);
			}
			// get response
			totalRecvLen = 0;
			fputs("Received: ", stdout);
			memset(buffer, 0, BUFSIZE);
			ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
			decrypt(buffer, strlen(buffer));
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
			if (strcmp(buffer, "ok\n") == 0) {
				printf("File exists!!");
				close(sockfd);
				exit(0);
			} else {
				printf("File does not exist!!");
				close(sockfd);
				exit(0);
			}
		} else if (strcmp(keyword, "send") == 0) {
			// send fileName
			ssize_t sentLen = send(sockfd, fileName, fileNameLen, 0);
			if (sentLen < 0) {
				perror("send() failed");
				exit(-1);
			} else if (sentLen != fileNameLen) {
				perror("send(): sent unexpected number of bytes");
				exit(-1);
			}
			// get response
			totalRecvLen = 0;
			fputs("Received: ", stdout);
			memset(buffer, 0, BUFSIZE);
			ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
			decrypt(buffer, strlen(buffer));
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

			FILE *fp = fopen(fileName, "rb");
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
        if (send(sockfd, buffer, currFBuff, 0) == -1) {
            perror("Can't send file");
            exit(1);
        }
        memset(buffer, 0, BUFSIZE);
		    currFileLen += currFBuff;
	    }
	    // printf("Send Success, NumBytes = %ld\n", currFileLen);
	    fclose(fp);
		} else if (strcmp(keyword, "receive") == 0) {
			// send fileName
			ssize_t sentLen = send(sockfd, fileName, fileNameLen, 0);
			if (sentLen < 0) {
				perror("send() failed");
				exit(-1);
			} else if (sentLen != fileNameLen) {
				perror("send(): sent unexpected number of bytes");
				exit(-1);
			}
			// get response
			totalRecvLen = 0;
			fputs("Received: ", stdout);
			memset(buffer, 0, BUFSIZE);
			ssize_t recvLen = recv(sockfd, buffer, BUFSIZE - 1, 0);
			decrypt(buffer, strlen(buffer));
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

			// receive file
			FILE *fp = fopen(fileName, "wb");
	    if (fp == NULL) {
        perror("Error opening file");
        exit(1);
	    }

			int currFBuff, currFileLen = 0;
			memset(buffer, 0, BUFSIZE);
	    while ((currFBuff = recv(sockfd, buffer, BUFSIZE, 0)) > 0) {
				decrypt(buffer, strlen(buffer));
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
		}
	} else {
		perror("Error getting valid response - 1");
		exit(-1);
	}

	close(sockfd);
	exit(0);
}
