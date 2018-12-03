#include <stdio.h>
 
void binary_search(int arr[], int lo, int hi, int key)
{
    int mid;
 
    if (lo > hi)
    {
        printf("number not found\n");
        return;
    }
    mid = (lo + hi) / 2;
    if (arr[mid] == key)
    {
        printf("number found\n");
    }
    else if (arr[mid] > key)
    {
        binary_search(arr, lo, mid - 1, key);
    }
    else if (arr[mid] < key)
    {
        binary_search(arr, mid + 1, hi, key);
    }
}

 
int main()
{
    int key, size;
 
    printf("Enter number of elements to search\n");
    scanf("%d", &size);
    int arr[size];
    printf("Enter the numbers\n");
    for(int i=0;i<size;i++)
        scanf("%d",&arr[i]);
    printf("Enter number to search\n");
    scanf("%d", &key);
    binary_search(arr, 0, size, key);
 
}
 
