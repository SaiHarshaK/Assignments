#include<stdio.h>
#include<string.h>
#include "myString.h"
void printVertical(char text[])
{
    int i=0;
    while (text[i]!='\0')
    {
        printf("\n %c",text[i]);
        i=i+1;
    }
}

void readString(char *text, int length)
{
    int i=0;
    fgets(text,length,stdin);
    while ((text[i]!='\n') && (text[i]!='\0'))
    {
        i=i+1;
    }
    text[i]='\0';
}

int substring(char a[],char b[])
{
    int len_a=strlen(a);
    int len_b=strlen(b);
    int count=0;
    int ans,k;
    for(int i=0;i<len_b;i++)
    {
        if(b[i]==a[0])
        {
            k=i;
            ans=i;
            for(int j=0;j<len_a && k<len_b;j++,k++)
            {
                    
                    if(a[j]==b[k])
                        count++;
            
            }

        if(count==len_a)
            goto yolo;
        else count=0;
        }
    }

    yolo:
    if(count==len_a)
        return ans;
    else return -1;
}
