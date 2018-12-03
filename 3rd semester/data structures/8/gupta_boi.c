#include<stdio.h>
#include<stdlib.h>
#include<string.h>


struct node{
    int val;
    struct node *left;
    struct node *right;
    struct node *parent;
}*root,*stemp;

void freeBST(struct node **ptr)
{ //uaing post-order: left->right->parent

    if((*ptr)!=NULL)
    {
        //printf("%d",(*ptr)->val);
        if((*ptr)->left!=NULL)
            freeBST(&((*ptr)->left));
        if((*ptr)->right!=NULL)
            freeBST(&((*ptr)->right));
        printf("%d",(*ptr)->val);
        free(*ptr);
        printf("b");
    }
}

void addNode(struct node **start,struct node *par,int a)
{
    struct node *ptr=(struct node*) malloc(sizeof(struct node));
    if(root==NULL)
    {
        root=ptr;
        ptr->val=a;
        ptr->parent=NULL;
        ptr->right=NULL;
        ptr->left=NULL;
    }
    else{
            if((*start)==NULL)
            {
                *start=ptr;
                ptr->val=a;
                ptr->parent=par;
                ptr->right=NULL;
                ptr->left=NULL;
            }
            else if(a>((*start)->val)) //n<((*start)->num)
                addNode(&((*start)->right),*start,a);
            else if(a<((*start)->val))
                addNode(&((*start)->left),*start,a);
            else
                ;
    }
}

void displayBST(struct node *start)
{
    //root-left-right
    printf("%d ",start->val);
    struct node *temp1=start->left, *temp2=start->right;
    if(temp1!=NULL)
        displayBST(temp1);
    if(temp2!=NULL)
        displayBST(temp2);
}


void searchBST(struct node *temp, char *res,int a) //searching using binary search algorithm basically
{
    while(temp!=NULL)
    {
        stemp=temp; //used for various functions
        if(a>temp->val)
        {
            strcat(res,"1");
            temp=temp->right;
        }
        else if(a<temp->val)
        {
            strcat(res,"0");
            temp=temp->left;
        }
        else //if found
            return ;
    }
    strcpy(res,"-1");
    return ;
}

struct node* searchSucc(int a)//returns pointer to successor
{
    char res[]="";
    searchBST(root,res,a);//assign value to stemp
    struct node *temp=stemp;

        if((*res)=='-')//if not present in BST
        {
            while(temp!=NULL)
            {
                if(temp->val>a)
                    return temp;
                temp=temp->parent;
            }
            return NULL;
        }
        else//present in BST
        {
            if((temp->right)!= NULL)//checking right sub-tree
            {
                temp=temp->right;
                do
                {
                    if(temp->left==NULL)
                        break;
                    temp=temp->left;
                }while(temp!=NULL);
                return temp;
            }
            else//checking parents
            {
               while(temp!=NULL)
                {
                if(temp->val>a)
                    return temp;
                temp=temp->parent;
                }
                return NULL;
            }
        }
}

void findUncle(int a)
{
    char res[]="";
    searchBST(root,res,a);
    if((*res)=='-' || stemp==root || stemp->parent==root)//not found in BST OR no UNCLE
        printf("-1\n");
    else
    {
        if(stemp->parent->parent!=NULL)
        {
            if(stemp->parent==stemp->parent->parent->right && stemp->parent->parent->left!=NULL)
                printf("%d",stemp->parent->parent->left->val);
            else if(stemp->parent==stemp->parent->parent->left && stemp->parent->parent->right!=NULL)
                printf("%d",stemp->parent->parent->right->val);
            else
                printf("-1");
            printf("\n");
        }
        else
            printf("-1\n");
    }
}

void findChildren(int a)
{
    char res[]="";
    searchBST(root,res,a);
    if((*res)=='-')//not found in BST
        printf("-1\n");
    else
    {
        if(stemp->left!=NULL)
            printf("%d ",stemp->left->val);
        else
            printf("Nil ");

        if(stemp->right!=NULL)
            printf("%d ",stemp->right->val);
        else
            printf("Nil");
        printf("\n");
    }
}

void leftRotate(int a)
{
    char res[]="";
    searchBST(root,res,a);
    if((*res)=='-')//not found in BST
        ;
    else
    {
        if(stemp->right!=NULL)
        {
            if(stemp!=root)
            {
                if((stemp->parent->left)==stemp)
                    stemp->parent->left=stemp->right;
                else
                    stemp->parent->right=stemp->right;
            }
            else
                root=stemp->right;

            stemp->right->parent=stemp->parent;
            stemp->parent=stemp->right;
            stemp->right=stemp->right->left;
            if(stemp->right!=NULL)
                stemp->right->parent=stemp;
            stemp->parent->left=stemp;
        }
    }

}

void rightRotate(int a)
{
    char res[]="";
    searchBST(root,res,a);
    if((*res)=='-')//not found in BST
        ;
    else
    {
        if(stemp->left!=NULL)
        {
            if(stemp!=root)
            {
                if((stemp->parent->left)==stemp)
                    stemp->parent->left=stemp->left;
                else
                    stemp->parent->right=stemp->left;
            }
            else
                root=stemp->left;
            stemp->left->parent=stemp->parent;
            stemp->parent=stemp->left;
            stemp->left=stemp->left->right;
            if(stemp->left!=NULL)
                stemp->left->parent=stemp;
            stemp->parent->right=stemp;
        }
    }

}

void deleteNode(int a)//to delete a node using 3 primary cases
{
    char res[]="";
    searchBST(root,res,a);//assign value to stemp
    struct node* succ;
    if((*res)=='-')//not found in BST
        ;//do nothing
    else//if found in BST
    {
        if(stemp->right==NULL && stemp->left==NULL)//CASE 1: no children
        {
            if(stemp==root)
                root=NULL;
            else
            {
                if(stemp==(stemp->parent)->right)
                    (stemp->parent)->right=NULL;
                else
                    (stemp->parent)->left=NULL;
            }
            free(stemp);
        }//end of CASE 1
        else if(stemp->right!=NULL && stemp->left!=NULL)//CASE 2: two children
        {
            succ=searchSucc(a);
            //if node has right child IT WILL have a SUCC
            if(succ->parent!=stemp)//case when deletenode and succnode are adjacent
                succ->parent->left=succ->right;

            if(stemp==root)
            {
                root=succ;
                succ->parent=NULL;
            }
            else if(stemp==(stemp->parent)->right)
            {
                stemp->parent->right=succ;
                succ->parent=stemp->parent;
            }
            else
            {
                stemp->parent->left=succ;
                succ->parent=stemp->parent;
            }

            stemp->left->parent=succ;
            succ->left=stemp->left;

            if(stemp->right!=succ)
            {
                stemp->right->parent=succ;
                succ->right=stemp->right;
            }
            free(stemp);
        }//end of CASE 2
        else //CASE 3: only one child
        {
            if(stemp->right!=NULL)
            {
                if(stemp==root)
                {
                    (stemp->right)->parent=NULL;
                    root=stemp->right;
                }
                else
                {
                    (stemp->right)->parent=stemp->parent;
                    if(stemp->parent->left==stemp)
                        (stemp->parent)->left=stemp->right;
                    else
                        (stemp->parent)->right=stemp->right;
                }
                //parent->child=stemp->right
            }
            else
            {
                if(stemp==root)
                {
                    (stemp->left)->parent=NULL;
                    root=stemp->left;
                }
                else
                {
                    (stemp->left)->parent=stemp->parent;
                    if(stemp->parent->left==stemp)
                        stemp->parent->left=stemp->left;
                    else
                        stemp->parent->right=stemp->left;
                }
                //parent->child=stemp->left
            }
            free(stemp);
        }//end of CASE 3:
    }//end of else
}

int main()
{
    root=NULL,stemp=NULL;
    int digit,a;
    char choice;
    while((digit=fgetc(stdin))!=EOF)
    {
        if(digit=='N'||digit=='S'||digit=='P'||digit=='C'||digit=='-'||digit=='+'||digit=='>'||digit=='R'||digit=='L')
        {
            choice=digit;
            if(choice=='N')
            {
                if(root!=NULL)
                    freeBST(&root);
            }
            else if(choice=='S')
            {
                scanf("%d",&a);
                char res[]="";
                searchBST(root,res,a);
                printf("%s\n",res);
            }
            else if(choice=='C')
            {
                scanf("%d",&a);
                findChildren(a);
            }
            else if(choice=='P')
            {
                if(root!=NULL)
                    displayBST(root);
               printf("\n");
            }
            else if(choice=='R')
            {
                scanf("%d",&a);
                rightRotate(a);
            }
            else if(choice=='L')
            {
                scanf("%d",&a);
                leftRotate(a);
            }
            else if(choice=='-')
            {
                scanf("%d",&a);
                deleteNode(a);
            }
            else if(choice=='+')
            {
                scanf("%d %d",&a);
                addNode(&root,root,a);
            }
            else//rank-'>'
            {
                scanf("%d",&a);
                struct node* ptr=searchSucc(a);
                if(ptr!=NULL)
                    printf("%d\n",ptr->val);
                else
                    printf("-1\n");
            }
        }//end of if
        else if(digit==' ')//to add nodes to tree
        {
            int v;
            scanf("%d",&v);
            addNode(&root,root,v);
        }
        else
            ;
    }//end of while
    freeBST(&root);
    printf("a");
    return 0;
}
