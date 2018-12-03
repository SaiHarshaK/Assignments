#include<stdio.h>
int main()
{
	int num,highest,temp;
	int arr[8],i,j;
	scanf("%d",&arr[0]);
	temp=arr[0];
	for(i=1;i<8;i++)
	{
		scanf("%d",&arr[i]);
		if(arr[i]>temp)
			temp=arr[i];
    }
    printf("%d",temp);


}