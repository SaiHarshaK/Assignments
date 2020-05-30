#include<stdio.h>
#include<string.h>
int main()
{
	char name[100];
	printf("Hello, user. What’s your name? \n");
	fgets(name,100,stdin);
	name[strlen(name)-1]='\0';
	name[0]='Z';
	printf("Welcome,%s\n",name );
	return 0;
}
