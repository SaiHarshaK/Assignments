#include <iostream>
#include <vector>
#include <climits>

using std::cout;
using std::cin;
using std::vector;

//LL for the neighbourhood of vertex in Adjacency list
struct Node {
  int data;//vertex
  int weight;
  struct Node* next;
};

//LL which stores the vertices' Adjacency List and pointers to their neighbourhood.
struct Adjacency {
  int vertex;
  struct Node* row_head;
  struct Adjacency* down;
};

//parses input from buffer by character until a '\n' and converts to an integer
void get_input(int& number) {
  number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }

  return;
}

//Parse input and store the neighbourhood of the given vertex in its respective LL.
void input_adjacency(struct Adjacency*& head_adj_list) {
  int number = 0;
  bool first_number = true;//is the vertex for which corresponding neighbourhood LL will be attached
  bool store_weight = false;//helps in storing weight in the corresponding neighbourhood vertex LL
  int input_Character;
  struct Adjacency* adj_list = head_adj_list;
  struct Adjacency* head = (struct Adjacency*)malloc(sizeof(struct Adjacency));
  //initialization
  head->row_head = NULL;
  head->down = NULL;
  if( head_adj_list == NULL ) { // first list
    head_adj_list = head;//update main LL
    adj_list = head_adj_list;
  } else { //the main LL exists
    while( adj_list->down ) { //adj list is already built
      adj_list = adj_list->down;
    }//end of list
    adj_list->down = head;
    adj_list = adj_list->down;
  }

  bool second_number = false;//second number in input , is the head of neighbourhood LL.
  struct Node* temp = adj_list->row_head;
  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      if(first_number) {//is the vertex for which corresponding neighbourhood LL will be attached
        first_number = false;
        second_number = true;
        adj_list->vertex = number;
        number = 0;
        continue;
      }
      if( second_number ) { //update adj_list->row_head
        //append this number to the current adjacency list.
        struct Node* node = (struct Node*)malloc(sizeof(struct Node));
        node->next = NULL;
        node->data = number;
        adj_list->row_head = node;
        temp = adj_list->row_head;
        second_number = false;
        store_weight = true;
        number = 0;
        continue;
      }
      if( store_weight ) {
        temp->weight = number;
        store_weight = false;
        number = 0;
        continue;
      }
      //store neighbourhood vertex( not the first one )
      //append this number to the current adjacency list.
      struct Node* node = (struct Node*)malloc(sizeof(struct Node));
      node->next = NULL;
      node->data = number;
      temp->next = node;
      temp = temp->next;
      store_weight = true;
      number = 0;//re-initialize
      continue;
    }
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }

  //last number input only update the weight
  temp->weight = number;

  return ;
}

//New Graph to store, so we delete existing Adjacency List and its neighbourhood list
void delete_adj_list(struct Adjacency*& head_adj_list) {
  struct Adjacency* adj_list = head_adj_list;
  while( head_adj_list ) {
    adj_list = head_adj_list;
    head_adj_list = head_adj_list->down;

    while( adj_list->row_head ) {
      struct Node* temp = adj_list->row_head;
      adj_list->row_head = (adj_list->row_head)->next;
      free(temp);
    }
    free(adj_list);
  }
  return;
}

//min-priority queue using heaps, implements as dynamic arrays and LL Node to store its pointers and heap_size
//we basically implement the queue as usual wrt distance array, but accordingly we swap the vertex too
struct min_priority_queue {
  int *vertex;//an array
  int *distance;//an array, its respective distance from source
  int heap_size;
};

//initialize the new constructed heap's data
void heap_initialize(struct min_priority_queue*& min_heap, int limit ) {
  min_heap->vertex = new int[limit];
  min_heap->distance = new int[limit];
  min_heap->heap_size = 0;
}

//swap numbers, input by reference , no need to send its address
void swap(int& a, int& b) {
  int temp = a;
  a = b;
  b = temp;
  return;
}

//parent of index i, in the heap
int parent(int i) {
  return (i-1)/2;
}

//personalized insert, inserted in increaseing order anyway
void insert_minHeap(struct min_priority_queue*& min_heap, int key) {
  min_heap->heap_size++;
  int i = min_heap->heap_size - 1;
  int *arr = min_heap->vertex;
  int *dist = min_heap->distance;
  arr[i] = i;
  dist[i] = key;
}

//heapify the subtree at given index,
void min_heapify(struct min_priority_queue*& min_heap, int index) {
  int left = (2*index)+1;
  int right = (2*index)+2;
  int smallest = index;
  int* arr = min_heap->vertex;
  int* dist = min_heap->distance;
  if( left < min_heap->heap_size && dist[index] > dist[left] ) {
    smallest = left;
  }
  if( right < min_heap->heap_size && dist[smallest] > dist[right] ) {
    smallest = right;
  }
  if( smallest != index ) {
    swap(arr[index], arr[smallest]);
    swap(dist[index], dist[smallest]);
    min_heapify(min_heap, smallest);
  }
}

//we remove the root element(return only vertex at root, we dont use the distance value anyway)
int heap_extract_min(struct min_priority_queue*& min_heap) {
  int* arr = min_heap->vertex;
  int* dist = min_heap->distance;

  if( min_heap->heap_size == 1 ) {
    min_heap->heap_size--;
    return arr[0];
  }
  int min = arr[0];//we only need the vertex
  //remove the min from arr
  arr[0] = arr[min_heap->heap_size - 1];
  dist[0] = dist[min_heap->heap_size - 1];
  min_heap->heap_size--;
  min_heapify(min_heap, 0);
  return min;
}

//change distance value of vertex v and then place it accordingly
void decrease_key(struct min_priority_queue*& min_heap, int vertex, int key) {
  int* arr = min_heap->vertex;
  int* dist = min_heap->distance;
  int index;
  //find index of that vertex
  for( index = 0; index < min_heap->heap_size ; index++ ) {
    if( arr[index] == vertex ) break;
  }
  dist[index] = key;
  while( index > 0 && dist[index] < dist[ parent(index) ] ) {
    swap(arr[index], arr[ parent(index) ]);
    swap(dist[index], dist[ parent(index) ]);
    index = parent(index);
  }
}

//check if the given vertex is in the vertex
bool v_in_heap(struct min_priority_queue*& min_heap, int vertex) {
  int* arr = min_heap->vertex;
  for (int i = 0; i < min_heap->heap_size ; i++ ) {
    if( arr[i] == vertex ) return true;
  }
  return false;
}

//parses input for the source, accordingly prints pairs of vertex and its distance from source in its order of traversal usign dijiktras algorithm.
void dijikstra(struct Adjacency* adj, int& dijikstra_source, int vertices, int number, vector<int>& predecessor, vector<int>& path_length, bool dijikstra_print) {
  struct min_priority_queue* min_heap = (struct min_priority_queue*)malloc(sizeof(struct min_priority_queue));
  heap_initialize(min_heap, vertices);
  int* arr = min_heap->vertex;
  int* dist = min_heap->distance;
  if( number == -1 ) {//we need to output dijikstra traversal
    number = 0;
    int input_Character;
    while(( input_Character = getchar() )  != '\n' ) {
      input_Character -= 48;
      number = (number * 10) + input_Character;
    }
  }
  dijikstra_source = number - 1;//in base index 0, now calculate the dijikstra according to this source
  if( number > vertices ) return;//do nothing
  //initialize
  predecessor.clear();
  path_length.clear();
  for(int i = 0; i < vertices; i++ ) {
    dist[i] = INT_MAX;
    predecessor.push_back(-1);
    insert_minHeap(min_heap, dist[i]);//takes care of pos array too
    path_length.push_back(INT_MAX);
  }
  //source to be extracted first
  path_length[dijikstra_source] = 0;
  decrease_key(min_heap, dijikstra_source, path_length[dijikstra_source]);
  while( min_heap->heap_size ) {
    int u = heap_extract_min(min_heap);
    u++;//base index 1

    //find vertex u
    struct Adjacency* adj_list = adj;
    //search in the main LL for vertex u
    if(adj_list == NULL ) {//nothing is connected
        cout<<u<<' ';
        if( u == dijikstra_source + 1 ) cout<<'0'<<'\n';
        else cout<<"-1"<<'\n';
        continue;
    }
    while( adj_list && adj_list->vertex != u ) {
      adj_list = adj_list->down;
    }
    if( dijikstra_print ) {
      cout<<u<<' ';//u-1 for base index 0
      if( path_length[u - 1] == INT_MAX ) cout<<"-1"<<'\n';
      else cout<<path_length[u - 1]<<'\n';
    }
    //now we have the neighbourhood list of 'u' and adj_list had vertex u.
    if( adj_list == NULL ) continue;
    struct Node* vertex_v = adj_list->row_head;

    u--;//base index 0
    while( vertex_v ) {//for each neighbourhood vertex v
      int v = vertex_v->data;
      v--;//base index 0
      if( v_in_heap(min_heap, v) ) {//check if v is there in the min_heap
        if( path_length[u] == INT_MAX ) {//shouldn't happen
          vertex_v = vertex_v->next;
          continue;
        }
        if( vertex_v->weight + path_length[u] < path_length[v] ) {//is the new distance by u to v less than previous?
          predecessor[v] = u;
          path_length[v] = vertex_v->weight + path_length[u];
          decrease_key(min_heap, v, path_length[v]);
        }
      }
      vertex_v = vertex_v->next;
    }
  }
  //destroy heap's memory
  delete [] arr;
  delete [] dist;
  free(min_heap);
  return;
}

//Parse input for two numbers,check if there is an edge between two vertices from the adjacency list.
//if present we print the weight of the edge, else -1.
void check_edge(struct Adjacency* head_adj_list) {
  int number1 = 0;
  int number2 = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      number1 = number2;
      number2 = 0;
      continue;
    }
    input_Character -= 48;
    number2 = (number2 * 10) + input_Character;
  }
  //find vertex containing number1
  struct Adjacency* adj_list = head_adj_list;
  //go to main LL with vertex = number1
  if(adj_list == NULL) {//no connections
    cout<<"-1"<<'\n';
    return;
  }
  while( adj_list && adj_list->vertex != number1 ) {
    adj_list = adj_list->down;
  }
  if(adj_list == NULL) {//that vertex dont not have any connections
    cout<<"-1"<<'\n';
    return;
  }
  //at the vertex, check the edges now
  struct Node* v = adj_list->row_head;
  while( v ) {
    if( v->data == number2 ) {
      cout<<v->weight<<'\n';
      return;
    }
    v = v->next;
  }

  //edge doesn't exist
  cout<<"-1"<<'\n';
  return;
}

//Parses input for two numbers, find the shortest path between the vertices containing these numbers, if no path exists prints -1
void shortest_path(struct Adjacency* head_adj_list, int& dijikstra_source, int vertices, vector<int>& predecessor, vector<int>& path_length ) {
  int number1 = 0;
  int number2 = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      number1 = number2;
      number2 = 0;
      continue;
    }
    input_Character -= 48;
    number2 = (number2 * 10) + input_Character;
  }
  if( number1 == number2 ) {
    cout<<"0 "<<number1<<'\n';
    return;
  }
  //initialize
  vector<int> shortest_path;//stores the required path
  if( dijikstra_source != number1 - 1 ) {
    //send only number1 since dijikstra func already converts it to base index 0
    dijikstra(head_adj_list, dijikstra_source, vertices, number1, predecessor, path_length , false);
  }//now we need to find shortest path using predecessor and distance array
  int path_helper = number2 - 1;
  shortest_path.push_back(path_helper);
  while( predecessor[path_helper] != -1 ) {
    path_helper = predecessor[path_helper];
    shortest_path.push_back(path_helper);
  }
  //now if the ending value is source the path is what we require, else -1
  if( shortest_path.back() == dijikstra_source ) {
    //print total length of path
    cout<<path_length[number2 - 1]<<' ';
    for( int i = shortest_path.size() - 1 ; i >= 0 ; i-- ) {
      cout<<shortest_path[i] + 1<<' ';//to base index 1
    }
    cout<<'\n';
  } else {
    cout<<"-1"<<'\n';
  }
  return;
}

int main() {
  int input_Character;
  int vertices;
  int dijikstra_source = -1;
  struct Adjacency* adj_list = NULL;
  vector<int> path_length, predecessor;//predecessor stores the predessor of each vertex according to the source, path_length stores the distance between source and that vertex
  while(( input_Character = getchar() ) != EOF ) {
    if( input_Character == 'N' ) { //number of vertices
      input_Character = getchar();
      get_input(vertices);
      delete_adj_list(adj_list);
      adj_list = NULL;
    } else if( input_Character == 'E' ) { // add element
      input_Character = getchar();
      input_adjacency(adj_list);
      //print_a(adj_list);
    } else if ( input_Character == '?' ) { //find successor
      input_Character = getchar();
      check_edge(adj_list);
    } else if ( input_Character == 'D' ) { //delete element
      input_Character = getchar();
      dijikstra(adj_list, dijikstra_source, vertices, -1, predecessor, path_length, true);
    } else if ( input_Character == 'P' ) { // search the set for the element
      input_Character = getchar();
      shortest_path(adj_list, dijikstra_source, vertices, predecessor, path_length );
    }
  }

  delete_adj_list(adj_list);
  return 0;
}
