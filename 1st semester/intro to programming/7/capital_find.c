#include<stdio.h>
#include<string.h>
#include<stdlib.h>

char* get_capital(char country[])
{
	static char capital[50];
	char temp[500];
	FILE *source;
	source=fopen("capitals.txt","r");
	if( source == NULL )
   {
      printf("File does not exist...\n");
      exit(EXIT_FAILURE);
   }

   	while(fgets(temp, 510, source) != NULL) 
   	{
		int i,j;
   		int len_country=strlen(country);
   		int len_temp=strlen(temp); //to exclude '\0'
		if((strstr(temp, country)) != NULL) 
		{
			for(i=len_country+1,j=0;i<len_temp-2;i++,j++) //not +1 as comma is there in the file... and -2 bcuz of \n and end of line
			{
				capital[j]=temp[i];
			}
			capital[j]='\0';
	
		}

	}

	fclose(source);
	return capital;
}

int main()
{
	char country[50];
	printf("Enter the name of country: \n");
	fgets(country,50,stdin);
	country[strlen(country)-1]='\0';
	
	printf("The capital of %s is %s",country,get_capital(country));

	return 0;
}
