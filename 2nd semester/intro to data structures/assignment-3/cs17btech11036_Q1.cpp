#include <iostream>
#include <string>
#include <cstdlib>
#include <cstring>

using namespace std;

struct node
{
	char name[100];
	char code[100];
	char duplicate_code[1000];
	struct node* next;
};

void lower_string(char * s)
{
	for (unsigned int i = 0; i < strlen(s); i++)
	{
		if(s[i] >= 65 && s[i] <= 90)
		{
			s[i]+=32;
		}
	} //lowering the string

	return;
}

void append(struct node** head_ref,char name1[],char code1[])
{
	struct node* new_node = (struct node*)malloc(sizeof(struct node));

	strcpy(new_node->name ,name1);
	strcpy(new_node->code,code1);

	lower_string(code1);
	strcpy(new_node->duplicate_code,code1);

	new_node->next = NULL;

	if( (*head_ref) == NULL)
	{
		*head_ref = new_node;
		return;
	}

	struct node* temp = *head_ref;
	while( (temp->next) != NULL)
	{
		temp = temp->next;
	}

	temp->next = new_node;

	return;
}

void printList(struct node *start)
{
	cout<<"Printing in the order -  Position of the node in the list; Address of the node ; subject ; code ; The pointer stored in the node\n";

	int index=0;
  while (start != NULL)
  {
  	index++;
    printf("subject_%d -> %d ; %p ; %s ; %s ; %p\n", index,index,start,start->name,start->code,start->next);
    start = start->next;
  }
}

int compare_strings(char a[], char b[])
{
   int c = 0;
 
   while (a[c] == b[c]) {
      if (a[c] == '\0' || b[c] == '\0')
         break;
      c++;
   }
 
   if (a[c] == '\0' && b[c] == '\0')
      return 0;
   else
      return -1;
}

void swap(struct node** head_ref,char s1[],char s2[])
{
	if( compare_strings(s1,s2) == 0)
		return; //nothing to do

	struct node* temp = *head_ref;

	if(temp == NULL || temp->next == NULL)
	{
		cout<<"Swap not possible";
		exit(EXIT_SUCCESS);
	}

	struct node *prevX = NULL, *currX = *head_ref;

	while(currX && ( compare_strings(currX->duplicate_code,s1) != 0))
	{
		prevX = currX;
        currX = currX->next;
	}

	struct node *prevY = NULL, *currY = *head_ref;
	while (currY && ( compare_strings(currY->duplicate_code,s2) != 0))
   {
       prevY = currY;
       currY = currY->next;
   }

   // If either s1 or s2 is not present, nothing to do
   if (currX == NULL || currY == NULL)
       return;

   // If s1 is not head of linked list
   if (prevX != NULL)
       prevX->next = currY;
   else // Else make s2 as new head
       *head_ref = currY;  
 
   // If s2 is not head of linked list
   if (prevY != NULL)
       prevY->next = currX;
   else  // Else make s1 as new head
       *head_ref = currX;
 
   // Swap next pointers
   temp = currY->next;
   currY->next = currX->next;
   currX->next  = temp;

   return;
}

void deleteLL_code(struct node** head_ref,char s1[])
{
	struct node* temp = *head_ref,*prev;

		if (temp != NULL && (compare_strings(temp->duplicate_code,s1) == 0 ))
    {
        *head_ref = temp->next;
        free(temp);
        return;
    }

	while(temp != NULL && ( compare_strings(temp->duplicate_code,s1) != 0 ) )
	{
		prev = temp;
		temp = temp->next;
	}

	//if the subject not present
	if( temp == NULL )
		return;

	//if present
	//head node is different case


	//else
	prev->next = temp->next;

	free(temp);
	return;

}

int main()
{
	int n;
	char s1[100],s2[100];

	struct node* head = NULL;

	while(1)
	{
		cout<<"\n\nPress 0 to exit ; Press 1 to enter new values ; Press 2 to display List ; Press 3 to swap structures ; Press 4 to delete node : ";
		cin>>n;
		cin.ignore(256,'\n');

		if(n == 0)
		{
			cout<<"Bye :)"<<'\n';
			exit(EXIT_SUCCESS);
		}

		else if(n == 1)
		{
			cout<<"Enter the name of the subject :";
			cin>>s1;
			cout<<"Enter the course code of the subject :";
			cin>>s2;

			append(&head,s1,s2);

		}

		else if(n == 2)
		{
			printList(head);
		}

		else if(n == 3)
		{
			cout<<"Note that if either of the course code is not present nothing is done"<<'\n';
			cout<<"Enter the first Course code : ";
			cin>>s1;
			lower_string(s1);

			cout<<"Enter the second Course code : ";
			cin>>s2;
			lower_string(s2);

			swap(&head,s1,s2);

			cout<<"Successfully Swapped ; Press '2' later to check the list\n"<<'\n';
		}

		else if(n == 4)
		{
			cout<<"Enter the course code of the subject you want to delete from the list :"<<'\n';
			cin>>s1;
			lower_string(s1);

			deleteLL_code(&head,s1);
			cout<<"Subjct succesfully deleted. (note: nothing is done if subject doesn't exist in list) "<<'\n';
		}
	}


}


/** Test Case

1
abc
cs1
1
abcd
cs2
1
abcde
cs3
1
plminh
cs4

**/
