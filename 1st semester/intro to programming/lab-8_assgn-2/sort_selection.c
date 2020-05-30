#include<stdio.h>
void swap(int *x,int *y)
{
	int temp=*x;
	*x=*y;
	*y=temp;
}

int main()
{
	printf("Enter the number of elements in array\n");
	int n;
	scanf("%d",&n);

	int a[n];
	printf("Enter the array\n");
	for(int i=0;i<n;i++)
		scanf("%d",&a[i]);

	//using selection sort
	for(int i=0;i<n-1;i++)
	{
		int min=i;
		for(int j=i+1;j<n;j++)
		{
			if(a[min]>a[j])
				min=j;
		}

		swap(&a[i],&a[min]);
	}

	printf("The sorted array is :\n");
	for(int i=0;i<n;i++)
		printf("%d ",a[i]);
}