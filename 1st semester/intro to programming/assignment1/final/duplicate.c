#include<stdio.h>
int main()
{
	
	int d,m,y;
	printf("Enter date\n");
	scanf("%d",&d);
	printf("Enter month\n");
	scanf("%d",&m);
	printf("Enter year\n");
	scanf("%d",&y);

	


	int count=0;
	int i=1;
	while(i<y)
	{
		count=count+1;
		
		if(i%4==0)
			{
				if(i%100==0)
				{
					if(i%400==0)
					count=count+1;
				}

				else count=count+1;
			}

			i++;
	}
	
	
	int check_leap=0;
	if(y%4==0)
			{
				if(y%100==0)
				{
					if(y%400==0)
						check_leap=1;
				}

				else check_leap=1;
			}

	
	
	int days=0;

	int limit=0;
	if(m>7)
		limit=8;
	else limit=m;

	i=1;
	while(i<limit)
	{	
		days+=31;
		i++;
	}

	i=9;
	while(i<m)
	{	
		days+=30;
		i++;
	}

	if(m>2)
		{
			if(check_leap==1)
				days+=29;
			else days+=28;
		}

	if(m>6)
		limit=7;
	else limit = m;

	i=4;
	while(i<limit)
	{
		days+=30;
		i++;
	}

	i=8;
	while(i<m)
	{
		days+=31;
		i++;
	}

	days+=d-1;
	count=count%7;
	days%=7;
	days+=count;
	days%=7;
	printf("Resultant day is : ");
	
	
	
		if(days==0)
			printf("Monday");
		else if(days==1)
			printf("Tuesday");
		else if(days ==2)
			printf("Wednesday");
		else if(days==3)
			printf("Thursday");
		else if(days==4)
			printf("Friday");
		else if(days==5)
			printf("Saturday");
		else 
			printf("Sunday");

	
}
