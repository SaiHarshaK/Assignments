#include<stdio.h>

int main()
{
    char ch;
    FILE *ptr;
    long position;

    printf("\n *** Program to read and print a text file *** \n");

    ptr=fopen("tale.txt","r");

    while (!feof(ptr))
    {
        ch=fgetc(ptr);
        if (ch==EOF) break;
        putchar(ch);
    }
    position=ftell(ptr);
    fclose(ptr);

    printf("\n The size of the file is %ld bytes. \n",position);
}
