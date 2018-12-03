#include<stdio.h>
#include "mymath.h"

int main()
{
	double radius=1.0,area,root,num=1000;
	long a=3,b=100,n=7,value;

	area=circleArea(radius);
	value=powermod(a,b,n);
	root=squareRoot(num);

	printf("The area is %f",area);
	printf("\n The power is %ld",value);
	printf("\n The square root of %0.2f is %0.2f",num,root);
	printf("\n");
	//printf("Bye... \n");
	
	return 0;
}

