#include<stdio.h>
int main()
{
	int n;
	printf("Enter a number\n");
	scanf("%d",&n);
	printf("Enter the value of position(from right)\n");
	int s;
	scanf("%d",&s);
	n>>=s-1;
	printf("The bit is %d",n%2);
	return 0;
	//for and (with 2^k-1), if value after and is >1 then print 1 else 0....ezi pzi
}