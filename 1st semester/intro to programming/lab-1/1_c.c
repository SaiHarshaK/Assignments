#include<stdio.h>
#include<string.h>
int main()
{
	char c[100],c1[100],cap[100],cap1[100];
	printf("Enter the name of country ");
	fgets(c,100,stdin);
	c[strlen(c)-1]='\0';
	printf("Enter its capital ");
	fgets(cap,100,stdin);
	cap[strlen(cap)-1]='\0';
	printf("Enter the name of country ");
	fgets(c1,100,stdin);
	c1[strlen(c1)-1]='\0';
	printf("Enter its capital ");
	fgets(cap1,100,stdin);
	cap1[strlen(cap1)-1]='\0';

	printf("The capitals of %s and %s are %s and %s respectively",c,cap,c1,cap1);

	return 0;
}
