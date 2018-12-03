#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

void Display(int *a,int *top)
{
	cout<<"The current Stack is :"<<'\n';
	for (int *i = a; i < top; i++)
	{
		cout<<*i<<" ";
	}

	cout<<'\n';
}

int check_full(int *a,int *top)
{
	if(&a[999]==top)
		return 1;
	else return 0;
}

int check_empty(int *a,int *top)
{
	if(top==a)
		return 1;
	

	return 0;

}

void push(int *a,int *top)
{
	if(check_full(a,top))
		{
			cout<<"This stack has the ability to store only 1000 elements....Exiting";
			exit(EXIT_FAILURE);
		}

	cout<<"What element should be entered?"<<'\n';
	int element;
	cin>>element;
	*top=element;
}

void pop(int *a,int *top)
{

	top--;

	cout<<"element "<<*top<<" will be removed"<<'\n';
}

void peek(int *a,int *top)
{
	top--;

	cout<<"The value of the top most element is :"<<*top<<'\n';

}

void isEmpty(int *a,int *top)
{
	if(check_empty(a,top))
		cout<<"True"<<'\n';
	else cout<<"False"<<'\n';
}

int main()
{
	int a[1000]={0};

	int choice=-1;
	int *top = a;
	//let push=1, pop=2, peek=3, isEmpty=4, Display=5 ,exit = 6;

	yolo:
	cout<<"Press 1 for push ; Press 2 for pop"<<'\n'<<"Press 3 for peek ; Press 4 for isEmpty"<<'\n'<<"Press 5 for Display ; Press 6 to exit"<<'\n';

	cin>>choice;
	system("clear");

	string str;
	switch(choice)
	{
		case 1:
			str="push";
			break;
		case 2:
			str="pop";
			break;
		case 3:
			str="peek";
			break;
		case 4:
			str="isEmpty";
			break;
		case 5:
			str="Display";
			break;
		case 6:
			str="exit";
		default:
			cout<<"error";
			exit(EXIT_FAILURE);

	}

	cout<<"You have pressed "<<str<<'\n';
	
	if(choice==6)
		exit(EXIT_SUCCESS);

	if(choice==1)
	{
		push(a,top);
		cout<<"element has been entered"<<'\n';
		top++;
	}
	else if(choice==2)
	{
		if(top==a)
			{
				cout<<"Since, The stack is empty cannot delete value....Exiting"<<'\n';
				exit(EXIT_SUCCESS);
			}

		pop(a,top);
		top--;
	}

	else if(choice==3)
	{
		if(top==a)
			{
				cout<<"Since, The stack is empty cannot delete value....Exiting"<<'\n';
				exit(EXIT_SUCCESS);
			}

		peek(a,top);
	}

	else if(choice==4)
	{
		isEmpty(a,top);
	}
	else if(choice==5)
	{
		Display(a,top);
	}

	goto yolo;


}