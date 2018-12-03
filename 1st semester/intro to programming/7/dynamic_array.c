#include<stdio.h>
#include<stdlib.h>

int main()
{
    int rows,columns;
    int i,j;
    int **matrix;

    printf("Program to allocate memory for a 2d array \n");
    printf("Enter the number of rows: ");
    scanf("%d",&rows);
    printf("Enter the number of columns: ");
    scanf("%d",&columns);
    matrix=malloc(sizeof(int*)*rows);
    printf("\n %d rows allocated",rows);

    for (i=0;i<rows;i++)
    {
        matrix[i]=calloc(1,sizeof(int)*columns);
    }

    for (i=0;i<rows;i++)
    {
        printf("\n");
        for (j=0;j<columns;j++)
            printf(" %d",matrix[i][j]);
    }

    free(matrix);

    return 0;
}
