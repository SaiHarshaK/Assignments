#include<stdio.h>

int main()
{
    int N, count, odd;

    printf("Program to print odd numbers up to N \n");
    printf("Enter the value of N: ");
    scanf("%d",&N);
    count=1;
    odd=1;
    while(odd<=N)
    {
        printf("%d \n",odd);
        count=count+1;
        odd=odd+2;  // We can also replace this with odd=2*count-1.
    }
}
