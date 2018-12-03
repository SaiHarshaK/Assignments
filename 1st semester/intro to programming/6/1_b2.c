#include<stdio.h>
#include<math.h>

typedef struct point
{
	double x;
	double y;
} sp;

double area(sp p1,sp p2,sp p3)
{
	double ans;
	ans=fabs(  p1.x*(p2.y - p3.y) + p2.x*(p3.y - p1.y) + p3.x*(p1.y-p2.y)  );
	ans/=2;

	return ans;
}
int main()
{
	struct point p1,p2,p3;
	printf("Enter the first x- co ordinate\n");
	scanf("%lf",&p1.x);
	printf("Enter the first y- co ordinate\n");
	scanf("%lf",&p1.y);

	printf("Enter the second x- co ordinate\n");
	scanf("%lf",&p2.x);
	printf("Enter the second y- co ordinate\n");
	scanf("%lf",&p2.y);

	printf("Enter the third x- co ordinate\n");
	scanf("%lf",&p3.x);
	printf("Enter the third y- co ordinate\n");
	scanf("%lf",&p3.y);

	printf("The area of the entered triangle is : ");
	double ans=area(p1,p2,p3);
	printf("%lf\n",ans );

}	