#include<stdio.h>
#include<string.h>
int main()
{
	char s[100];
    scanf("%s",s);
    int shift,j;
    scanf("%d",&shift);
    shift%=26;
    j=strlen(s);
    for(int i=0;i<j;i++)
    {
       s[i]+=shift;
       if(s[i]>90)
       	s[i]-=26;
       else if(s[i]<65)
       	s[i]+=26;
    }
    printf("%s",s);
}