#include<stdio.h>

struct line
{
	double c;
	double x;
	double y;
};

struct point
{
	double x;
	double y;
};

struct line line_equation(struct point p1,struct point p2)
{
	struct line l1;
	
	if(p1.x==p2.x && p1.y==p2.y)
	{
		l1.x=1;
		l1.y=0;
		l1.c=p1.x;

		return l1;
	}

	else
	{
		l1.y=(p2.x-p1.x);
		l1.x=(p1.y-p2.y);
		l1.c=((p1.y*(p1.x-p2.x) )+ (p1.x*(p2.y-p1.y)));
	
	}


	return l1;
}

int main()
{
	struct point p1,p2;
	printf("Enter the first x- co ordinate\n");
	scanf("%lf",&p1.x);
	printf("Enter the first y- co ordinate\n");
	scanf("%lf",&p1.y);

	printf("Enter the second x- co ordinate\n");
	scanf("%lf",&p2.x);
	printf("Enter the second y- co ordinate\n");
	scanf("%lf",&p2.y);

	struct line l1;
	l1=line_equation(p1,p2);

	printf("The entered line is : ");

	printf("%lfX + %lfY + %lf = 0",l1.x,l1.y,l1.c);
}