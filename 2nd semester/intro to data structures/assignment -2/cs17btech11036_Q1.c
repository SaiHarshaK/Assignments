#include <stdio.h>
#include <stdlib.h>

struct node {

	float cgpa;
	struct node *next;

};


int main()
{
	struct node students[4];

	for (int i = 0; i < 4; i++ )
	{
		printf("Enter the value of cgpa : ");

		scanf("%f",&students[3-i].cgpa);

		if(i!=3)
		students[i].next=&students[i+1];

	}

	students[3].next=NULL;

	printf("Printing in the order -  Position of the node in the list; Address of the node ; Value stored ; The pointer stored in the node\n");
	for (int i = 0; i < 4; ++i)
	{
		printf("student_%d -> %d ; %p ; %f ; %p\n", i+1,i+1,&students[i],students[i].cgpa,students[i].next);
	}
}