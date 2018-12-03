#include<stdio.h>

int main()
{
    float num1,num2;
    printf("\n ***Program to find the maximum of two numbers*** \n");
    printf("Enter the first number: ");
    scanf("%f",&num1);
    printf("Enter the second number: ");
    scanf("%f",&num2);

    if (num1>num2)
    {
        printf("The first number is larger and its value is %f",num1);
    }
    else
    {
        if (num2>num1)
        {
            printf("The second number is larger and its value is %f",num2);
        }
        else
        {
            printf("The numbers are equal and their value is %f",num1);
        }
    }
    return 0;
}
