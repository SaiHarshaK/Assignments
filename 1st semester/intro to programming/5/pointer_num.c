#include<stdio.h>
int main()
{
	int num;
	int *ptr1=&num,*ptr2=&num;

	printf("Enter an integer value:\n");
	scanf("%d",&(*ptr1));
	printf("The value is : %d \n",*ptr2 );
}