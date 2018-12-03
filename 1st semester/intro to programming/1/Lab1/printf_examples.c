/********************************
*Filename: printf_examples.c
*Description: This program illustrates various uses of the printf statement
*Author: Instructor, ID 1061
*Date: 31.12.2012
*********************************/

#include<stdio.h>

int main()
{
    printf("Hello world");
    printf(" Hello again");        //Prints on the same line as the previous statement
    printf("\n");                 //Prints a new line
    printf("Hello on a new line.");
    printf("\t");                 //Prints a tab character, i.e. prints 4 spaces
    printf("After the tab");
    /* You can also use the escape characters with text on a single line, as in the following example */
    printf("\nThis is a new line. \tAfter the tab again.");
    printf("\nThat's all, folks... \n");
   
    return 0;
}
