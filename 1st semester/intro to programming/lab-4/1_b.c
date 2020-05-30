/**
 * C program to print hollow rectangle star pattern with 2 functions
 */

#include <stdio.h>

int rectangle(int rows,int columns)
{
for(int i=1; i<=rows; i++)
    {
        for(int j=1; j<=columns; j++)
        {
            if(i==1 || i==rows || j==1 || j==columns)
            {
                printf("*");
            }
            else
            {
                printf(" ");
            }
        }
        printf("\n");
    }
return 0;
}

int main()
{
    int rows, columns;

    
    printf("Enter number of rows: ");
    scanf("%d", &rows);
    printf("Enter number of columns: ");
    scanf("%d", &columns);
    rectangle(rows,columns);
    return 0;
}