#include<stdio.h>
#include<math.h>
#include<stdlib.h>
#include<stdio.h>
int factorial(int i)
 {
  int j,l=1;
  for (j=1;j<=i;j++)
    l*=j;
   return (l);
  }
   
    



int main()
{
	float num;
	scanf("%f",&num);
    printf("values without using taylor expansion\n");
    printf("exp   %lf\n",exp(num));
    printf("log   %lf\n",log(num));
    printf("sin   %lf\n",sin(num));

    printf("\nvalues with using taylor expansion\n");
    
    float sum=1.0;
    float temp=num;
    for(int i=1;i<=20;i++)
    {
      temp*=(temp/i);
      sum+=temp;
      
    }
  printf("%f\n",sum );


    sum=0;
    temp=num;
    for(int i=1;i<=20;i++)
    {
      temp*=(temp/i);
      if(i%2==0)
        temp*=-1;
      sum+=temp;
      
    }
  printf("%f\n",sum );
}
