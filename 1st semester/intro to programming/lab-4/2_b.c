/*sum of n numbers*/

#include<stdio.h>

int addition(int n[],int num)
{
	int sum=0;
	for(int i=0;i<num;i++)
	{
		sum+=n[i];
	}
	return sum;
}
int main()
{
	int num;
	scanf("%d",&num);
	int n[num],sum=0;
	for(int i=0;i<num;i++)
	{
		scanf("%d",&n[i]);
	
	}
	sum=addition(n,num);
	printf("%d",sum);
}