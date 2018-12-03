#include <stdio.h>
#include <stdlib.h>

// doubly linked list
struct Node {
		int data;
		struct Node* next; // Pointer to next node in DLL
		struct Node* prev; // Pointer to previous node in DLL
};

//insert node to the start
void push(struct Node** head_ref, int new_data) {
  struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
  new_node->data = new_data;
  new_node->next = (*head_ref);
  new_node->prev = NULL;

  if ((*head_ref) != NULL) {
    (*head_ref)->prev = new_node;
	}
  (*head_ref) = new_node;
  return;
}

//insert node at the end
void append(struct Node** head_ref, int new_data) {
	struct Node* new_node = (struct Node*)malloc(sizeof(struct Node));
	new_node->data = new_data;
	new_node->next = NULL;

	if (*head_ref == NULL) {
    new_node->prev = NULL;
    *head_ref = new_node;
    return;
   }

	struct Node* last = *head_ref;
	while(last->next != NULL) {
		last = last->next;
	}
	last->next = new_node;
	new_node->prev = last;
	return;
}

void print_DLL(struct Node** head_ref) {
	struct Node* head = *head_ref;
	while(head != NULL) {
		printf("%d ",head->data);
		head = head->next;
	}
	printf("\n");
}

//get equal length DLL
void equalize_length(struct Node** head_ref_1, struct Node** head_ref_2, int count_1, int count_2) {
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

//add the DLL's and store result
void add(struct Node** head_ref_1, struct Node** head_ref_2, int count_1, int count_2) {

	//now equal length DLL
	struct Node* result = NULL;
	struct Node* l1 = *head_ref_1;
	struct Node* l2 = *head_ref_2;
	//get to last nodes( need while loop for only once LL since same length)
	while(l1->next != NULL) {
		l1 = l1->next;
		l2 = l2->next;
	}
	int carry = 0, sum = 0;
	while(l1->prev != NULL) {
		sum = l1->data + l2->data + carry;
		if(sum > 9) {
			sum -= 10;
			carry = 1;
		}
		else {
			carry = 0;
		}
		push(&result,sum);

		l1 = l1->prev;
		l2 = l2->prev;
	}
	if(carry == 1) {
		push(&result,1);
	}


	print_DLL(&result);
	return;
}

void delete_DLL(struct Node** head_ref) {
	struct Node* current = *head_ref;
	struct Node* next;

	while (current != NULL)
	{
	   next = current->next;
	   free(current);
	   current = next;
	}

	*head_ref = NULL;
}

int main(){
	int flag = 0, count_1=0, count_2=0;
	int digit;
	struct Node* number_1 = NULL;
	struct Node* number_2 = NULL;

	while((digit = getchar()) != EOF) {
		if(digit == '\n') {
			if(count_1 < count_2) {
			for(int k = count_2 - count_1; k > 0; k--) {
					push(&number_1,0);
				}
			}
			else if(count_2 < count_1) {
				for(int k = count_1 - count_2; k > 0; k--) {
					push(&number_2,0);
				}
			}

			add(&number_1,&number_2,count_1,count_2);
			number_1 = NULL;
			number_2 = NULL;

			flag = 0;
			count_1 = 0;
			count_2 = 0;
		}
		else if(digit == ' ') {
			flag = 1;
		}
		else {
			if(flag == 0 ) {
				append(&number_1,digit);
				count_1++;
			}
			else {
				append(&number_2,digit);
				count_2++;
			}

		}
	}
	return(0);
}
