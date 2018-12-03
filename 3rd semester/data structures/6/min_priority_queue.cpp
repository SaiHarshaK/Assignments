#include <iostream>

using std::cout;
using std::cin;

struct min_priority_queue {
  int *queue_arr;
  int heap_size;
};

void heap_initialize(struct min_priority_queue*& min_heap, int limit ) {
  min_heap->queue_arr = new int[limit];
  min_heap->heap_size = 0;
}

void swap(int& a, int& b) {
  int temp = a;
  a = b;
  b = temp;
  return;
}

int parent(int i) {
  return (i-1)/2;
}

void insert_minHeap(struct min_priority_queue*& min_heap, int key) {
  min_heap->heap_size++;
  int i = min_heap->heap_size - 1;
  int *arr = min_heap->queue_arr;
  arr[i] = key;

  while( i > 0 && arr[i] < arr[ parent(i) ] ) {
    swap(arr[i], arr[ parent(i) ]);
    i = parent(i);
  }
}

int heap_minimum(struct min_priority_queue*& min_heap) {
  return (min_heap->queue_arr)[0];
}

void min_heapify(struct min_priority_queue*& min_heap, int index) {
  int left = (2*index)+1;
  int right = (2*index)+2;
  int smallest = index;
  int* arr = min_heap->queue_arr;
  if( left < min_heap->heap_size && arr[index] > arr[left] ) {
    smallest = left;
  }
  if( right < min_heap->heap_size && arr[smallest] > arr[right] ) {
    smallest = right;
  }
  if( smallest != index ) {
    swap(arr[index], arr[smallest]);
    min_heapify(min_heap, smallest);
  }
}

int heap_extract_min(struct min_priority_queue*& min_heap) {
  int* arr = min_heap->queue_arr;
  if( min_heap->heap_size == 1 ) {
    min_heap->heap_size--;
    return arr[0];
  }

  int min = arr[0];
  //remove the min from arr
  arr[0] = arr[min_heap->heap_size - 1];
  min_heap->heap_size--;
  min_heapify(min_heap, 0);
  return min;
}

void decrease_key(struct min_priority_queue*& min_heap, int index, int key) {
  int* arr = min_heap->queue_arr;
  arr[index] = key;
  while( index > 0 && arr[index] < arr[ parent(index) ] ) {
    swap(arr[index], arr[ parent(index) ]);
    index = parent(index);
  }
}

int main() {
  struct min_priority_queue* min_heap = (struct min_priority_queue*)malloc(sizeof(min_priority_queue));
  heap_initialize(min_heap, 11);
  insert_minHeap(min_heap, 3);
  insert_minHeap(min_heap, 2);
  insert_minHeap(min_heap, 15);
  insert_minHeap(min_heap, 5);
  insert_minHeap(min_heap, 4);
  insert_minHeap(min_heap, 45);
  cout<<heap_extract_min(min_heap)<<" ";
  cout<<heap_minimum(min_heap)<<" ";
  decrease_key(min_heap, 2, 1);
  cout<<heap_minimum(min_heap);
  return 0;
}
