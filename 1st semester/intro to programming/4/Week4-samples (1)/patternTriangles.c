#include<stdio.h>

int main()
{

    int i,j,N;

    printf("** This program accepts an integer N and displays two triangle patterns");
    printf("\n Enter the value of N: ");
    scanf("%d",&N);

    i=1;
    while (i<=N)
    {
        // Print i number of * on a new line.
        printf("\n");
        j=1;
        while (j<=i)
        {
            printf("*");
            j=j+1;
        }
        i=i+1;
    }

    printf("\n");
    i=1;
    while (i<=N)
    {
        printf("\n");
        // Print values 1,2,...,i.
        j=1;
        while (j<=i){
            printf("%d",j);
            j=j+1;
        }
        i=i+1;
    }
    printf("\n");
    return 0;

}
