/********************************
*Filename: int_variables.c
*Description: This program illustrates the use of integer variables.
*********************************/

#include<stdio.h>

main()
{
    int num1, num2;    
            
    num1=10;
    num2=20;
    
    printf("\n *** Program to illustrate integer variables *** \n");
 
    printf("\n First number = %d, Second number = %d", num1, num2);
    // Note the use of %d. The two "%d" are matched and "replaced" by the compiler to the values of the variables num1 and num2. */
    printf("\n The second number is %d and the first number is %d",num2,num1);
    
    
    num1 = num1 + num2;
    
    printf("\n Now num1 is %d and num2 is %d",num1,num2); 
    
    num2 = num2 * num1;
    
    printf("\n Now num1 is %d and num2 is: %d",num1,num2);
	printf("\n");
 
}
