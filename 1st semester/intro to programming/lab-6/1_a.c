#include<stdio.h>

struct point
{
	double x;
	double y;
};
int main()
{
	struct point p1;
	printf("Enter the x- co ordinate\n");
	scanf("%lf",&p1.x);
	printf("Enter the y- co ordinate\n");
	scanf("%lf",&p1.y);

	printf("The entered point is : (%lf , %lf)",p1.x,p1.y);
}