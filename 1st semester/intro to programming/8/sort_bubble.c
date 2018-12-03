#include<stdio.h>
int main()
{
	printf("Enter the number of elements in array\n");
	int n;
	scanf("%d",&n);

	int a[n];
	printf("Enter the array\n");
	for(int i=0;i<n;i++)
		scanf("%d",&a[i]);

	//using bubble sort
	for(int i=0;i<n-1;i++)
	{
		int flag=0;

		for (int j=0;j<n-i-1;j++)
		{
			if(a[j]>a[j+1])
			{
				int temp=a[j];
					a[j]=a[j+1];
					a[j+1]=temp;
				flag=1;
			}
		}
		if(flag==0)
			break;
	}

	printf("The sorted array is :\n");
	for(int i=0;i<n;i++)
		printf("%d ",a[i]);
}
