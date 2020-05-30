#include<stdio.h>

int main()
{
    int count;

    printf("Count up \n");
    count=1;
    while(count<=10)
    {
        printf("%d \n",count);
        count=count+1;
    }

    // Now count is 11.
    printf("Count down \n");
    count=count-1;    // Now count is 10.
     while(count>=1)
    {
        printf("%d \n",count);
        count=count-1;
    }


}
