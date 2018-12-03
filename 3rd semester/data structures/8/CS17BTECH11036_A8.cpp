#include <iostream>

using namespace std;

struct TreeNode {
  int data;
  bool color;//false -> black , true -> red
  struct TreeNode *parent, *left, *right;
  TreeNode(int key) {
    this->data = key;
    this->parent = NULL;
    this->left = NULL;
    this->right = NULL;
  }
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

class RedBlackTree {
private:
  struct TreeNode* NILL;
  struct TreeNode* root;

  void swap_color(bool& a, bool& b) {
    bool temp;
    temp = a;
    a = b;
    b = temp;
    return;
  }

  void left_rotate(struct TreeNode* node) {
    //check if right child is Null, can just return
    if( node->right == NILL ) return;

    struct TreeNode* y = node->right;
    node->right = y->left;
    if( y->left != NILL ) (y->left)->parent = node;//if y->left node exists , update it's parent pointer

    y->parent = node->parent;
    if( node->parent == NILL ) root = y;//update root
    else if( (node->parent)->left == node ) (node->parent)->left = y;
    else (node->parent)->right = y;
    y->left = node;
    node->parent = y;

    return;
  }

  void right_rotate(struct TreeNode* node) {
    //check if left child is Null, can just return
    if( node->left == NILL ) return;

    struct TreeNode* y = node->left;
    node->left = y->right;
    if( y->right != NILL ) (y->right)->parent = node;//if y->left node exists , update it's parent pointer

    y->parent = node->parent;
    if( node->parent == NILL ) root = y;//update root
    else if( (node->parent)->left == node ) (node->parent)->left = y;
    else (node->parent)->right  = y;
    y->right = node;
    node->parent = y;

    return;
  }

  void insert_fixup(struct TreeNode* node) {
    struct TreeNode* p = NILL;
    struct TreeNode* grandP = NILL;
    while( (node != root) &&  (node->parent->color == true) ) {
      //node is not root so parent exists
      p = node->parent;
      grandP = p->parent;
      if( p == grandP->left ) {
        struct TreeNode* uncle = grandP->right;
        if( (uncle != NILL) && (uncle->color == true) ) { //case 1
          p->color = false;
          uncle->color = false;
          grandP->color = true;
          node = grandP;
        } else {
          if( node == p->right ) {
            node = p;
            left_rotate(node);
          }
          node->parent->color = false;
          grandP->color = true;//check this
          right_rotate(grandP);
        }
      } else {
          struct TreeNode* uncle = grandP->left;
          if( (uncle != NILL) && (uncle->color == true) ) { //case 1
            p->color = false;
            uncle->color = false;
            grandP->color = true;
            node = grandP;
          } else {
            if( node == p->left ) {
              node = p;
              right_rotate(node);
            }
            node->parent->color = false;
            grandP->color = true;//check this
            left_rotate(grandP);
          }
      }
    }
    root->color = false;
  }

  struct TreeNode* min_of_tree(struct TreeNode* node) {
    while( node->left != NILL ) {
      node = node->left;
    }
    return node;
  }

  void fixToken(struct TreeNode* node, struct TreeNode* sibling) {
    //if called on root
    if( node == root ) {
      node->color = false;
      return;
    }
    if( node->color == true ) {
      node->color = false;
      return;
    }
    //other cases
    if( sibling->color == true ) {
      //both children are black and parent is black
      sibling->color = false;
      sibling->parent->color = true;
      if( sibling->parent->right == sibling ) {
        sibling = sibling->left;
        left_rotate(sibling->parent->parent);
      }
      else {
        sibling = sibling->right;
        right_rotate(sibling->parent->parent);
      }
    }
    if( sibling->color == false ){ //sibling color is black
      if( sibling->left->color == false && sibling->right->color == false ) {
        //node has black token thats why we call this function
        sibling->color = true;
        if( sibling->parent == root ) {
          root->color = false;
          //we are done
          return;
        }
        //black token is with parent now
        if( sibling->parent == sibling->parent->parent->left )
          fixToken(sibling->parent, sibling->parent->parent->right);
        else fixToken(sibling->parent, sibling->parent->parent->left);
      } else { //last 2 cases
        if( sibling->parent->right == sibling ) {
          if( sibling->right->color == false && sibling->left->color == true ) {
            //swap colors of left child of sibling and sibling
            sibling->color = true;
            sibling->left->color = false;
            struct TreeNode* temp = sibling->left;
            right_rotate(sibling);
            sibling = temp;
          }
          //sibling->right->color == true
          sibling->right->color = false;
          sibling->color = sibling->parent->color;
          sibling->parent->color = false;
          left_rotate(sibling->parent);
          root->color = false;
          return;
        } else { //sibling->parent->left == sibling, the symmetric case
          if( sibling->left->color == false && sibling->right->color == true ) {
            sibling->color = true;
            sibling->right->color = false;
            struct TreeNode* temp = sibling->right;
            left_rotate(sibling);
            sibling = temp;
          }
          //sibling->left->color == true
          sibling->left->color = false;
          sibling->color = sibling->parent->color;
          sibling->parent->color = false;
          right_rotate(sibling->parent);
          root->color = false;
          return;
        }
      }
    }
    return;
  }

public:
  RedBlackTree() {
    //sentinal node
    NILL = new TreeNode(-1);
    NILL->color = false;
    root = NILL;
  }

  struct TreeNode* nill() {
    return NILL;
  };

  struct TreeNode* Tree_root() {
    return root;
  };

  void insert(int key) {
    struct TreeNode* node = new TreeNode(key);
    node->parent = NILL;
    node->left = NILL;
    node->right = NILL;
    node->color = true;

    //add the node to the tree
    struct TreeNode* temp = root;
    struct TreeNode* p;
    if( root == NILL ) {
      root = node;
      root->color = false;
      return;
    } else {
      while( temp != NILL ) {
        if( key < temp->data ) {
          p = temp;
          temp = temp->left;
        } else if( key > temp->data ) {
          p = temp;
          temp = temp->right;
        } else { //if equal, do not insert duplicate
          delete (node);
          return;
        }
      }
      //reached the correct position of new node
      if( key < p->data ) {//insert to left
        p->left = node;
        node->parent = p;
      } else {
        p->right = node;
        node->parent = p;
      }
    }
    //have successfully inserted the element
    insert_fixup(node);
  }

  struct TreeNode* successor(int key, struct TreeNode* node, struct TreeNode*& succ) {
    if( node == NILL ) return NILL;
    if( node->data == key ) {
      if( node->right != NILL ) { //right subtree exists
        succ = min_of_tree(node->right);
      }
    }
    else if( node->data < key) {
      successor(key, node->right, succ);
    }
    else { //node->data > key
        succ = node;//succ must be this value if node->left tree doesn't have the successor.
        successor(key, node->left, succ);
      }

    return NILL;
  }

  void delete_element(int key, struct TreeNode* node) {
    bool number_exists = false;
    //store path and print if number exists else output 1
    while( node != NILL ) {
      if( node->data == key ) {
        number_exists = true;
        break;
      }
      else if( node->data < key ) {
        node = node->right;
      }
      else if( node->data > key ) {
        node = node->left;
      }
    }
    if( number_exists == false ) return;
    //element is present in the tree.
    if( node->left == NILL || node->right == NILL ) { //easy delete
      if( node->left == NILL ) {
        if( node->right == NILL ) { //no children, just delete it, check if its the root
          if( node == root ) { //update root
            delete (node);
            root = NILL;
            return;
          } //else a node with two NULL nodes
          //point its parent to NILL
          struct TreeNode* sibling;
          if( node->parent->left == node ) {
            sibling = node->parent->right;
            node->parent->left = NILL;
          }
          else {
            sibling = node->parent->left;
            node->parent->right = NILL;
          }
          //if node is black then token remains
          if( node->color == false )
            fixToken(NILL, sibling);
          delete (node);
          return;
        }
        //has only right child
        if( node->parent == NILL ) {//have to update root then.
          root = node->right;
          root->color = false;
          delete (node);
        }
        else if( node->color == true ) { //replace with child
          if( node->parent->left == node )
            node->parent->left = node->right;
          else node->parent->right = node->right;
          node->right->parent = node->parent;
          delete (node);
          return;
        } else { //node is black
          if( node->right->color == true ) { //child has red color
            if( node->parent->left == node ) node->parent->left = node->right;
            else node->parent->right = node->right;
            node->right->parent = node->parent;
            //recolor child to black
            node->right->color = false;
            delete (node);
            return;
          } else { //node is black and its child is black
            struct TreeNode* sibling;
            if( node->parent->left == node ) {
              node->parent->left = node->right;
              node->right->parent = node->parent;
              sibling = node->parent->right;
            }
            else {
              node->parent->right = node->right;
              node->right->parent = node->parent;
              sibling = node->parent->left;
            }
            struct TreeNode* temp = node->right;
            delete (node);
            node = temp;
            //4 case
            fixToken(node, sibling);
          }
        }
      } else { //has left child
        if( node->parent == NILL ) { //have to update root
          root = node->left;
          root->color = false;
          delete (node);
        }
        else if( node->color == true ) {//replace with child
          if( node->parent->left == node )
            node->parent->left = node->left;
          else node->parent->right = node->left;
          node->left->parent = node->parent;
          delete (node);
          return;
        } else { //node is black
          if( node->left->color == true ) { //child has red color
            if( node->parent->left == node ) node->parent->left = node->left;
            else node->parent->right = node->left;
            node->left->parent = node->parent;
            //recolor child to black
            node->left->color = false;
            delete (node);
            return;
          } else { //node is black and its child is black
            struct TreeNode* sibling;
            if( node->parent->left == node ) {
              node->parent->left = node->left;
              node->left->parent = node->parent;
              sibling = node->parent->right;
            }
            else {
              node->parent->right = node->left;
              node->left->parent = node->parent;
              sibling = node->parent->left;
            }
            struct TreeNode* temp = node->left;
            delete (node);
            node = temp;
            //4 case
            fixToken(node, sibling);
          }
        }
      }
    } else { //two children
      struct TreeNode* succ = min_of_tree(node->right);
      node->data = succ->data; // replace value, now to delete the duplicate.
      delete_element(succ->data, node->right);
    }
    return;
  }

  void search_path(int key) {
    string path;
    bool number_exists = false;
    struct TreeNode* node = root;
    //store path and print if number exists else output 1
    while( node != NULL ) {
      if( node->data == key ) {
        number_exists = true;
        break;
      }
      else if( node->data < key ) {
        path += '1';
        node = node->right;
      }
      else if( node->data > key ) {
        path += '0';
        node = node->left;
      }
    }

    if( number_exists == true ) {
      cout<<path<<' ';
      if( node->color ) cout<<'R';
      else cout<<'B';
      cout<<'\n';
    }
    else { //number doesn't exist in set
      cout<<"-1"<<'\n';
    }

    return;
  }

  void print_children(int key) {
    bool number_exists = false;
    struct TreeNode* node = root;
    //store path and print if number exists else output 1
    while( node != NULL ) {
      if( node->data == key ) {
        number_exists = true;
        break;
      }
      else if( node->data < key ) {
        node = node->right;
      }
      else if( node->data > key ) {
        node = node->left;
      }
    }

    if( number_exists == true ) {
      if( node->left != NILL ) {
        cout<<(node->left)->data<<' ';
        if( node->color ) cout<<"R ";
        else cout<<"B ";
      } else cout<<"L B ";
      if( node->right != NILL ) {
        cout<<(node->right)->data<<' ';
        if( node->color ) cout<<"R ";
        else cout<<"B ";
      } else cout<<"L B";
    } else { //number doesn't exist in set
      cout<<"-1";
    }
    cout<<'\n';
    return;
  }

  void pre_order(struct TreeNode* node) {
    if( node != NILL ) {
      cout<<node->data<<" ";
      pre_order(node->left);
      pre_order(node->right);
    }

    return;
  }

  void destroy(struct TreeNode* node) {
    if( node == NILL ) return;
    //delete children
    destroy(node->left);
    destroy(node->right);
    //then delete node
    delete (node);
    root = NILL;
  }

  void delete_nill() {
    delete NILL;
    return;
  }
};

void create_set(RedBlackTree& set) {
  int number = 0;
  int input_Character;

  while(( input_Character = getchar() )  != '\n' ) {
    if( input_Character == ' ' ) {
      set.insert(number);
      //re-initialize
      number = 0;
    }
    else {
      input_Character -= 48;
      number = (number * 10) + input_Character;
    }
  }
  //number before '\n'
  set.insert(number);

  return;
}

void handle_add_element(RedBlackTree& set) {
  int number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  set.insert(number);
}

void handle_find_successor(RedBlackTree& set) {
  int number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  struct TreeNode* succ = set.nill();
  set.successor(number, set.Tree_root(), succ);
  if( succ != set.nill() ) {
    cout<<succ->data<<'\n';
  } else cout<<"-1"<<'\n';

  return;
}

void handle_delete_element(RedBlackTree& set) {
  int number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  set.delete_element(number, set.Tree_root());
}

void handle_search_element(RedBlackTree& set) {
  int number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  set.search_path(number);
}

void handle_print_children(RedBlackTree& set) {
  int number = 0;
  int input_Character;
  while(( input_Character = getchar() )  != '\n' ) {
    input_Character -= 48;
    number = (number * 10) + input_Character;
  }
  set.print_children(number);
}

int main() {
  int input_Character, size;
  RedBlackTree set;
  while(( input_Character = getchar() ) != EOF ) {
    if( input_Character == 'N' ) { //new set
      input_Character = getchar();
      //delete prev tree and re-initialize the rbtree
      set.destroy(set.Tree_root());
      create_set(set);
    } else if( input_Character == '+' ) { // add element to set
      input_Character = getchar();
      handle_add_element(set);
    } else if ( input_Character == '>' ) { // find successor
      input_Character = getchar();
      handle_find_successor(set);
    } else if ( input_Character == '-' ) { // delete element
      input_Character = getchar();
      handle_delete_element(set);
    } else if ( input_Character == 'S' ) { // search element
      input_Character = getchar();
      handle_search_element(set);
    } else if ( input_Character == 'C' ) { // print children of the element
      input_Character = getchar();
      handle_print_children(set);
    } else if ( input_Character == 'P' ) { // pre-order traversal
      set.pre_order(set.Tree_root());
      cout<<'\n';
    }
  }


  set.destroy(set.Tree_root());
  set.delete_nill();
  return 0;
}
