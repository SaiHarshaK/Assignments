#include<stdio.h>
#include<string.h>
int createFile(char filename[])
{
    FILE *ptr;

    if ((ptr=fopen(filename,"w"))==NULL)
    {
        printf("Error in creating file");
        return 0;
    }
    return 1;
    fclose(ptr);
}

void addline(char filename[],char line[])
{
    FILE *ptr;
    if ((ptr=fopen(filename,"a"))==NULL)
    {
        printf("Error in opening file \n");
        return ;
    }
    fputs("\n",ptr);
    fputs(line,ptr);
    fclose(ptr);
}

int main()
{
    char filename[200];

    printf("\n *** Program to create and append a text file *** \n");
    printf("Enter filename: ");
    scanf("%s",filename);

    strcat(filename,".txt");

    if (createFile(filename))
        printf("File created successfully");

    addline(filename,"Hello World");
    addline(filename,"This is the second line.");
    addline(filename,"This is the third.");
    addline(filename,"Bye Bye World");
}
