#include<stdio.h>
#include<string.h>

void string_reverse(char s[])
{
	int i, j;
	for (i = 0, j = strlen(s)-1; i<j; i++, j--)
	{
		int tmp = s[i];
		s[i] = s[j];
		s[j] = tmp;
	}
}

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
   char binary[100];
   int i=0,j;
   while(temp>0)
   {
     remainder=temp%2;
     temp/=2;
     binary[i]=remainder+'0';
     i++;

   }
   binary[i]='\0';
   
   string_reverse(binary);
   printf("%s\n",binary );
   
}