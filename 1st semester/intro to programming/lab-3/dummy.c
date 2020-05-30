#include<stdio.h>
#include<string.h>
int main()
{
	int num,temp,remainder;
	scanf("%d",&num);
	int reverse=0;
    temp=num;
	while(temp>0)
	{
		remainder=temp%10;
		reverse=reverse*10 + remainder;
		temp/=10;
	}

	printf("reverse of number enteres is %d\n",reverse);

   temp=reverse;
   int binary=0;
   int i=0;
   while(temp>0)
   {
     remainder=temp%2;
     temp/=2;
     binary=binary*10+remainder;

   }
   printf("%d",binary);
}