#include <iostream>

using namespace std;

struct node{
	int num;
	struct node* next;
};

void append(struct node** head_ref,int new_num)
{
	struct node* new_node = (struct node*)malloc(sizeof(struct node));
	struct node* last_node = *head_ref;

	new_node->num = new_num;
	new_node->next = NULL;

	if(last_node == NULL)
	{
		*head_ref = new_node;
		return;
	}

	while(last_node->next != NULL)
	{
		last_node = last_node->next;
	}

	last_node->next = new_node;
	return;
}

void intersection(struct node* head_ref_1,struct node* head_ref_2,struct node** head_ref_3)
{
	cout<<"intersection of Linked list 1 and list list 2 is:"<<'\n';
	cout<<'\t';
	if(head_ref_1 == NULL || head_ref_2 == NULL)
	{
		cout<<"intersection is empty"<<'\n';
	}

	else
	{
		int duplicate=-30070;
		while(head_ref_1 != NULL && head_ref_2 != NULL)
		{
			if(head_ref_1->num == head_ref_2->num)
			{
				if(duplicate == head_ref_1->num)
				{
					head_ref_1 = head_ref_1->next;
					continue;
				}

				else if(duplicate == head_ref_2->num)
				{
					head_ref_2 = head_ref_2->next;
					continue;
				}

				duplicate = head_ref_1->num;
				append(head_ref_3, head_ref_1->num);
				head_ref_1 = head_ref_1->next;
				head_ref_2 = head_ref_2->next;
			}

			else if(head_ref_1->num > head_ref_2->num )
				head_ref_2 = head_ref_2->next;

			else if(head_ref_1->num < head_ref_2->num)
				head_ref_1 = head_ref_1->next;
		}
	}
	cout<<"Intersection operation succesfully done, press 4 to display";
	cout<<"\n\n";
	return;
}

void deleteLL(struct node** head_ref)
{
	if(*head_ref == NULL)
		return;

	struct node* current = *head_ref;
	struct node* next;

	while(current!=NULL)
	{
		next = current->next;
		free(current);
		current = next;
	}

	*head_ref = NULL;

	return;
}

void deleteLL_pos(struct node** head_ref,int position)
{
	if (*head_ref == NULL)
      return;
 
   struct node* temp = *head_ref;
 
    if (position == 0)
    {
        *head_ref = temp->next;
        free(temp);
        return;
    }
 
    for (int i=0; temp!=NULL && i<position-1; i++)
         temp = temp->next;
 
 	if (temp == NULL || temp->next == NULL)
         return;
 
    struct node *next = temp->next->next;
 	free(temp->next);
 
    temp->next = next;

    cout<<"done... \n\n";
    return;
}

void deleteLL_value(struct node** head_ref,int value)
{
	struct node* temp = *head_ref, *prev;
 
    if (temp != NULL && temp->num == value)
    {
        *head_ref = temp->next;
        free(temp);
        return;
    }
 
    while (temp != NULL && temp->num != value)
    {
        prev = temp;
        temp = temp->next;
    }
 
    if (temp == NULL) return;
 
    prev->next = temp->next;
 
    free(temp);
    cout<<"done... \n\n";
    return;
}

void printList(struct node* head_ref_1,struct node* head_ref_2,struct node* head_ref_3)
{
	cout<<"Printing the elements in Linked List 1 :"<<'\n';
	cout<<"\t";
	if(head_ref_1 == NULL)
	{
		cout<<"There are no elements in this list."<<"\n\n";
	}

	while (head_ref_1 != NULL)
 	{
    	cout<<' '<<head_ref_1->num<<" ";
     	head_ref_1 = head_ref_1->next;
	}
	cout<<"\n\n";

	cout<<"Printing the elements in Linked List 2 :"<<'\n';
	cout<<"\t";
	if(head_ref_2 == NULL)
	{
		cout<<"There are no elements in this list."<<"\n\n";
	}

	while (head_ref_2 != NULL)
 	{
    	cout<<' '<<head_ref_2->num<<" ";
     	head_ref_2 = head_ref_2->next;
	}
	cout<<"\n\n";	

	cout<<"Printing the elements in Intersection Linked list (Press 3 later to refresh) :"<<'\n';
	cout<<"\t";
	if(head_ref_3 == NULL)
	{
		cout<<"There are no elements in this list."<<"\n\n";
	}

	while (head_ref_3 != NULL)
 	{
    	cout<<' '<<head_ref_3->num<<" ";
     	head_ref_3 = head_ref_3->next;
	}
	cout<<"\n\n";
}

int main()
{
	int choice;
	int choice_2;
	struct node* head_1 = NULL;
	struct node* head_2 = NULL;
	struct node* head_3 = NULL;

	while(1)
	{
		cout<<"Press 1 to add item in Linked list_1      \tPress 2 to add item in Linked list_2"<<'\n';
		cout<<"Press 3 to show the intersection          \tPress 4 to display the linked lists"<<'\n';
		cout<<"Press 5 to delete element in Linked list_1\tPress 6 to delete element in linked list_2\n";
		cout<<"Press 0 to exit"<<'\n';
		cin>>choice;
		int x;

		if(choice == 0)
		{
			cout<<"Bye :)"<<'\n';
			exit(EXIT_SUCCESS);
		}

		else if(choice == 1)
		{
			cout<<"Enter the number to add item in list_1"<<'\n';
			cin>>x;
			append(&head_1,x);

		}

		else if(choice == 2)
		{
			cout<<"Enter the number to add item in list_2"<<'\n';
			cin>>x;
			append(&head_2,x);
		}

		else if(choice == 3)
		{
			deleteLL(&head_3);
			intersection(head_1,head_2,&head_3);
		}

		else if(choice == 4)
		{
			printList(head_1,head_2,head_3);
		}

		else if(choice == 5)
		{
			cout<<"To delete element by position (starts with index 0) Press 1"<<'\n';
			cout<<"To delete element by matching value (only one element) Press 2"<<'\n';
			cin>>choice_2;

			if(choice_2 == 1)
			{
				cout<<"Enter the position"<<'\n';
				cin>>x;
				deleteLL_pos(&head_1,x);
			}

			else if(choice_2 == 2)
			{
				cout<<"Enter the value"<<'\n';
				cin>>x;
				deleteLL_value(&head_1,x);
			}
		}

		else if(choice == 6)
		{
			cout<<"To delete element by position (starts with index 0) Press 1"<<'\n';
			cout<<"To delete element by matching value (only one element) Press 2"<<'\n';
			cin>>choice_2;

			if(choice_2 == 1)
			{
				cout<<"Enter the position"<<'\n';
				cin>>x;
				deleteLL_pos(&head_2,x);
			}

			else if(choice_2 == 2)
			{
				cout<<"Enter the value"<<'\n';
				cin>>x;
				deleteLL_value(&head_2,x);
			}
		}
	}

}