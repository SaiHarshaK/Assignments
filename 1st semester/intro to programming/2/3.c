#include<stdio.h>
int main()
{
	printf("Enter a number\n");
	int x;
	scanf("%d",&x);

	for(int i=1;i<=x;i++)
	{
		printf("%d ",i*i);
		if(i%5==0)
			printf("\n");
	}
}
