#include<stdio.h>

int main()
{
	int num, numcopy;
	int digit;
	int base;
	int reverse;

	printf("** This program prints a number in a desired base. ** \n");
	printf("Enter the number: ");
	scanf("%d",&num);

	printf("Enter the base: ");
	scanf("%d",&base);

	if (base<=0){
	printf("Invalid base");
	return 1;
	}

	numcopy=num;
	if (numcopy<0){
		numcopy=-numcopy;
		printf("-");
	}


	reverse=0;
	while (numcopy>0){
		digit=numcopy%base;
		reverse=reverse*base+digit;
		numcopy=numcopy/base;
	}

	printf("The reversed number is %d",reverse);
	printf("\n");
	numcopy=reverse;
	while (numcopy>0){
		digit=numcopy%base;
		numcopy=numcopy/base;
		printf(" %d",digit);
	}


	return 0;

}
