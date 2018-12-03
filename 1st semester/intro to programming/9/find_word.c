#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define limit 1000

/*void matrix_network(char matrix[30][30])
{


	return;
}*/ //need help , how to pass a 2d matrix and change values in it

void strrev(char *str)
{
      char *p1, *p2;

      
      for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
      {
            *p1 ^= *p2;
            *p2 ^= *p1;
            *p1 ^= *p2;
      }
      
}


int check_word(int m,char matrix[][limit],char str[])
{

    char duplicate_matrix[limit][limit];
    int len=strlen(matrix[0]);
	char rev_str[100];
	strcpy(rev_str,str);
	strrev(rev_str);
	//left - right
	for(int i=0;i<m;i++)
	{
		if(strstr(matrix[i],str)!=NULL)
			return 1;
	}

	//right - left
	for(int i=0;i<m;i++)
	{
		if(strstr(matrix[i],rev_str)!=NULL)
			return 1;
	}

	//for up -down and down - up
	int i,j;
	for(i=0;i<m;i++)
	{
		for(j=0;j<len;j++)
		{
			duplicate_matrix[j][i]=matrix[i][j];
		}
		duplicate_matrix[j][i]='\0';
	}
	
	//for up - down 
	for(i=0;i<m;i++)
	{
		if(strstr(duplicate_matrix[i],str)!=NULL)
			return 1;
	}

	//down - up

	for(i=0;i<m;i++)
	{
		if(strstr(duplicate_matrix[i],rev_str)!=NULL)
			return 1;
	}
	return 0;
}
int main()
{
	short int choice;
	printf("Enter 1 for check a word in input matrix , 2 for checking the words.txt in matrix.txt\n");
	scanf("%hd",&choice);
	getchar();
	system("clear");
	if(choice==1)
	{
		printf("Enter the number of rows of matrix\n");
		int m;
		scanf("%d",&m);
		getchar();

		char matrix[m][limit];
		for(int i=0;i<m;i++)
			{
				scanf("%s",matrix[i]);
				getchar();
			}


		printf("Enter the word\n");
		char str[limit];
		scanf("%s",str);
		getchar();
		printf("The answer is : %d",check_word(m,matrix,str));
	}

	else if(choice==2)
	{
		char matrix[20][limit];

		FILE *source_matrix,*source_words;
		source_matrix=fopen("matrix.txt","r");
		source_words=fopen("words.txt","r");

		if(source_matrix==NULL || source_words==NULL)
			printf("matrix.txt or words.txt doesn't not exist\n");

		char temp[limit];
		int i=0;
		while(fgets(temp, 500, source_matrix) != NULL) 
		{
			strcpy(matrix[i],temp);


			i++;
		}


		while(fgets(temp,2000,source_words) != NULL)
		{
			char *parts;
			parts=strtok(temp,"\",");
			while (parts != NULL)
			{
				printf("Existence of %s in the matrix : %d\n",parts,check_word(20,matrix,parts));
				parts = strtok (NULL, "\",");
			}
		}
		
		return 0;
	}
}

