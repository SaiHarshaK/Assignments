#include<stdio.h>
int main()
{
 int i,j,k,m;
 scanf("%d",&i);
for (k=1;k<=i;k++) /*k is for rows*/
{
 for(j=1;j<=i;j++)   /*j is for columns*/
 { 
    if(j<=k)
    { printf("*");  }
 }
 printf("\n");
}
}
