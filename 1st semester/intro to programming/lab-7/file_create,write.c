#include<stdlib.h>
#include<string.h>
#include<stdio.h>

#ifndef __MSDOS__ /* if we are not MS-DOS */
#define __UNIX__ /* then we are UNIX */
#endif __MSDOS__
#ifdef __UNIX__
#include <sys/types.h> /* file defines for UNIX filesystem */
#include <sys/stat.h>
#include <fcntl.h>
#endif __UNIX__
#ifdef __MSDOS__
#include <stdlib.h>
#include <fcntl.h> /* file defines for DOS filesystem */
#include <sys\stat.h>
#include <io.h>
#endif __MSDOS

void file_create()
{

	char name[50],extension[10];
	
	char file_name[60]="";
	printf("Enter the name of the file to be created\n");
	fgets(name,50,stdin);
	name[strlen(name)-1]='\0';
	printf("Enter the extension of the file to be created\n");
	fgets(extension,10,stdin);
	extension[strlen(extension)-1]='\0';
	strcat(file_name,name);
	strcat(file_name,".");
	strcat(file_name,extension);
	
	FILE *destination;
	if(  (destination=fopen(file_name,"r"))==NULL  )
		destination=fopen(file_name,"w");
	else 
		{
			printf("File already exists\n");
			exit(EXIT_FAILURE);
		}
	fclose(destination);
	printf("File succesfully created\n");
	return;
}

/*void file_write()
{
	int read_size;

	char file_name[60];
	printf("Enter the file name\n");
	fgets(file_name,60,stdin);
	file_name[strlen(file_name)-1]='\0';
	
	int file_describe;
	file_describe = open(file_name,O_APPEND);
	if(file_describe<0)
	{
		printf("Error has occured\n");
		exit(EXIT_FAILURE);
	}
	

	char str[100];
	printf("Enter a string\n");
	fgets(str,100,stdin);
	str[strlen(str)-1]='\0';

	/*fseek(destination,0,SEEK_END);
	fputs(str,destination); //could use fprintf...*/ //useless ,tried this method
	
	/*	//refer pg 269 for read and write functions...
	//write(file_name, str, strlen(str));*/
	

	/*printf("File succesfully saved\n");
}*/

void file_write()
{
	char file_name[60];
	printf("Enter the file name\n");
	fgets(file_name,60,stdin);
	file_name[strlen(file_name)-1]='\0';

	FILE *source;	
	if((source=fopen(file_name,"a"))==NULL)
	{
		printf("Error saving in a file\n");
		exit(EXIT_FAILURE);
	}
	char str[100];
	printf("Enter a string\n");
	fgets(str,100,stdin);
	str[strlen(str)-1]='\0';

	fprintf(source,"\n%s",str);
	fclose(source);
}

int main()
{
	int x;
	printf("press 1 to create file, 2 to edit file\n");
	scanf("%d",&x);
	fgetc(stdin);
	switch(x)
	{
		case 1:
		file_create();
		break;

		case 2:
		file_write();
		break;
	}
	return 0;
}
//harsha.txt
