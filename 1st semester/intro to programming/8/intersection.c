#include <stdio.h>
void swap(int *x,int *y)
{
	int temp=*x;
	*x=*y;
	*y=temp;
}
void selection_sort(int *a,int n)
{
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
}
void bubble_sort(int *a,int n)
{
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
}

void printIntersection(int num1[],int d1,int num2[],int d2)
{

bubble_sort(num1,d1);
selection_sort(num2,d2);
printf("The union of the given two arrays is :\n");
int i=0,j=0;
while(i<d1 && j<d2)
{
	if(num1[i]>num2[j])
		{
			j++;
		}
	else if(num1[i]<num2[j])
	{
			i++;
	}
	else
	{
		printf("%d ",num1[i] );
		i++;
		j++;
	}
}

return;
}
int main()
{
	printf("Enter dimension of 1st array\n");
	int d1;
	scanf("%d",&d1);
	printf("Enter the elements of the array\n");
	int num1[d1];
	for(int i=0;i<d1;i++)
		scanf("%d",&num1[i]);

	printf("Enter the dimension of 2nd array\n");
	int d2;
	scanf("%d",&d2);
	int num2[d2];
	printf("Enter the elements of the array\n");
	for(int i=0;i<d2;i++)
		scanf("%d",&num2[i]);

	printIntersection(num1,d1,num2,d2);
}
