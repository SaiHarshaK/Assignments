#include <iostream>

using std::cout;

struct Node_queue {
  int data;
  struct Node_queue* next;
};

struct Queue {
  int size_queue;//stores the size of queue
  struct Node_queue* start;
  struct Node_queue* end;
};

void create_queue(struct Queue*& q) {
  q->size_queue = 0;
  q->start = NULL;
  q->end = NULL;
}

bool is_empty(struct Queue* q) {
  return ( q->end == NULL );
}

void enqueue(struct Queue*& q, int key) {
  struct Node_queue* node = (struct Node_queue*)malloc(sizeof(struct Node_queue));
  node->data = key;
  node->next = NULL;
  q->size_queue++;
  if( !is_empty(q) ) {
    (q->end)->next = node;
    q->end = node;
  }
  else { //currently queue is empty
    q->start = node;
    q->end = node;
  }

  return;
}

int dequeue(struct Queue*& q) {
  struct Node_queue* node = q->start;
  int data_stored = node->data;
  q->size_queue--;
  q->start = (q->start)->next;
  free(node);

  return data_stored;
}

void print_queue(struct Node_queue* node) {
  if( node == NULL ) cout<<"Nope";
  else {
    cout<<node->data<<'\n';
    print_queue(node->next);
  }
}

int main() {
  struct Queue *q;
    q = (struct Queue*)malloc(sizeof(struct Queue));
    create_queue(q);
    enqueue(q,10);
    enqueue(q,20);
    enqueue(q,30);
    printf("Queue before dequeue\n");
    print_queue(q->start);
    dequeue(q);
    printf("Queue after dequeue\n");
    print_queue(q->start);
}
