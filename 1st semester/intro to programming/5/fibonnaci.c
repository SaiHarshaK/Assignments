#include<stdio.h>
#include<stdlib.h>
int fibonacci(int n)
{
	if(n<0)
		{
			printf("Wrong input\n");
			exit(EXIT_FAILURE);
		}
	if(n==0)
		return 0;
	if(n==1)
		return 1;

	return (fibonacci(n-1)+fibonacci(n-2));
}
int main()
{
	int n;
	printf("Enter the position of the fibonacci series u want to view\n");
	scanf("%d",&n);
	printf("The value is : %d\n",fibonacci(n));

}