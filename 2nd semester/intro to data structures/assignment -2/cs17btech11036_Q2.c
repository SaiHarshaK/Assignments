#include <stdio.h>
#include <stdlib.h>

struct node {

	float cgpa;
	struct node *next;

};

void push(struct node** head_refer, float new_cgpa)
{
    struct node* new_node = (struct node*) malloc(sizeof(struct node));
	new_node->cgpa = new_cgpa;
 	new_node->next = (*head_refer);
 	(*head_refer) = new_node;
}
 
void printList(struct node *start)
{
	int index=0;
  while (start != NULL)
  {
  	index++;
    printf("student_%d -> %d ; %p ; %f ; %p\n", index,index,start,start->cgpa,start->next);
    start = start->next;
  }
}


int main()
{
	struct node *head = NULL ;
	float temp;

	int students;
	printf("Enter the number of students whose CPGA needs to be entered : ");
	scanf("%d",&students);

	for (int i = 0; i < students; i++)
	{
		printf("Enter the CGPA of the student : ");
		scanf("%f",&temp);

		push(&head,temp);
	}

	printf("Printing in the order -  Position of the node in the list; Address of the node ; Value stored ; The pointer stored in the node\n");
	printList(head);
}