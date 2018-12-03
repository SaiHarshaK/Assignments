#include<stdio.h>
#include<string.h>
int main()
{
	char a[100];
	printf("Enter a string\n");
	fgets(a,100,stdin);
	if(strlen(a)==100)
		{
			printf("really dude? -_-\n");
			return 0;
		}

	a[strlen(a)-1]='\0';

	printf("Enter the number of left rotations\n");
	int k;
	scanf("%d",&k);
	k%=strlen(a);
	int j=strlen(a);
	printf("The rotated string is: ");
	for(int i=k-1;i<j;i++)
		printf("%c",a[i] );
	for(int i=0;i<k-1;i++)
		printf("%c",a[i] );

	return 0;
}
