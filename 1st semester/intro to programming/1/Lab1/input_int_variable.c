/********************************
*Filename: input_int_variable.c
*Description: This program illustrates the declaration of several integer variables and elementary arithmetic operations.
*********************************/

#include<stdio.h>

int main()
{
    int num1;
    
    printf("\n *** Program to illustrate input of an int variable *** \n");
 
    printf("\n Enter a number: ");

    scanf("%d",&num1); // This is the statement which reads an integer from the user and stores it in num1.
     
    /*The scanf statement is often used to get input from the user.
    The expression "&num1" is the address of num1.
    Try entering LARGE values for num1. What is the largest value that is printed correctly? */
    
	printf("Your number is %d",num1);
    return 0;
}
