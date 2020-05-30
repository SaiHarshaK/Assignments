#include <stdio.h>

int binSearch(int a[], int left, int right, int key) {
  while (right >= left) {
    int mid = left + (right - left) / 2;
    if (a[mid] == key)
        return mid;
    if (a[mid] < key)
        left = mid + 1;
    else right = mid - 1;
  }
  return -1;
}

int main() {
    int a[] = {1,2,3,4,5}, size = 5, key = 10;
    printf("%d", binSearch(a, 0, size - 1, key));
    return 0;
}
