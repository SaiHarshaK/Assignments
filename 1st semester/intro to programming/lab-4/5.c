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
	char str[100];
	scanf("%s",str);
	string_reverse(str);
	int j=strlen(str);
	for(int i=0;i<j;i++)
	{
		for(int k=i;k<j;k++)
			{
				for(int z=i;z<=k;z++)
					printf("%c",str[z] );

				printf("\n");
			}
	}
}
