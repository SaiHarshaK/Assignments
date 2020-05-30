/**********************************************************************
// author  : Sai Harsha Kottapalli / archelaus

// use     : The 15-Puzzle game 

**********************************************************************/

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<time.h>

int get_x(char *ch)
{
	srand(time(NULL));
	int len=strlen(ch);
	return rand()%len;
}

void swap(char *x,char *y)
{
	int temp=*x;
	*x=*y;
	*y=temp;
}

int initialize(char *str)
{
	int position_space;
	char ch2[]="123465789ABCDEF ";
	int x;
	x=get_x(ch2);
	char *p1;

	p1=str;
	for(int i=0;i<16;i++,p1++)
	{ 
	while(ch2[x]=='0')
		{ x=get_x(ch2);}

	*p1 = ch2[x]; 
	ch2[x]='0';
    }

    int i,flag=0;
    for(p1=str,i=0;i<16;p1++,i++)
    {
    	if(*p1==' ')
    		{
    			position_space=i;
    			flag=1;
    		}
    	if(flag==1)
    	return position_space;
    }
 
return position_space;
}


int check(char *des_str,char *init_str)
{
	int count=0;
	for(int i=0;i<16;i++)
	{
		if(des_str[i]==init_str[i])
			count++;
	}
	return count;
}

void print_puzzles(char *des_str,char *init_str)
{
	printf("Desirable config: ");	printf("\t\t\t\t\t\t");   printf("Current configuration:\n\n");

	printf("-----------------");	printf("\t\t\t\t\t\t");	printf("-----------------\n");


	for(int i=0;i<4;i++)
	printf("| %c ",des_str[i]);   	printf("|");

	
    printf("\t\t\t\t\t\t");
	for(int i=0;i<4;i++)
		printf("| %c ",init_str[i] ); printf("|\n");



/**********************************************************************************************/
	printf("-----------------");   printf("\t\t\t\t\t\t");  printf("-----------------\n");
/**********************************************************************************************/	


for(int i=4;i<8;i++)
	printf("| %c ",des_str[i]);   	printf("|");

printf("\t\t\t\t\t\t");
for(int i=4;i<8;i++)
	printf("| %c ",init_str[i] );   printf("|\n");


	

/**********************************************************************************************/
	printf("-----------------");   printf("\t\t\t\t\t\t");  printf("-----------------\n");
/**********************************************************************************************/	

	for(int i=8;i<12;i++)
	printf("| %c ",des_str[i]);   	printf("|");

printf("\t\t\t\t\t\t");
for(int i=8;i<12;i++)
	printf("| %c ",init_str[i] );   printf("|\n");

	

/**********************************************************************************************/
	printf("-----------------");   printf("\t\t\t\t\t\t");  printf("-----------------\n");
/**********************************************************************************************/	

	for(int i=12;i<16;i++)
	printf("| %c ",des_str[i]);   	printf("|");

printf("\t\t\t\t\t\t");
for(int i=12;i<16;i++)
	printf("| %c ",init_str[i] );   printf("|\n");

	

/**********************************************************************************************/
	printf("-----------------");   printf("\t\t\t\t\t\t");  printf("-----------------\n");
/**********************************************************************************************/	


}
void get_enter()
{
	printf("\n\nPress Enter to continue...\n");
	while(getchar()!='\n')
					;
}

void get_enter_noprint()
{
	while(getchar()!='\n')
					;
}

int main()
{
	choose:
	printf("Wanna play? press 1 (press 2 for guide )\n");
	short int choice;
	scanf("%hd",&choice);
	getchar();
	system("clear");


	if(choice==1)
	{
		short int choice_controls;
		printf("Press 1 for WASD control or 2 for NESW control\n");
		scanf("%hd",&choice_controls);
		getchar();
		system("clear");
		int position_space,count=0;
	
		//initialize
		char des_str[17];
		position_space=initialize(des_str);

		char init_str[17];
		position_space=initialize(init_str
		);

		print_puzzles(des_str,init_str);
		

		do
		{
			printf("\n\n\n\n");
			
			if(choice_controls==1)
			{
				printf("Press W , A , S , D\n");
				char x;
				scanf("%c",&x);
				get_enter_noprint();
				switch(x)
				{
					case 'w' :
					case 'W' :
								{
									if(position_space-4<0)
									{
										printf("You dont know how to play this game, plz go learn the rules\n");
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
										printf("You dont know how to play this game, plz go learn the rules\n");
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
										printf("You dont know how to play this game, plz go learn the rules\n");
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
										printf("You dont know how to play this game, plz go learn the rules\n");
										exit(EXIT_FAILURE);
									}

									swap(&init_str[position_space],&init_str[position_space+4]);
									position_space=position_space+4;
								}
					break;
		
					default : 
								printf("You dont know how to play this game, plz go learn the rules\n");
								exit(EXIT_FAILURE);
		}
	}

	else if(choice==2)
	{
		printf("Press N , E , S , W\n");
		char x;
		scanf("%c",&x);
		getchar();
	
		switch(x)
		{
			case 'n' :
			case 'N' :
						{
							if(position_space-4<0)
							{
								printf("You dont know how to play this game, plz go learn the rules\n");
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
								printf("You dont know how to play this game, plz go learn the rules\n");
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
								printf("You dont know how to play this game, plz go learn the rules\n");
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
								printf("You dont know how to play this game, plz go learn the rules\n");
								exit(EXIT_FAILURE);
							}

							swap(&init_str[position_space],&init_str[position_space+4]);
							position_space=position_space+4;
						}
			break;
			
			default : 
							printf("You dont know how to play this game, plz go learn the rules\n");
							exit(EXIT_FAILURE);
		}
	}

	else 
	{ 
		printf("Wrong inputs\n");
		exit(EXIT_FAILURE);
	}


	print_puzzles(des_str,init_str);
	count=check(des_str,init_str);
	
	} while(count!=16);
	




	printf("\nCongrats u have solved it !!!\n");
	return 0;

}

else if(choice==2)
{
	system("clear");
	printf("The 15-puzzle is played as follows:\n");
	printf("There is a 4 by 4 matrix consisting of entries\n");
	printf("1,2,...,9,A,B,C,D,E,F in 15 different positions and one empty position. The goal of\n");
	printf("the game is to start with an initial configuration of the grid and reach the configuration\n");
	printf("where the characters are in the right order by a sequence of moves, where each move\n");
	printf("consists of swapping the empty location with any of its neighboring values.\n");

	printf("The matrix on the left is the desirable configuration. This can be reached from the\n");
    printf("configuration on the right by swapping the blank location \n");


    printf("Example: \n\n");

    char des_str[]="123456789ABCDEF ";
    char init_str[]="123456789A BDEFC";


    print_puzzles(des_str,init_str);
    printf("\n\n");

    printf("In this case the solution would be swapping the blank location value with C and then\n");
    printf("swapping the blank location value with B.\n");

    printf("\n\n\n");
    printf("For controls :\n");
    printf("For WASD mode : ");                        printf("\t\t\t\t\t\t");  printf("For NESW mode : \n");
    printf("\t W for swapping above block");		   printf("\t\t\t\t\t\t");  printf("\t N for swapping above block\n");
    printf("\t A for swapping left block");	 	   	   printf("\t\t\t\t\t\t");  printf("\t E for swapping left block\n");
    printf("\t S for swapping bottom block");		   printf("\t\t\t\t\t\t");  printf("\t S for swapping bottom block\n");
    printf("\t D for swapping right block");		   printf("\t\t\t\t\t\t");  printf("\t W for swapping right block\n");

    
    get_enter();
    system("clear");
	goto choose;
}
}
