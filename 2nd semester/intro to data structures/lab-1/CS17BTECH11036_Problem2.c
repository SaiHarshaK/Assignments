#include <stdio.h>
#include <stdlib.h>

int ans;
int flag=0;

void binary_search_duplicate(int a[],int lo,int hi,int key)
{

	int mid;
	if(lo>hi) //if low is higher than high, then terminate program ,print the value of index of 1st duplicate if present
	{
		if(flag==1)
			printf("%d\n",ans );
		else 
		printf("Key not found\n");
	
		exit(EXIT_SUCCESS);
	}
	
	mid = (lo + hi) / 2;
	if(a[mid]==key) //in the case when key is found
	{
		ans=mid;
		flag=1;
		binary_search_duplicate(a,lo,mid-1,key);
	}
	else if (a[mid] > key)
    {
        binary_search_duplicate(a, lo, mid - 1, key);
    }
    else if (a[mid] < key)
    {
        binary_search_duplicate(a, mid + 1, hi, key);
    }
}

int main()
{

	int size;
	printf("Enter the number of elements in the array : \n");
	scanf("%d",&size);

	int a[size];

	printf("Enter the elements\n");
	for(int i=0;i<size;i++)
		scanf("%d",&a[i]);

	printf("Enter the number to be found in the array\n");
	int key;
	scanf("%d",&key);
	printf("Answer:");
	binary_search_duplicate(a,0,size,key);
}
