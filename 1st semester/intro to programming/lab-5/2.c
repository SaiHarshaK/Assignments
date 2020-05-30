#include<stdio.h>
#include"myString.h"
#include"myString.c"
int main()
{
	char a[100],b[100];
	scanf("%s",a);
	scanf("%s",b);
	int x=substring(a,b);

	printf("Answer is : %d",x);
}