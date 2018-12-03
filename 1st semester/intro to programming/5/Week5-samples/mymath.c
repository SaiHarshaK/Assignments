#include"mymath.h"
#define PI 3.1416
// powermod(a,b,n) finds a^b modulo n.
long powermod(long a,unsigned long b, long n)
{
	unsigned long i=1;
	long result=1;
	while (i<=b)
	{
		result=(result*a)%n;
		i=i+1;
	}
	return result;
}

double circleArea(double radius)
{
	double area;
	area=PI*radius*radius;
	return area;
}

// Finds a root of x^2-a
double squareRoot(double a)
{
	double x;
	int i=0;
	x=a/2;
	while (i<=100)
	{
		x=x-(x*x-a)/(2*x);
		i=i+1;
	}
	return x;
}


