#include<stdio.h>

int main()
{
    char line[250],country[40],capital[40];
    FILE *ptr;
    int count;

    printf("\n *** Program to find the capital of a country *** \n");

    printf("\n Enter the name of the country: ");
    scanf("%s",country);

    if ((ptr=fopen("capitals.txt","r"))==NULL)
        {printf("Error in opening file"); return 0;}

    while (!feof(ptr))
    {
        fgets(line,250,ptr);
        count=0;
        while ((country[count]!='\0') && (line[count]!='0') && (country[count]==line[count]))
        {
            count=count+1;
        }
        if (line[count]!=',')
            continue;
        count=count+1;
        printf("The capital of %s is ",country);
        while (line[count]!='\0')
        {
            printf("%c",line[count]);
            count=count+1;
        }
    }

    fclose(ptr);
    printf("\n");
}
