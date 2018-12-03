//get number, find node containing the number.leftt rotate at that node. if number doesn't exist print -1
void left_rotate(struct Tree*& set, lli number) {

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

void right_rotate(struct Tree*& set, lli number) {

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
