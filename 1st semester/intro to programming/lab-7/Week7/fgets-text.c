#include<stdio.h>

int main()
{
    char line[200];
    FILE *ptr,*ptr2;

    printf("\n *** Program to read, print and copy a text file *** \n");

    if ((ptr=fopen(".txt","r"))==NULL)
        {printf("Error in opening file"); return 0;}
    ptr2=fopen(".txt","w");
    while (!feof(ptr))
    {
        fgets(line,200,ptr);    // Reads 200 char of till \n
        puts(line);
        fputs(line,ptr2);
    }

    fclose(ptr2);
    fclose(ptr);
    printf("\n");
}
