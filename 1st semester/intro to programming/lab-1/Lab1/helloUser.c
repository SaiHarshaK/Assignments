/********************************
*Filename: helloUser.c
*********************************/

#include<stdio.h>

int main()
{
    char username[30];
    
    printf("\n Hello, user. What's your name? ");
 
    scanf("%s",username); // This is the statement which reads an integer from the user and stores it in num1.
         
	printf("Welcome, %s \n",username);
    return 0;
}
