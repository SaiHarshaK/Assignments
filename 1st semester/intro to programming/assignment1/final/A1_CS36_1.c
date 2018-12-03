#include<stdio.h>
int main()
{
	
	int d,m,y;
	yolo:
	printf("Enter date in number format\n");
	scanf("%d",&d);
	printf("Enter month in number format\n");
	scanf("%d",&m);
	printf("Enter year in number format\n");
	scanf("%d",&y);

	int leap=0;
	if(y%4==0)
			{
				if(y%100==0)
				{
					if(y%400==0)
						leap=1;
				}

				else leap=1;
			}

	if( d<=0 ||m<=0 ||y<=0||(m%2==1 && d>31 && m<=7)||(m%2==0 && m!=2 && d>30 && m<=7) || (m%2==1 && d>30 && m<=12 &&m>7)||(m%2==0 && m!=2 && d>31 && m<=12 &&m>7) ||(m==2 && leap==1 && d>29)||(m==2 && leap==0 && d>28))
	{
		printf("Wrong entry \n");
		printf("Try again? press y\n");
		char alpha;
		scanf("%c",&alpha);
		scanf("%c",&alpha);
		if(alpha=='y' ||alpha=='Y')
			goto yolo;
		else return 0;
	}


	int n=0;
	for(int i=1;i<y;i++)
	{
		n++;
		
		if(i%4==0)
			{
				if(i%100==0)
				{
					if(i%400==0)
						n++;
				}

				else n++;
			}

	}
	int flag=0;
	if(y%4==0)
			{
				if(y%100==0)
				{
					if(y%400==0)
						flag=1;
				}

				else flag=1;
			}

	n%=7;
	int days=0;

	int check=0;
	if(m>7)
		check=8;
	else check=m;
	for(int i=1;i<check;i+=2)
	{	
		days+=31;
	}

	for(int i=9;i<m;i+=2)
	{	
		days+=30;
	}

	if(m>2)
		{
			if(flag==1)
				days+=29;
			else days+=28;
		}

	if(m>6)
		check=7;
	else check = m;
	for(int i=4;i<check;i+=2)
	{
		days+=30;
	}

	for(int i=8;i<m;i+=2)
	{
		days+=31;
	}

	days+=d-1;

	days%=7;
	days+=n;
	days%=7;
	printf("The day is : ");
	switch(days)
	{
		case 0:
			printf("Monday");
			break;
		case 1:
			printf("Tuesday");
			break;
		case 2:
			printf("Wednesday");
			break;
		case 3:
			printf("Thursday");
			break;
		case 4:
			printf("Friday");
			break;
		case 5:
			printf("Saturday");
			break;
		case 6:
			printf("Sunday");
			break;

	}
}
