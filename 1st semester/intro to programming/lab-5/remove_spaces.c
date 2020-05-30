#include<stdio.h>
#include<string.h>

void remove_spaces(char *str)
{
	int len=strlen(str);
	int count;
	for(int i=0;i<len;i++)
		{
			if(str[i]!=' ')
			str[count++]=str[i];
		}

	str[count]='\0';	
}
int main()
{
	char str[1000];
	printf("Enter the string\n");
	fgets(str,1000,stdin);
	str[strlen(str)-1]='\0';
	remove_spaces(str);
	printf("%s",str);
	return 0;
}
