#include<stdio.h>

int main()
{
	int i,j;
	int numbers[20];
	int matrix[3][5];
	
	int *ptr;
	ptr=&i;
	printf("The address of i is %p \n",&i);
	printf("The address of i is %p \n",ptr);

	printf("The address of numbers is %p \n",numbers);
	printf("The address of numbers is %p \n",&numbers[0]);

	printf("The address of second elt is %p \n",&numbers[1]);
	printf("The address of second elt is %p \n",numbers+1);

	i=0;
	while (i<3)
	{
		printf("\n");
		j=0;
		while (j<5)
		{
		printf(" %p",&matrix[i][j]);
		j=j+1;
		}
		i=i+1;
	}
	return 0;
}
