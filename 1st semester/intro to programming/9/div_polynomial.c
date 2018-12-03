/**********************************************************************
// author  : Sai Harsha Kottapalli / archelaus

// use     : Accept two polynomials P(x) and Q(x)
			 from the user and print the coefficients of the quotient and remainder when P(x) is
			 divided by Q(x)

**********************************************************************/

#include<stdio.h>
#include<stdlib.h>

void print_quotient_remainder(int divident_degree,int *polynomial_p,int divisor_degree,int *polynomial_q)
{
	while(1)
	{
		
	}
}

int main()
{
	int divident_degree,divisor_degree;
	printf("Enter the degree of the P(x)\n");
	scanf("%d",&divident_degree);
	int polynomial_p[divident_degree+1];
	for(int i=0;i<=divident_degree;i++)
	{
		printf("Enter the coefficient of a^%d : \n",i );
		scanf("%d",&polynomial_p[i]);
	}

	printf("Enter the degree of the Q(x)\n");
	scanf("%d",&divisor_degree);
	int polynomial_q[divisor_degree+1];
	for(int i=0;i<=divisor_degree;i++)
	{
		printf("Enter the coefficient of a^%d : \n",i );
		scanf("%d",&polynomial_q[i]);
	}

	print_quotient_remainder(divident_degree,polynomial_p,divisor_degree,polynomial_q);

	return 0;
}