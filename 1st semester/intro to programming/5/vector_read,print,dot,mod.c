#include <stdio.h>
#include <math.h>
#include "vector.h"
#include "vector.c"

int main()
{
	int d1;
	printf("Enter the dimension of the vector\n");
	scanf("%d",&d1);
	float num[d1];
	vectorRead(num,d1);
	vectorPrint(num,d1);
	printf("The length of the entered vector is: %lf\n",vectorLength(num,d1));

	float num1[d1],num2[d1];
	vectorRead(num1,d1);
	vectorRead(num2,d1);
	printf("The dot product of the given vectors is :%lf\n", vectorDotProduct(num1,num2,d1));
	return 0;

}
