#include<string.h>
#include<stdio.h>
int main()
{
	int n;
	printf("Enter the number of pairs of a and b: \n");
	scanf("%d",&n);
	int a[n],b[n];
	int sum;
	for(int i=n-1;i>0;i--)
	{
		sum=a[i]+b[i];
		b[i-1]=(b[i-1]*sum)/(b[i-1]+sum);
	}
	sum=a[0]+b[0];
	printf("Net resistance : %d\n",sum );
}