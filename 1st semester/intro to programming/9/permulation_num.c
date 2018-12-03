#include<stdio.h>
#include<string.h>
#define limit 10000

void swap(char *x,char *y)
{
	int temp=*x;
	*x=*y;
	*y=temp;
}
//quicksort
int partition (char arr[], int low, int high)
{
    int pivot = arr[high];    // pivot
    int i = (low - 1);  // Index of smaller element
 
    for (int j = low; j <= high- 1; j++)
    {
        // If current element is smaller than or
        // equal to pivot
        if (arr[j] <= pivot)
        {
            i++;    // increment index of smaller element
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

void quickSort(char arr[], int low, int high)
{
    if (low < high)
    {
        /* pi is partitioning index, arr[p] is now
           at right place */
        int pi = partition(arr, low, high);
 
        // Separately sort elements before
        // partition and after partition
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

void next_permutation(char *num)
{
	int len=strlen(num);
	int found_1,found_2;//to interchange
	for(int i=len-2;i>0;i--) //start
	{
		for(int j=i+1;j<len;j++)//end
		{
			if(num[j]>num[i])
			{
				found_1=i;//6
				found_2=j;//7
				//before interchange that is
				goto found_it_XD;//to stop.
			}
		}
	}

	found_it_XD:
	swap(&num[found_1],&num[found_2]);

	quickSort(num, found_2, len-1);

}
int main()
{
	printf("Press 1 for finding next permulation or press 2 to list out all permutations\n");
	short int choice;
	scanf("%hd",&choice);
	getchar();

if(choice==1)
{
	printf("Enter the permutation\n");
	char num[limit];
	scanf("%s",num);
	getchar();

	
	printf("The next permutation is : \n");
	printf("%s",num);
	
	return 0;
}
else if(choice==2)
{
	printf("Enter the permutation\n");
	char num[limit];
	scanf("%s",num);
	getchar();

	int len=strlen(num);

	return 0;
}
}
