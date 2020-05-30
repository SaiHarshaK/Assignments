#include<stdio.h>
int main()
{
	int y;
	printf("Enter the year: \n");
	scanf("%d",&y);

	printf("day of the week for Jan 1 of %d is : ",y);
	int n=0;
	for(int i=1900;i<y;i++)
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

//that is if leap yr, n is inc by 1 unit.
	}
	n%=7;
	switch(n)
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
