#include<stdio.h>

int main()
{
    char c;

    printf("\n This program checks whether the input character is Z. \n ");
    printf("Enter a character: ");
    c=getchar();
    if (c=='Z')
    {
        printf("That was Z. \n");
    }
    else
    {
        printf("That wasn't Z. \n");
    }
}
