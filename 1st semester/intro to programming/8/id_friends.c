#include <stdio.h>
#include <string.h>
#include<stdlib.h>
struct network
{
	char name[100];
	int id;
	int friends[10];
	int dimension;
};


void swap(int *x,int *y)
{
	int temp=*x;
	*x=*y;
	*y=temp;
}
void selection_sort(int *a,int n)
{
	for(int i=0;i<n-1;i++)
	{
		int min=i;
		for(int j=i+1;j<n;j++)
		{
			if(a[min]>a[j])
				min=j;
		}

		swap(&a[i],&a[min]);
	}
}
void bubble_sort(int *a,int n)
{
	for(int i=0;i<n-1;i++)
	{
		int flag=0;

		for (int j=0;j<n-i-1;j++)
		{
			if(a[j]>a[j+1])
			{
				int temp=a[j];
					a[j]=a[j+1];
					a[j+1]=temp;
				flag=1;
			}
		}
		if(flag==0)
			break;
	}
}

void printIntersection(struct network net[],int num1[],int d1,int num2[],int d2)
{

bubble_sort(num1,d1);
selection_sort(num2,d2);
printf("The Common friends are :\n");
int i=0,j=0;
int flag=0;
while(i<d1 && j<d2)
{
	if(num1[i]>num2[j])
		{
			j++;
		}
	else if(num1[i]<num2[j])
	{
			i++;
	}
	else
	{
		printf("%s ",net[num1[i] - 10].name );
		i++;
		j++;
		flag=1;
	}
}
if(flag==0)
	printf("There are no common friends\n");
return;
}



int main()
{
	FILE *source;
	source=fopen("Network.txt","r");
	if( source == NULL )
   {
      printf("File does not exist...\n");
      exit(EXIT_FAILURE);
   }
   char temp[500];

   struct network net[16];
   int i=0;
   while(fgets(temp, 500, source) != NULL && i<16) 
   	{
		char *parts;
		parts=strtok(temp," :,.");
		int flag=0;
		int index_friends=0;
			while (parts != NULL)
  				{
    				if(flag==0)
    				{
    					flag=1;
    		      		strcpy(net[i].name,parts);
    				}
    				else if(flag==1)
    				{
    					flag=2;
    					int num=0;
    					num=(parts[0]-'0')*10;
    					num+=parts[1]-'0';
    					net[i].id=num;
    				}
    				else //friends id
    				{
    					int num=0;
    					num=(parts[0]-'0')*10;
    					num+=parts[1]-'0';
    					net[i].friends[index_friends]=num;
    					index_friends++;
    				}
    				
    				parts = strtok (NULL, " ,.-");
  				}
  				net[i].dimension=index_friends-1;


  		i++;
	}
	net[i-1].dimension++;

	int id_1,id_2;
	printf("Enter the id of 1st person\n");
	scanf("%d",&id_1);
	printf("Enter the id of 2nd person\n");
	scanf("%d",&id_2);
	id_1-=10;
	id_2-=10;
	
	printIntersection(net,net[id_1].friends, net[id_1].dimension, net[id_2].friends, net[id_2].dimension);
}
