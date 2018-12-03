#include<stdio.h>

int main()
{
    int count,n,p;
    FILE *ptr;

    printf("\n *** Program to print first n primes *** \n");


    printf("Enter the value of n: ");
    scanf("%d",&n);

    if (n>1000)
    {
        printf("Input error \n");
        return 0;
    }

    if ((ptr=fopen("primelist1.txt","r"))==NULL)
    {
        printf("Error in opening the file");
        return 0;
    }

    count=0;
    while (!feof (ptr) && (count<n))
    {
      fscanf(ptr, "%d", &p);
      printf("\n %d",p);
      count=count+1;
    }

    fclose(ptr);
    printf("\n");
}
