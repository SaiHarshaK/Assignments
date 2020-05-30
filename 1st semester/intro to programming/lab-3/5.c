#include<stdio.h>
#include<math.h>
#include<stdlib.h>
int main()
{
	int num;
	scanf("%d",&num);
    float PI=3.14159;
    double temp;
    int i;
    printf("sin values\n");
    for(i=0;i<num;i++)
    {
       temp= (i*PI)/num;
       printf("%Lf ",sin(temp));
    }
    printf("\ncos values");
    for(i=0;i<num;i++)
    {
       temp= (i*PI)/num;
       printf("%lf ",cos(temp));
    }
    printf("\ntan values");
    for(i=0;i<num;i++)
    {
       temp= (i*PI)/num;
       printf("%lf ",tan(temp));
    }

    printf("\n");


}