#include <iostream>
#include <string>

using namespace std;

typedef long long int lli;

//tree structure starts here
struct Tree {
  lli data;
  struct Tree *left, *right, *parent;
};

//create a node in BST
struct Tree *newNode(lli key) {
  struct Tree *temp = (struct Tree *)malloc(sizeof(struct Tree));
  temp->data = key;
  temp->left = NULL;
  temp->right = NULL;
  temp->parent = NULL;
  return temp;
}

//find position to insert node with value in BST
struct Tree* insert(struct Tree*& node, lli key) {
  // If the tree is empty, return a new node
  if( node == NULL ) return newNode(key);
  //else, find and insert new node.
  if( key < node->data ) {
      node->left  = insert(node->left, key);
      (node->left)->parent = node;
    }
  else if( key > node->data ) {
      node->right = insert(node->right, key);
      (node->right)->parent = node;
    }
  //if duplicate exists, key == node->data we just return...
  // return the node pointer
  return node;
}

//delete whole tree
void deleteTree(struct Tree*& node) {
    if( node == NULL ) return;
    //delete children
    deleteTree(node->left);
    deleteTree(node->right);
    //then delete node
    free(node);
}

//will create the new set of elements by processing input
void create_set(struct Tree*& set) {
  lli number = 0;
  int input_Character;

  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      if( set == NULL ) set = insert(set, number);
      else insert(set, number);
      //re-initialize
      number = 0;
    }
    else {
      input_Character -= 48;
      number = (number * 10) + input_Character;
    }
  }
  //number before '\n'
  if( set == NULL ) set = insert(set,number);
  else insert(set, number);

  return;
}

//process input, adds given element to set.
void add_element(struct Tree*& set) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  //now insert the number in the BST
  if( set == NULL ) set = insert(set, number);
  else insert(set, number);
}

//finds the minimum node and returns the address of node's value in Tree
lli* min_of_tree(struct Tree* node) {
  struct Tree* temp = node;
  while( temp->left != NULL ) {
    temp = temp->left;
  }
  //found the node with min value
  return &(temp->data);
}

//finds the successor of tree by the key, if key doesn't exist do nothing
void find_successor(struct Tree* node, lli key, lli*& succ ) {
  if( node == NULL ) return;
  if( node->data == key ) {
    if( node->right != NULL ) {//right subtree exists
      succ = min_of_tree(node->right);
    }
  }
  else if( node->data < key) {
    find_successor(node->right, key, succ);
  }
  else { //node->data > key
      succ = &(node->data);//succ must be this value if node->left tree doesn't have the successor.
      find_successor(node->left, key, succ);
    }

  return;
}

//process input number, get the successor and prints the value , if cannot find returns "-1"
void get_successor(struct Tree*& set) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  //now find successor of number in the set
  lli *succ = NULL; // contains pointer to successor node's data
  find_successor(set, number, succ);
  if( succ == NULL ) cout<<"-1"<<'\n';
  else cout<<*succ<<'\n';

  return;
}

//delete the number from set, if element doesn't exist do nothing
void delete_node(struct Tree*& set, lli key) {
  struct Tree* node = set;
  while( node != NULL && node->data != key ) { //do nothing, element doesn't exist in the set
  if( node->data < key ) node = node->right;
  else if( node->data > key ) node = node->left;
  }
  if( node == NULL ) return;//if no such node exists
  //found the node containing element
  if( node->left == NULL ) {
    if( node->right == NULL ) { //no children
    //if node is root
      if( node->parent == NULL ) {
        //just free the node
        free(node);
        set = NULL;//update root
        return;
      }
      //point its parent to NULL
      else if( (node->parent)->left == node ) {
        (node->parent)->left = NULL;
      }
      else if( (node->parent)->right == node ) {
        (node->parent)->right = NULL;
      }
        free(node);
        node = NULL;
    }
    else { //1 child (right)
      if( node->parent == NULL ) {
        struct Tree* temp = node->right;
        free(node);
        node = temp;
        node->parent = NULL;
        set = node;//update root
      }
      else if( (node->parent)->left == node ) {
        (node->parent)->left = node->right;
        (node->right)->parent = node->parent;//update parent pointer of right child
        free(node);
      }
      else if( (node->parent)->right == node ) {
        (node->parent)->right = node->right;
        (node->right)->parent = node->parent;//update parent pointer of right child
        free(node);
      }
    }
    return;
  }
  else if( node->right == NULL ) {
    //1 child (left)
    if( node->parent == NULL ) {
      struct Tree* temp = node->left;
      free(node);
      node = temp;
      node->parent = NULL;
      set = node;//update root
    }
    else if( (node->parent)->left == node ) {
      (node->parent)->left = (node->left);
      (node->left)->parent = node->parent;
      free(node);
    }
    else if( (node->parent)->right == node ) {
      (node->parent)->right = (node->left);
      (node->left)->parent = node->parent;
      free(node);
    }
    return;
  }
  //2 children
  lli succ_right = *(min_of_tree(node->right));
  node->data = succ_right; // replace value, now to delete the duplicate.
  delete_node(node->right, succ_right);

  return;
}

//call fn to delete the given element from the set, process number
void delete_element(struct Tree*& set) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  delete_node(set, number);

  return;
}

//get the number and search for it in the set, then output path bitstring. If not present ouput "-1"
void search(struct Tree* set) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }

  string path;
  bool number_exists = false;
  //store path and print if number exists else output 1
  while( set != NULL ) {
    if( set->data == number ) {
      number_exists = true;
      break;
    }
    else if( set->data < number ) {
      path += '1';
      set = set->right;
    }
    else if( set->data > number ) {
      path += '0';
      set = set->left;
    }
  }

  if( number_exists == true ) {
    cout<<path<<'\n';
  }
  else { //number doesn't exist in set
    cout<<"-1"<<'\n';
  }

  return;
}

//preorder traversal, print nothing if empty set
void print_pre_order(struct Tree*& node, bool flag) {
  if( node != NULL ) {
    if( flag ) cout<<" ";
    cout<<node->data; flag = true;
    print_pre_order(node->left, flag);
    print_pre_order(node->right, flag);
  }

  return;
}

//get the number from buffer, find node containing the number and print its children, if number isn't in BST print -1
void print_children(struct Tree* node) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }

  bool number_exists = false;
  //find node
  while( node != NULL ) {
    if( node->data == number ) {
      number_exists = true;
      break;
    }
    else if( node->data < number ) {
      node = node->right;
    }
    else if( node->data > number ) {
      node = node->left;
    }
  }
  if( number_exists ) {
    if( node->left ) {
      cout<<(node->left)->data<<" ";
    } else cout<<"Nil ";
    if( node->right ) {
      cout<<(node->right)->data;
    } else cout<<"Nil";
  } else {
    cout<<"-1";
  }
  cout<<'\n';

  return;
}

//get the number from buffer, find node containing the number and print its uncle, if number isn't in BST print -1
void print_uncle(struct Tree* node) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  bool number_exists = false;
  //find node
  while( node != NULL ) {
    if( node->data == number ) {
      number_exists = true;
      break;
    }
    else if( node->data < number ) {
      node = node->right;
    }
    else if( node->data > number ) {
      node = node->left;
    }
  }
  if( number_exists ) {
    struct Tree* p = node->parent;
    if( p && p->parent ) { //check if parent's parent node exists
      //now check if uncle node exists
      if( (p->parent)->left == p ) { //uncle is on the right
        if( (p->parent)->right ) cout<<((p->parent)->right)->data<<'\n';//if it exists
        else cout<<"-1"<<'\n';
      } else { //uncle is on the left
        if( (p->parent)->left ) cout<<((p->parent)->left)->data<<'\n';//if it exists
        else cout<<"-1"<<'\n';
      }
    } else cout<<"-1"<<'\n';
  }

  return;
}

//get number, find node containing the number.leftt rotate at that node. if number doesn't exist print -1
void left_rotate(struct Tree*& set) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  bool number_exists = false;
  //find node
  struct Tree* node = set;
  while( node != NULL ) {
    if( node->data == number ) {
      number_exists = true;
      break;
    }
    else if( node->data < number ) {
      node = node->right;
    }
    else if( node->data > number ) {
      node = node->left;
    }
  }
  //now at that node
  if( number_exists ) { //now left rotate at that node
    //check if right child is Null, can just return
    if( node->right == NULL ) return;

    struct Tree* y = node->right;
    node->right = y->left;
    if( y->left ) (y->left)->parent = node;//if y->left node exists , update it's parent pointer

    y->parent = node->parent;
    if( node->parent == NULL ) set = y;//update root
    else if( (node->parent)->left == node ) (node->parent)->left = y;
    else (node->parent)->right = y;
    y->left = node;
    node->parent = y;
  } else return;//do nothing

  return;
}

void right_rotate(struct Tree*& set) {
  lli number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  bool number_exists = false;
  //find node
  struct Tree* node = set;
  while( node != NULL ) {
    if( node->data == number ) {
      number_exists = true;
      break;
    }
    else if( node->data < number ) {
      node = node->right;
    }
    else if( node->data > number ) {
      node = node->left;
    }
  }
  if( number_exists ) {
    //check if left child is Null, can just return
    if( node->left == NULL ) return;

    struct Tree* y = node->left;
    node->left = y->right;
    if( y->right ) (y->right)->parent = node;//if y->left node exists , update it's parent pointer

    y->parent = node->parent;
    if( node->parent == NULL ) set = y;//update root
    else if( (node->parent)->left == node ) (node->parent)->left = y;
    else (node->parent)->right  = y;
    y->right = node;
    node->parent = y;
  } else return;//do nothing

  return;
}

int main() {
  int input_Character;
  bool flag = false; //handles spacing btw output
  struct Tree *root = NULL;
  while(( input_Character = getchar() ) != EOF ) {
    if( input_Character == 'N' ) { //new set
      deleteTree(root);
      root = NULL;
      input_Character = getchar();
      create_set(root);
    } else if( input_Character == '+' ) { // add element
      input_Character = getchar();
      add_element(root);
    } else if ( input_Character == '>' ) { //find successor
      input_Character = getchar();
      get_successor(root);
    } else if ( input_Character == '-' ) { //delete element
      input_Character = getchar();
      delete_element(root);
    } else if ( input_Character == 'S' ) { // search the set for the element
      input_Character = getchar();
      search(root);
    } else if ( input_Character == 'P' ) { // Pre-order transversal
      input_Character = getchar(); //'\n'
      print_pre_order(root, flag);
      flag = false;//re-initialize
      cout<<'\n';
    } else if ( input_Character == 'B' ) { //Build BST from pre-order traversal
      deleteTree(root);
      root = NULL;
      input_Character = getchar();
      create_set(root);
    } else if ( input_Character == 'C' ) { //print children
      input_Character = getchar();
      print_children(root);
    } else if ( input_Character == 'U' ) { //print uncle
      input_Character = getchar();
      print_uncle(root);
    } else if ( input_Character == 'L' ) { //left-rotate
      input_Character = getchar();
      left_rotate(root);
    } else if ( input_Character == 'R' ) { //right-rotate
      input_Character = getchar();
      right_rotate(root);
    }
  }

  deleteTree(root);
  return 0;
}
