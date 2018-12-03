#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int main()
{
	int num_decimals,temp;
	float num;
	scanf("%f",&num);
    int flag=0;
    

    num_decimals=(num-floor(num))*100000000;
  

    int count=0;
    while(flag==0)
    {

    	if(num_decimals%10==0)
    	{
    		num_decimals/=10;
            count++;
        }

    	else flag=1;
    }
    //i get decimal part of number
   
   int denominator=100000000;
   
   while(count>0)
   {
   	denominator/=10;
   	count--;
   }
num_decimals+=floor(num)*denominator;

int i;
yolo:
   for(i=2;i<=num_decimals;i++)
    {
    	if(num_decimals%i==0 && denominator%i==0)
    	{
    		num_decimals/=i;denominator/=i;
    		goto yolo;
    	}

    }


    printf("%d/%d ",num_decimals,denominator);
}