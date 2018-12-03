#include <iostream>

using namespace std;

struct Tree {
  int data;
  int rank;
  struct Tree* parent;
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

//initialize the pointers array and store the sets' address inside them
void initialize(struct Tree**& sets, int size) {
  sets = new struct Tree*[size];
  for( int i = 0; i < size ; i++ ) {
    sets[i] = (struct Tree*)malloc(sizeof(struct Tree));
    sets[i]->data = i;
    sets[i]->rank = 1;
    sets[i]->parent = sets[i];
  }
  return;
}

//clear the sets, delete the dynamic array of pointers
void delete_sets(struct Tree**& sets, int size) {
  for (int i = 0; i < size; i++ ) {
    free(sets[i]);
  }
  delete [] sets;
  sets = NULL;
}

//find the representative
struct Tree* find_set(struct Tree**& sets, int key) {
  struct Tree* rep = sets[key];//find the representative
  while( rep->parent != rep ) {//representative parent is itself
    rep = rep->parent;
  }
  return rep;
}

//
void set_union(struct Tree**& sets, int size) {
  int input_Character,number1 = 0,number2 = 0;
  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      number1 = number2;
      number2 = 0;
      continue;
    }
    input_Character -= 48;
    number2 = (number2 * 10) + input_Character;
  }
  number1--;//base 0
  number2--;//base 0
  if(number1 >= size || number2 >= size ) {//do nothing
    return;
  }

  struct Tree* rep1 = find_set(sets, number1);//find the representative.
  struct Tree* rep2 = find_set(sets, number2);

  if(rep1->rank < rep2->rank) {
    rep1->parent = rep2;
  } else {
    rep2->parent = rep1;
  }
  if(rep1->rank == rep2->rank) {
    rep1->rank++;
  }

  return;
}

void set_belong(struct Tree**& sets, int size) {
  int input_Character,number1 = 0,number2 = 0;
  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      number1 = number2;
      number2 = 0;
      continue;
    }
    input_Character -= 48;
    number2 = (number2 * 10) + input_Character;
  }
  number1--;//base 0
  number2--;//base 0
  if(number1 >= size || number2 >= size ) {
    cout<<"-1"<<'\n';
    return;
  }
  int rep1 = find_set(sets, number1)->data;
  int rep2 = find_set(sets, number2)->data;
  if(rep1 == rep2) {//in same set
    cout<<'1'<<'\n';
  } else {
    cout<<'0'<<'\n';
  }

  return;
}

void find_representative(struct Tree**& sets, int size) {
  int num;
  get_input(num);
  num--;//base 0
  if( num >= size ) {
    cout<<"-1"<<'\n';
    return;
  }
  cout<<find_set(sets, num)->data + 1<<'\n';//answer in base 1

  return;
}

//returns rank of the element
void find_rank(struct Tree**& sets, int size) {
  int num;
  get_input(num);
  num--;//base 0
  if( num >= size ) {//invalid element
    cout<<"-1"<<'\n';
    return;
  }
  cout<<sets[num]->rank<<'\n';

  return;
}

int main() {
  int input_Character, size;
  struct Tree** sets = NULL;//base 0
  while(( input_Character = getchar() ) != EOF ) {
    if( input_Character == 'N' ) { //sets size
      input_Character = getchar();
      get_input(size);
      if(sets != NULL) delete_sets(sets, size);
      initialize(sets, size);
    } else if( input_Character == 'U' ) { // union
      input_Character = getchar();
      set_union(sets, size);
    } else if ( input_Character == '?' ) { // find if the two given elemenst belong to same set
      input_Character = getchar();
      set_belong(sets, size);
    } else if ( input_Character == 'S' ) { // find representative element
      input_Character = getchar();
      find_representative(sets, size);
    } else if ( input_Character == 'R' ) { // rank of element
      input_Character = getchar();
      find_rank(sets, size);
    }
  }

  delete_sets(sets, size);
  return 0;
}
