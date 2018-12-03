#include <stdio.h>
#include <stdlib.h>

// doubly linked list
struct Node_num {
    int data;
    struct Node_num* next; // Pointer to next node in DLL
    struct Node_num* prev; // Pointer to previous node in DLL
};

//insert node to the start for number
void push(struct Node_num** head_ref, int new_data) {
  struct Node_num* new_node = (struct Node_num*)malloc(sizeof(struct Node_num));
  new_node->data = new_data;
  new_node->next = (*head_ref);
  new_node->prev = NULL;

  if ((*head_ref) != NULL) {
    (*head_ref)->prev = new_node;
  }
  (*head_ref) = new_node;
  return;
}

//insert node at the end for number
void append(struct Node_num** head_ref, int new_data) {
  struct Node_num* new_node = (struct Node_num*)malloc(sizeof(struct Node_num));
  new_node->data = new_data;
  new_node->next = NULL;

  if (*head_ref == NULL) {
    new_node->prev = NULL;
    *head_ref = new_node;
    return;
   }

  struct Node_num* last = *head_ref;
  while(last->next != NULL) {
    last = last->next;
  }
  last->next = new_node;
  new_node->prev = last;
  return;
}

//delete the LL after use
void delete_DLL(struct Node_num** head_ref) {
  struct Node_num* current = *head_ref;
  struct Node_num* next;

  while (current != NULL)
  {
     next = current->next;
     free(current);
     current = next;
  }

  *head_ref = NULL;
}

void sanitize( struct Node_num** head_ref, int *count_ptr ) {
  struct Node_num* head = *head_ref;
  //remove starting zeroes
  while(head != NULL) {
    if(head->data == 0){
      head = head->next;
      (*count_ptr)--;
    }
    else break;
  }
  //re-assign head
  *head_ref = head;
}

//get equal length DLL by adding 0's to the start of the DLL with smaller length
void equalize_length(struct Node_num** head_ref_1, struct Node_num** head_ref_2, int count_1, int count_2) {
  if(count_1 < count_2) {
    for(int k = count_2 - count_1; k > 0; k--) {
      push(head_ref_1,0);
    }
  }
  else if(count_2 < count_1) {
    for(int k = count_1 - count_2; k > 0; k--) {
      push(head_ref_2,0);
    }
  }
  return;
}

//compare the two numbers stored in DLL's
int cmp(struct Node_num** head_ref_1, struct Node_num** head_ref_2, int count_1, int count_2) {
  equalize_length(head_ref_1,head_ref_2,count_1,count_2);
  struct Node_num* l1 = *head_ref_1;
  struct Node_num* l2 = *head_ref_2;

  while(l1 != NULL) { //l1 and l2 have same length (the DLL's) so check one DLL is enough
    if(l1->data < l2->data) { //number_1 is less than number_2
      if(count_1 > count_2) {
        sanitize(head_ref_2, &count_2);//since we added zeroes to second number
      }
      else sanitize(head_ref_1, &count_1);
      return 0;
    }
    else if(l1->data > l2->data) {
      if(count_1 > count_2) {
      sanitize(head_ref_2, &count_2);//since we added zeroes to second number
      }
      else sanitize(head_ref_1, &count_1);
        return 1;
      }
    else {//l1->data == l2->data
      l1 = l1->next;
      l2 = l2->next;
    }
  }
  //if both the numbers are equal.
  if(count_1 > count_2) {
    sanitize(head_ref_2, &count_2);//since we added zeroes to second number
  }
  else sanitize(head_ref_1, &count_1);
  return 2;
}

//tree structure starts here
struct Tree {
  int digit_length;
  struct Node_num *num; //address to the number LL
  struct Tree *left, *right, *parent;
};

//create a node in BST
struct Tree *newNode(struct Node_num* number_head,int count)
{
    struct Tree *temp =  (struct Tree *)malloc(sizeof(struct Tree));
    temp->num = number_head;
    temp->digit_length = count;
    temp->left = NULL;
    temp->right = NULL;
    temp->parent = NULL;
    return temp;
}

//find position to insert node with value in BST
struct Tree* insert(struct Tree* node, struct Node_num* key, int count)
{
    // If the tree is empty, return a new node
    if (node == NULL) return newNode(key,count);
    //else, find and insert new node.
    if ( cmp( &key, &(node->num), count, node->digit_length ) == 0 ) {//key < node->num
        node->left  = insert(node->left, key, count);
        (node->left)->parent = node;
      }
    else if ( cmp( &key, &(node->num), count, node->digit_length ) == 1 ) {//key > node->num
        node->right = insert(node->right, key, count);
        (node->right)->parent = node;
      }
    // return the node pointer
    return node;
}

//delete whole tree
void deleteTree(struct Tree* node)
{
    if (node == NULL) return;
    //delete children
    deleteTree(node->left);
    deleteTree(node->right);
    //then delete node
    free(node);
}

int search(struct Tree* node, struct Node_num* key, int count)
{
    if (node == NULL) {
      return 0;
    }
    else if(cmp( &key, &(node->num), count, node->digit_length ) == 2) { //root->key == key
      return 1;
    }
    else if ( (cmp( &key, &(node->num), count, node->digit_length ) == 1))// key > root->key
       return search(node->right, key, count);

    else if(cmp( &key, &(node->num), count, node->digit_length ) == 0) return search(node->left, key, count);// key < root->key

    //never reaches this point
    return 0;
}

void search_for_output(struct Tree* node, struct Node_num* key, int count)
{
    if (cmp( &key, &(node->num), count, node->digit_length ) == 2 )//root->key == key
       return;

    else if ( (cmp( &key, &(node->num), count, node->digit_length ) == 1)) { // key > root->key
       printf("1");
       return search_for_output(node->right, key, count);
     }
    else if(cmp( &key, &(node->num), count, node->digit_length ) == 0) { // key < root->key
      printf("0");
      return search_for_output(node->left, key, count);
    }

    //never reaches this point
    return;
}

void print_num(struct Node_num** head_ref) {
  struct Node_num* head = *head_ref;
  //now print
  while(head != NULL) {
    printf("%d",head->data);
    head = head->next;
  }
}

void print_pre_order(struct Tree *root)
{
    if (root != NULL)
    {
        print_num(&(root->num)); printf(" ");
        print_pre_order(root->left);
        print_pre_order(root->right);
    }
}

int main() {
  int character;
  int count_1=0;
  struct Node_num *head = NULL;
  struct Tree *root = NULL;

  while(( character = getchar()) != EOF ) {
    if( character == 'N' ) {
      root = NULL; //BST
      head = NULL;
      character = getchar();//remove space

      while( character = getchar() ) { //now store the set
        if( character == '\n' ) {
          sanitize(&head,&count_1);//remove leading zeroes
          if( root == NULL )
            root = insert(root, head, count_1); //assign root
          else {
            if( search( root, head, count_1 ) == 0 ) //duplicate does not exist
              insert(root, head, count_1);
            else { //duplicate exists
              delete_DLL(&head);//delete the input number
            }
          }
          //re-initialize
          head = NULL;
          count_1 = 0;
          break;
        }
        else if( character == ' ' ) {
          sanitize(&head,&count_1);//remove leading zeroes
          if( root == NULL )
            root = insert(root, head, count_1); //assign root
          else {
           if( search( root, head, count_1 ) == 0 ) //duplicate does not exist
              insert(root, head, count_1);
            else { //duplicate exists
              delete_DLL(&head);//delete the input number
            }
          }
          //re-initialize
          head = NULL;
          count_1 = 0;
        }
        else { //store number
          append(&head, character-48);
          count_1++;
        }

      }
    }
    else if( character == 'S' ) {
      character = getchar();//remove space
      while( (character = getchar()) != '\n' ) { //now store the set
        append(&head, character-48);
        count_1++;
      }
      sanitize(&head, &count_1);//remove leading zeroes
      if( search( root, head, count_1 ) == 0 )
        printf("-1\n");
      else {
        search_for_output(root, head, count_1);
        printf("\n");
      }
      //re-initialize
      delete_DLL(&head);
      head = NULL;
      count_1 = 0;
    }
    else if( character == 'P' ) {
      print_pre_order(root);
      printf("\n");
    }
  }

  //delete tree
  deleteTree(root);
  return( 0 );
}
