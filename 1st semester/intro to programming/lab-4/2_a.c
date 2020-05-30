/*sum of n numbers*/

#include<stdio.h>
int main()
{
	int num;
	scanf("%d",&num);
	int n[num],sum=0;
	for(int i=0;i<num;i++)
	{
		scanf("%d",&n[i]);
		sum+=n[i];
	}
	printf("%d",sum);
}