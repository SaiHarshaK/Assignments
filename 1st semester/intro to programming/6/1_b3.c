#include<stdio.h>

struct circle
{
	double x;
	double y;
	double r;
};

int main()
{
	struct circle c1,c2;
	printf("Enter the first centre, x- co ordinate\n");
	scanf("%lf",&c1.x);
	printf("Enter the first centre, y- co ordinate\n");
	scanf("%lf",&c1.y);
	printf("Enter the first circle radius\n");
	scanf("%lf",&c1.r);
	printf("Enter the second centre, x- co ordinate\n");
	scanf("%lf",&c2.x);
	printf("Enter the second centre, y- co ordinate\n");
	scanf("%lf",&c2.y);
	printf("Enter the second circle radius\n");
	scanf("%lf",&c2.r);

	if( ((c1.x-c2.x)*(c1.x-c2.x) + (c1.y-c2.y)*(c1.y-c2.y) <= (c1.r+c2.r)*(c1.r+c2.r)) && 
		((c1.x-c2.x)*(c1.x-c2.x) + (c1.y-c2.y)*(c1.y-c2.y) >= (c1.r-c2.r)*(c1.r-c2.r)) )
		{
			printf("The circles intersect\n");
			return 0;
		}
	else printf("The circles do not intersect\n");
	return 0;
}