#include<stdio.h>
#include<math.h>
typedef long double Ld;
typedef long long int lli;

#define MAX 500
int multiply(int x, int res[], int res_size)
{
    int carry = 0; // Initialize carry

    // One by one multiply n with individual digits of res[]
    for (int i=0; i<res_size; i++)
    {
        int prod = res[i] * x + carry;
        res[i] = prod % 10; // Store last digit of 'prod' in res[]
        carry = prod/10; // Put rest in carry
    }

    // Put carry in res and increase result size
    while (carry)
    {
        res[res_size] = carry%10;
        carry = carry/10;
        res_size++;
    }
    return res_size;
}
long long int factorial(int n)
{
    int res[MAX];

    // Initialize result
    res[0] = 1;
    int res_size = 1;

    // Apply simple factorial formula n! = 1 * 2 * 3 * 4...*n
    for (int x=2; x<=n; x++)
        res_size = multiply(x, res, res_size);

    long long int ans=0;
    for (int i=res_size-1; i>=0; i--)
        ans=(ans*10)+res[i];

    return ans;
}


Ld get_answer(Ld p,int n,int k)
{
	//answer is nCk(p^k)*((1-q)^(n-k))
	lli ans_a=0,ans_b=0,ans_c=0,ans;

	ans_a=factorial(n);
	ans_b=factorial(n-k);
	ans_c=factorial(k);
	ans=ans_a/(ans_b);
	ans/=ans_c;
	//nck calculated

	ans_a=pow(p,k);
	ans_b=pow(1-p,n-k);
	ans*=ans_a*ans_b;

	return ans;
}
int main()
{
	Ld p,q;
	int n,k;
	scanf("%Lf %Lf %d %d",&p,&q,&n,&k);
	getchar();

	printf("The probability that A wins exactly k games is : %Lf\n",get_answer(p,n,k));
}