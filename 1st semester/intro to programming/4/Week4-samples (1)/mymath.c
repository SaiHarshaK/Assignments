#include"mymath.h"
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


