#include<stdio.h>
#include<string.h>
#include<stdlib.h>
char *strrev(char *str,int start,int end)
{
      char *p1, *p2;

      if (! str || ! *str)
            return str;
      for (p1 = str + start, p2 = str + end; p2 > p1; ++p1, --p2)
      {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
      }
      return str;
}
int main()
{
      char str[100];
      printf("enter the string to be reversed\n");
      fgets(str,sizeof(str),stdin);
      str[strlen(str)-1]='\0';
      printf("Enter the value of left and right\n");
      int left,right;
      scanf("%d %d",&left,&right);
      if(left>right)
            {
                  printf("Wront input\n");
                  exit(EXIT_FAILURE);
            }
      else if(left==right)
            {
                  printf("%s\n",str );
                  return 0;
            }
      else if(left>strlen(str) || right>strlen(str) || left<0 ||right<0)
           {
			    printf("Wront input\n");
			    exit(EXIT_FAILURE);
		   }

      strrev(str,left,right);
      printf("%s\n",str );
}
