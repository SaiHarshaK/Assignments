#include <iostream>
#include <string>

using namespace std;

int check_full(int *a,int *top)
{
	if(&a[999]==top)
		return 1;
	else return 0;
}

void push(int *a,int *top,int element)
{
	if(check_full(a,top))
		{
			cout<<"This stack has the ability to store only 1000 elements....Exiting";
			exit(EXIT_FAILURE);
		}


	*top=element;
}

void pop(int *a,int *top)
{
	return;
}
int peek(int *a,int *top,int element)
{
	top--;

	if(*top==element)
		return 1;
	else return 0;

}
int main()
{
	int t;
	cout<<"Enter the number of testcases"<<'\n';
	cin>>t;

	while(t--)
	{
		cout<<"Please enter the combination"<<'\n';
		string str;
		cin>>str;
		int a[1000];
		int *top=a;
		int flag=0;

		for (int i = 0; i < str.length(); i++)
		{
			if(str[i]=='{' || str[i]=='[' || str[i]=='(')
			{
				push(a,top,str[i]);
				top++;
			}

			else if(str[i]=='}' || str[i]==']' || str[i]==')')
			{
				if(str[i]=='}')
				{
					if(peek(a,top,'{'))
						{
							pop(a,top);
							top--;
						}
					else {
						cout<<i<<' ';flag=1;}
				}
				else if(str[i]==']')
				{
					if(peek(a,top,'['))
						{
							pop(a,top);
							top--;
						}
					else {
						cout<<i<<' ';flag=1;}
				}

				else if(str[i]==')')
				{
					if(peek(a,top,'('))
						{
							pop(a,top);
							top--;
						}
					else {
						cout<<i<<' ';flag=1;}
				}
			}
		}

		if(flag==1)
			cout<<"NO"<<'\n';
		else cout<<"YES"<<'\n';


	}
}
