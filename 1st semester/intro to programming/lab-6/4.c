#include<stdio.h>
#include<string.h>
/*int matrix_multiply(int *matrix1,int *matrix2_rows,int n)
{
	for(int i=0;i<n;i++)
	{
		for(int j=0;j<n;j++)
		{
			matrix1[i][j]=(matrix1_rows[i]*matrix2_rows[j])
		}
	}

	return matrix1;
}
*/ //need help, in passing a 2d matrix to a function

int main()
{
	int power,n,x;
	printf("Enter the order of square matrix\n");
	scanf("%d",&n);
	int matrix1[n][n],matrix2[n][n],matrix3[n][n];

	printf("Enter the elements of the matrix, row wise\n");
	for(int i=0;i<n;i++)
	{
		for(int j=0;j<n;j++)
		{
			scanf("%d",&matrix1[i][j]);
		}
	}

	
	memcpy(matrix2,matrix1,n*n*sizeof(int));  /*to cpy matrix*/
	memcpy(matrix3,matrix1,n*n*sizeof(int));


	printf("Enter the value of power: \n");
	scanf("%d",&power);
	printf("Enter the value of modulo x: \n");
	scanf("%d",&x);
	//for matrix multiplication, to calculate ith-row,jth-column element, i need to calculate individually a[i][1]*a[1][j] + a[i][2]*a[2][j] + so on till a[i][n]*a[n][j]....
	for(int l=1;l<power;l++) //it has to be from 1 to power-1
	{
		//matrix1=matrix_multiply(matrix1,matrix2,n);
		

		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			{
					int sum=0;

					for(int k=0;k<n;k++)
					{
						sum+=matrix1[i][k]*matrix2[k][j];
					}

				matrix3[i][j]=sum;

			}
		}	

		memcpy(matrix1,matrix3,n*n*sizeof(int));

	}


	for(int i=0;i<n;i++)
	{
		for(int j=0;j<n;j++)
			{
				printf("%d ",matrix1[i][j]%x);
			}
		printf("\n");
	}


	return 0;
}
