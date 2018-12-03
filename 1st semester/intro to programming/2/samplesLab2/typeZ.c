#include<stdio.h>

int main()
{
    char c;

    printf("\n This program keeps reading character until it sees Z. \n ");
    printf("\n Waiting for Z \n");

    c=getchar();
    while (c!='Z')
    {
        c=getchar();
    }
    printf("Got it. Bye...");
}
