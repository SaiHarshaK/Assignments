#include<stdio.h>


int mid,answer;
int binary_search(int lo, int hi, int x,int k)
{
    
    if (lo > hi)
    {
        return ;  //i'll know where to stop.
    }

    mid = (lo + hi) / 2;

    long long check=1;
    for(int i=1;i<=k;i++)
    	check*=mid;
   
    if (check > x)
    {
        binary_search(lo, mid - 1, x, k); // i should not equate it to answer cuz i dont care about (mid^k) which are greater than x
    }
    else if (check <= x)
    {
        answer=mid;
        binary_search(mid + 1, hi, x, k);
    }

return answer;
}


int main()
{
	int x,k;
    int ans;
	scanf("%d %d",&x,&k);

	ans=binary_search(0,1000,x,k);
	printf("answer is : %d\n",ans );

	return 0;
}
