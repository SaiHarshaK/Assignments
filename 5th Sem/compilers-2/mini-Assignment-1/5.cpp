#include <iostream>
#include <vector>
#include <climits>

using std::cout;
using std::cin;
using std::vector;

//LL for the neighbourhood of vertex in Adjacency list
struct Node {
  int data;
  struct Node* next;
};

//LL which stores the vertices' Adjacency List and pointers to their neighbourhood.
struct Adjacency {
  int vertex;
  //00 is white, 01 is grey, 10 is black
  bool colour1;
  bool colour2;
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
  int input_Character;
  struct Adjacency* adj_list = head_adj_list;
  struct Adjacency* head = (struct Adjacency*)malloc(sizeof(struct Adjacency));
  head->row_head = NULL;//initialization
  head->down = NULL;
  head->colour1 = false;
  head->colour2 = false;
  if( head_adj_list == NULL ) {// first list
    head_adj_list = head;//update main LL
    adj_list = head_adj_list;
  } else { //the main LL exists
    while( adj_list->down ) { //adj list is already built

      adj_list = adj_list->down;
    }//end of list
    adj_list->down = head;
    adj_list = adj_list->down;
  }

  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      if(first_number) {//is the vertex for which corresponding neighbourhood LL will be attached
        first_number = false;
        adj_list->vertex = number;
        number = 0;
        continue;
      }
      //append this number to the current adjacency list.
      struct Node* node = (struct Node*)malloc(sizeof(struct Node));
      node->data = number;
      node->next = NULL;
      if( adj_list->row_head ) {
        struct Node* temp = adj_list->row_head;//head of the list, add to the end now.
        while( temp->next ) {
          temp = temp->next;
        }//now temp->next is NULL so end of the list
        temp->next = node;
      } else { //first number in list
        adj_list->row_head = node;
      }
      number = 0;//re-initialize
      continue;
    }
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  //last number input, same way
  struct Node* node = (struct Node*)malloc(sizeof(struct Node));
  node->data = number;
  node->next = NULL;
  if( adj_list->row_head ) {
    struct Node* temp = adj_list->row_head;//head of the list, add to the end now.
    while( temp->next ) {
      temp = temp->next;
    }//now temp->next is NULL so end of the list
    temp->next = node;
  } else { //first number in list
    adj_list->row_head = node;
  }

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

//Queue Nodes
struct Node_queue {
  int data;
  struct Node_queue* next;
};

//Stores the head, tail and the size of the queue created
struct Queue {
  int size_queue;//stores the size of queue
  struct Node_queue* start;
  struct Node_queue* end;
};

//initialize queue
void create_queue(struct Queue*& q) {
  q = (struct Queue*)malloc(sizeof(struct Queue));
  q->size_queue = 0;
  q->start = NULL;
  q->end = NULL;
}

//return true if empty else return false
bool is_empty(struct Queue* q) {
  return ( q->start == NULL );
}

//add the key to the end of queue
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

//pop the first element in the queue
int dequeue(struct Queue*& q) {
  struct Node_queue* node = q->start;
  int data_stored = node->data;
  q->size_queue--;
  q->start = (q->start)->next;
  free(node);

  return data_stored;
}

//reset colour of the vertex to white, to make then unvisited for next BFS use.
void reset_color(struct Adjacency* head_adj_list) {
  struct Adjacency* adj_list = head_adj_list;
  while( adj_list ) {
    adj_list->colour1 = false;
    adj_list->colour2 = false;
    adj_list = adj_list->down;
  }
}

void bfs(struct Adjacency* adj, int& bfs_source, int vertices, int number, vector<int>& predecessor, vector<int>& distance, bool bfs_list_print) {
  struct Queue *q;
  create_queue(q);

  if( number == -1 ) {//we need to output BFS traversal
    number = 0;
    int input_Character;
    while(( input_Character = getchar() )  != '\n' ) {
      input_Character -= 48;
      number = (number * 10) + input_Character;
    }
  }
  bfs_source = number;//now calculate the BFS according to this source
  if( number > vertices ) return;//do nothing
  //initialize
  predecessor.clear();
  distance.clear();
  for(int i = 0; i < vertices; i++ ) {
    distance.push_back(INT_MAX);
    predecessor.push_back(-1);
  }

  enqueue(q, number);
  distance[number] = 0;
  while( !is_empty(q) ) {
    struct Adjacency* adj_list = adj;
    int u = dequeue(q);
    if( bfs_list_print ) cout<<u<<' ';
    //search in the main LL for vertex u
    if(adj_list == NULL ) return;//nothing is connected
    while( adj_list->vertex != u ) {
      adj_list = adj_list->down;
    }

    if(adj_list == NULL ) return;//the adjacency list of that vertex is not given
    //now we have the neighbourhood list of 'u' and adj_list had vertex u.
    struct Node* vertex_v = adj_list->row_head;
    while( vertex_v ) {//for each neighbourhood vertex v
      int v = vertex_v->data;
      //find the vertex to check its colour
      struct Adjacency* temp = adj;
      while( temp && temp->vertex != v ) {
        temp = temp->down;
      }
      if( temp == NULL ) continue; //vertex has no neighbours
      //if unvisited then update it grey for now
      if( temp->colour1 == false && temp->colour2 == false ) {
        temp->colour2 = true; //grey
        enqueue(q, v);
        distance[v] = distance[u] + 1;
        predecessor[v] = u;
      }
      vertex_v = vertex_v->next;
    }
    //update the vertex to black
    adj_list->colour1 = true;
    adj_list->colour2 = true;
  }
  if( bfs_list_print ) cout<<'\n';
  reset_color(adj);//reset colour of the vertex to white, to make then unvisited for next BFS use.

  free(q);
  return;
}

//Parse input for two numbers,check if there is an edge between two vertices from the adjacency list.
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
    cout<<"0"<<'\n';
    return;
  }
  while( adj_list && adj_list->vertex != number1 ) {
    adj_list = adj_list->down;
  }
  if(adj_list == NULL) {//that vertex dont not have any connections
    cout<<"0"<<'\n';
    return;
  }
  //at the vertex, check the edges now
  struct Node* v = adj_list->row_head;
  while( v ) {
    if( v->data == number2 ) {
      cout<<"1"<<'\n';
      return;
    }
    v = v->next;
  }

  //edge doesn't exist
  cout<<"0"<<'\n';
  return;
}

//Parses input for two numbers, find the shortest path between the vertices containing these numbers, if no path exists prints -1
void shortest_path(struct Adjacency* head_adj_list, int bfs_source, int vertices, vector<int>& bfs_path, vector<int>& predecessor, vector<int>& distance) {
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
  //initialize
  bfs_path.clear();//stores the required path
  if( bfs_source != number1 ) {
    bfs(head_adj_list, bfs_source, vertices, number1, predecessor, distance, false);
  }//now we need to find shortest path using predecessor and distance array
  int path_helper = number2;
  bfs_path.push_back(number2);
  while( predecessor[path_helper] != -1 ) {
    path_helper = predecessor[path_helper];
    bfs_path.push_back(path_helper);
  }
  //now if the ending value is source the path is what we require, else -1
  if( bfs_path.back() == number1 ) {//number1 is bfs_source;
    for( int i = bfs_path.size() - 1 ; i >= 0 ; i-- ) {
      cout<<bfs_path[i]<<" ";
    }
    cout<<'\n';
  } else {
    cout<<"-1"<<'\n';
  }

}

int main() {
  int input_Character;
  int vertices;
  int bfs_source;
  struct Adjacency* adj_list = NULL;
  vector<int> bfs_path, predecessor, distance;//predecessor stores the predessor of each vertex according to the source, distance stores the distance between source and that vertex
  while(( input_Character = getchar() ) != EOF ) {
    if( input_Character == 'N' ) { //number of vertices
      input_Character = getchar();
      get_input(vertices);
      delete_adj_list(adj_list);
      adj_list = NULL;
    } else if( input_Character == 'E' ) { // add element
      input_Character = getchar();
      input_adjacency(adj_list);
    } else if ( input_Character == '?' ) { //find successor
      input_Character = getchar();
      check_edge(adj_list);
    } else if ( input_Character == 'B' ) { //delete element
      input_Character = getchar();
      bfs(adj_list, bfs_source, vertices, -1, predecessor, distance, true);
    } else if ( input_Character == 'P' ) { // search the set for the element
      input_Character = getchar();
      shortest_path(adj_list, bfs_source, vertices, bfs_path, predecessor, distance );
    }
  }
}
