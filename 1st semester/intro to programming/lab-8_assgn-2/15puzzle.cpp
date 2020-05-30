/*********************************************************************
// author  : Sai Harsha Kottapalli

// use     : The 15-Puzzle game 

// best run on linux

*********************************************************************/

#include<iostream>
#include<string>
#include<cstdlib>
#include<ctime>
#include<ios>
#include<limits>

using std::cout;
using std::cin;
using std::string;

int get_x(string&);
void swap(char *,char *);
int initialize(string&);
int initialize_easy(string&,string&,int);
int initialize_diff(string&);
int check(string&,string&);
void print_puzzles(string&,string&);
void get_enter();
void get_enter_quit();
void error_call(int);


int main()
{
	choose:
	cout<<"Wanna play? press 1 (press 2 for guide )\n";
	short int choice;
	cin>>choice;
	cin.ignore(30000, '\n');

	system("clear");


	if(choice==1)
	{
		short int choice_controls;
		cout<<"Press 1 for WASD control or 2 for NESW control\n";
		cin>>choice_controls;
		cin.ignore(30000,'\n');

		system("clear");
		int position_space,count=0;
		
		//initialize
		string des_str;
		int position_space_des=initialize(des_str);
		
		cout<<"For easy - press 1 , For difficult - press 2 :"<<'\n';
		int difficulty;
		cin>>difficulty;
		cin.ignore(30000,'\n');
		string init_str;


		if(difficulty==1)
		{
			regenerate_1:


			position_space=initialize_easy(init_str,des_str,position_space_des);
			//if by chance same tables
			count=check(des_str,init_str);
			
			if(count==16)
				goto regenerate_1;
		}

		else if(difficulty==2)
		{
			regenerate_2:


			position_space=initialize_diff(init_str);
			//if by chance same tables
			count=check(des_str,init_str);
			
			if(count==16)
				goto regenerate_2;
		}

		position_space=initialize(init_str);

		print_puzzles(des_str,init_str);
		

		do
		{
			cout<<"\n\n\n\n";
			
			if(choice_controls==1)
			{
				input_WASD:

				cout<<"Press W , A , S , D\n";
				string x;
				cin>>x;

				if(x.size()>1)
					{
						error_call(choice_controls);
						goto input_WASD;
					}
				switch(x[0])
				{
					case 'w' :
					case 'W' :
								{
									if(position_space-4<0)
									{
										cout<<"You don't know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

										swap(&init_str[position_space],&init_str[position_space-4]);
										position_space=position_space-4;
								}
					break;

					case 'a':
					case 'A':
								{
									if((position_space-1%4)==3)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

										swap(&init_str[position_space],&init_str[position_space-1]);
										position_space=position_space-1;
								}

					break;
					
					case 'd':
					case 'D':
								{
									if((position_space+1%4)==0)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

										swap(&init_str[position_space],&init_str[position_space+1]);
										position_space=position_space+1;
								}
					break;
					
					case 's':
					case 'S':
								{
									if(position_space+4>15)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

									swap(&init_str[position_space],&init_str[position_space+4]);
									position_space=position_space+4;
								}
					break;
		
					default : 
								cout<<"You dont know how to play this game, please learn the rules\n";
								error_call(choice_controls);
				}
			}

			else if(choice_controls==2)
			{
				input_NESW:

				cout<<"Press N , E , S , W\n";
				string x;
				cin>>x;

				if(x.size()>1)
					{
						error_call(choice_controls);
						goto input_NESW;
					}
				switch(x[0])
				{
					case 'n' :
					case 'N' :
								{
									if(position_space-4<0)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

									swap(&init_str[position_space],&init_str[position_space-4]);
									position_space=position_space-4;
								}
					break;

					case 'w':
					case 'W':
								{
									if((position_space-1%4)==3)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

									swap(&init_str[position_space],&init_str[position_space-1]);
									position_space=position_space-1;
								}

					break;
			
					case 'e':
					case 'E':
								{
									if((position_space+1%4)==0)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

									swap(&init_str[position_space],&init_str[position_space+1]);
									position_space=position_space+1;
								}
					break;
			
					case 's':
					case 'S':
								{
									if(position_space+4>15)
									{
										cout<<"You dont know how to play this game, please learn the rules\n";
										exit(EXIT_FAILURE);
									}

									swap(&init_str[position_space],&init_str[position_space+4]);
									position_space=position_space+4;
								}
					break;
			
					default : 
									cout<<"You dont know how to play this game, please learn the rules\n";
									error_call(choice_controls);
				}
			}

			else 
			{ 
				cout<<"Wrong inputs\n";
				exit(EXIT_FAILURE);
			}


			print_puzzles(des_str,init_str);
			count=check(des_str,init_str);
	
		} while(count!=16);
	


		cout<<"\nCongratulations, you have solved it !!!\n";

		return 0;

	}

	else if(choice==2)
	{
		system("clear");
		cout<<"The 15-puzzle is played as follows:\n";
		cout<<"There is a 4 by 4 matrix consisting of entries\n";
		cout<<"1,2,...,9,A,B,C,D,E,F in 15 different positions and one empty position. The goal of\n";
		cout<<"the game is to start with an initial configuration of the grid and reach the configuration\n";
		cout<<"where the characters are in the right order by a sequence of moves, where each move\n";
		cout<<"consists of swapping the empty location with any of its neighboring values.\n";

		cout<<"The matrix on the left is the desirable configuration. This can be reached from the\n";
    	cout<<"configuration on the right by swapping the blank location \n";


   		cout<<"Example: \n\n";

    	string des_str="123456789ABCDEF ";
    	string init_str="123456789A BDEFC";


    	print_puzzles(des_str,init_str);
    	cout<<"\n\n";

    	cout<<"In this case the solution would be swapping the blank location value with B and then\n";
    	cout<<"swapping the blank location value with C.\n";

    	cout<<"\n\n\n";
    	cout<<"For controls :\n";
    	cout<<"For WASD mode : ";                        cout<<"\t\t\t\t\t\t";  cout<<"For NESW mode : \n";
    	cout<<"\t W for swapping above block";		   cout<<"\t\t\t\t\t\t";  cout<<"N for swapping above block\n";
    	cout<<"\t A for swapping left block";	 	   	   cout<<"\t\t\t\t\t\t";  cout<<"E for swapping left block\n";
    	cout<<"\t S for swapping bottom block";		   cout<<"\t\t\t\t\t\t";  cout<<"S for swapping bottom block\n";
    	cout<<"\t D for swapping right block";		   cout<<"\t\t\t\t\t\t";  cout<<"W for swapping right block\n";

    
    	get_enter();

    	system("clear");
    	cout<<"To play tutorial press 1 or press 2 to go to menu"<<'\n';
    	int tut=0;
    	cin>>tut;
    	cin.ignore(30000,'\n');

    	if(tut==1)
    	{
    		system("clear");
    		tutorial:

    		print_puzzles(des_str,init_str);
    		cout<<"press D (WASD) / W (NESW) :"<<'\n';
    			string x;
				cin>>x;

				if(x.size()>1)
					{
						cout<<"Wrong input"<<'\n';
						exit(EXIT_FAILURE);
					}
			if(x[0]=='d' || x[0]=='D' ||x[0]=='W' ||x[0]=='w')
			{
				string init_str="123456789AB DEFC";
				print_puzzles(des_str,init_str);
				cout<<"\n\n"<<"Nice! Now press S (WASD) / S (NESW)"<<'\n';

					string y;
					cin>>y;

					if(y.size()>1)
						{
							cout<<"Wrong input"<<'\n';
							exit(EXIT_FAILURE);
						}
					if(y[0]=='s' || y[0]=='S' )
					{
						print_puzzles(des_str,des_str);
						cout<<"\n\n"<<"Great! You have completed the tutorial"<<'\n';
						cin.ignore(30000,'\n');
						get_enter_quit();
						system("clear");
						goto choose;				
					}
					else
					{
						cout<<"Seems like you did not understand the instructions, Try again?"<<'\n';
						get_enter();
						goto tutorial;
					}
			}
			else
			{
				cout<<"Seems like you did not understand the instructions, Try again?"<<'\n';
				get_enter();
				system("clear");
				goto tutorial;
			}	
    	}
    	else if (tut==2)
    	{
    		system("clear");
			goto choose;
    	}
    	else
    	{
    		cout<<"wrong input"<<'\n';
    		exit(EXIT_FAILURE);
    	}

	}

}


int get_x(int size)
{
	srand(time(NULL));
	return rand()%size;
}

void swap(char *x,char *y)
{
	int temp=*x;
	*x=*y;
	*y=temp;
}

int initialize(string& str)
{
	int position_space;
	string ch2="123456789ABCDEF ";
	int x;
	
	
	for(int i=0;i<16;i++)
	{
		x=get_x(ch2.size());

		str+=ch2[x];
		ch2.erase(ch2.begin() + x);

		if(str[i]==' ')
			position_space=i;
	}
 
return position_space;
}

int initialize_diff(string& str)
{
	int position_space;
	string ch2="432B CD685F9EA71";
	int x;
	
	
	for(int i=0;i<16;i++)
	{
		x=get_x(ch2.size());

		str+=ch2[x];
		ch2.erase(ch2.begin() + x);

		if(str[i]==' ')
			position_space=i;
	}
 

return position_space;
}

int initialize_easy(string& str,string& desti,int position_des)
{
	int position_space;
	string ch2="123456789ABCDEF ";
	int x;
	
	int k=0;
	if(position_des<8)
		k=8;
	//if position_space in upper half, then keep lower half static
	if(position_des<8)
		{
			str.append(8,' ');//dummy elements for first 8.
			str.append(desti,8,8);//else the upper half is fixed
		}
	else
	{
		str.append(desti,0,8);
	}


	for (int i=k;i<k+8;i++)
	{
		for(int j=0;j<16;j++)
		{
			if(str[i]==ch2[j])
				{
					ch2.erase(ch2.begin() + j );
					break;
				}
		}
	}


	if(position_des<8)
	{
		for(int i=0;i<8;i++)
		{
			x=get_x(ch2.size());

			str[i]=ch2[x];
			ch2.erase(ch2.begin() + x);

			if(str[i]==' ')
				position_space=i;
		}
 	}
 	else//position_des>=8
 	{
 		for(int i=8;i<16;i++)
		{
			x=get_x(ch2.size());

			str+=ch2[x];
			ch2.erase(ch2.begin() + x);

			if(str[i]==' ')
				position_space=i;
		}
 	}

return position_space;
}

int check(string& des_str,string& init_str)
{
	int count=0;
	for(int i=0;i<16;i++)
	{
		if(des_str[i]==init_str[i])
			count++;
	}
	return count;
}

void print_puzzles(string& des_str,string& init_str)
{
	cout<<"Desirable config: ";	cout<<"\t\t\t\t\t\t";   cout<<"Current configuration:\n\n";

	cout<<"--------------";	cout<<"\t\t\t\t\t\t\t";	cout<<"--------------\n";


	for(int i=0;i<4;i++)
		cout<<"| "<<des_str[i];   	cout<<" |";

    cout<<"\t\t\t\t\t\t\t";

	for(int i=0;i<4;i++)
		cout<<"| "<<init_str[i]; cout<<" |\n";



/**********************************************************************************************/
	cout<<"--------------";   cout<<"\t\t\t\t\t\t\t";  cout<<"--------------\n";
/**********************************************************************************************/	


for(int i=4;i<8;i++)
	cout<<"| "<<des_str[i];   	cout<<" |";

cout<<"\t\t\t\t\t\t\t";

for(int i=4;i<8;i++)
	cout<<"| "<<init_str[i];   cout<<" |\n";


	

/**********************************************************************************************/
	cout<<"--------------";   cout<<"\t\t\t\t\t\t\t";  cout<<"--------------\n";
/**********************************************************************************************/	

for(int i=8;i<12;i++)
	cout<<"| "<<des_str[i];   	cout<<" |";

cout<<"\t\t\t\t\t\t\t";

for(int i=8;i<12;i++)
	cout<<"| "<<init_str[i];   cout<<" |\n";

	

/**********************************************************************************************/
	cout<<"--------------";   cout<<"\t\t\t\t\t\t\t";  cout<<"--------------\n";
/**********************************************************************************************/	

for(int i=12;i<16;i++)
	cout<<"| "<<des_str[i];   	cout<<" |";

cout<<"\t\t\t\t\t\t\t";

for(int i=12;i<16;i++)
	cout<<"| "<<init_str[i];   cout<<" |\n";

	

/**********************************************************************************************/
	cout<<"--------------";   cout<<"\t\t\t\t\t\t\t";  cout<<"--------------\n";
/**********************************************************************************************/	


}

void get_enter_quit()
{
	cout<<"\n\nPress Y to continue or Q to quit \n";
	string x;
	cin>>x;
	if(x.size()>1)
	{
		cout<<"Wrong input"<<'\n';
		exit(EXIT_FAILURE);
	}
	else if(x[0]=='q' || x[0]=='Q')
	{
		system("clear");
		cout<<"Thank You For Playing :)"<<'\n';
		exit(EXIT_SUCCESS);
	}
	
	else if(x[0]=='y'||x[0]=='Y')
	{
		return;
	}
	else 
	{
		cout<<"Wrong input"<<'\n';
		exit(EXIT_FAILURE);
	}
}

void error_call(int choice_controls)
{
	cout<<"Please follow instructions, wrong input."<<'\n';
	get_enter();
	system("clear");

}

void get_enter()
{
	cout<<"\n\nPress Enter to continue...\n";
	cin.ignore(32767, '\n'); 
}