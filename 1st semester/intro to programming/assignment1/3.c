#include<stdio.h>
#include<math.h>
#include<stdlib.h>
double evaluatePolynomial(double p[],double n,double x)
{
	double ans=p[0],x1=1;
	for(int i=1;i<n+1;i++)
	{
		x1*=x;
		ans+=p[i]*x1;
	}

	return ans;
}


int main()
{
	printf("Enter the degree of the polynomial:\n");
	int degree;
	scanf("%d",&degree);
	double n=degree;
	double p[degree+1];
	for(int i=0;i<degree+1;i++)
		{
			printf("Enter the value of a%d:\n",i );
			scanf("%lf",&p[i]);
		}
	double x;
	printf("Enter the value of x:\n");
	scanf("%lf",&x);
	double ans;
	ans=evaluatePolynomial(p,n,x);
	printf("The value of polynomial at %lf is %lf\n",x,ans );

	double d_p[degree];//differentiated polynomial
	for(int i=0,j=1;i<n+1;i++,j++)
		d_p[i]=j*p[j];

	double root=10000,root1=0,f,f1;
	f=evaluatePolynomial(p,n,root);
	f1=evaluatePolynomial(d_p,n-1,root);
	root=root-f/f1; 

	//to calculate more precise root if root!=root1(comparing first 2 digits after decimal)
	unsigned long long r=(root*1000000),r1=(root1*1000000);
	while(r!=r1)
	{
		root1=root;
		f=evaluatePolynomial(p,n,root);
		f1=evaluatePolynomial(d_p,n-1,root);
		if(f1==0)
		{
			printf("No roots");
			return 0;
		}
		root=root-f/f1;

		r=(root*1000000);
		r1=(root1*1000000);
	}
	printf("A real root of the polynomial is : %.3lf\n",root);
}
