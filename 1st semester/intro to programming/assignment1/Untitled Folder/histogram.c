#include<string.h>
#include<stdio.h>
int main()
{
	printf("Enter the string\n");
	char str[100];
	fgets(str,100,stdin);
	str[strlen(str)-1]='\0';
	int len=strlen(str);
	int vowel[5]={0};
	for(int i=0;i<len;i++)
	{
			if(str[i]=='a'||str[i]=='A')
				vowel[0]++;
			else if(str[i]=='e'||str[i]=='E')
				vowel[1]++;
			else if(str[i]=='i'||str[i]=='I')
				vowel[2]++;
			else if(str[i]=='o'||str[i]=='O')
				vowel[3]++;
			else if(str[i]=='u'||str[i]=='U')
				vowel[4]++;
	}

	int high=0;
	for(int i=0;i<5;i++)
	{
		if(high<vowel[i])
			high=vowel[i];
	}
	
	for(int i=high;i>0;i--)
	{
		for(int j=0;j<5;j++)
		{
			if(vowel[j]==i)
				{
					printf("* ");
					vowel[j]--;
				}
			else printf("  ");
		}
		printf("\n");
	}
	printf("A E I O U\n");


}