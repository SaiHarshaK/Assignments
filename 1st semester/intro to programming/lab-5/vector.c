void vectorRead(float *num,unsigned int dimension)
{
	printf("Enter the values of the vector in order\n");
	for(int i=0;i<dimension;i++)
		scanf("%f",&num[i]);
}
void vectorPrint(float num[],unsigned int dimension)
{
	printf("The entered values are:");
	for(int i=0;i<dimension;i++)
		{
			if(i%5==0)
				printf("\n");
			printf("%f ",num[i]);
		}
}
double vectorLength(float num[],unsigned int dimension)
{
	double ans=0;
	for(int i=0;i<dimension;i++)
		ans+=(num[i]*num[i]);

	return sqrt(ans);
}
double vectorDotProduct(float num1[],float num2[],unsigned int dimension)
{
	double ans=0;
	for(int i=0;i<dimension;i++)
		ans+=(num1[i]*num2[i]);

	return ans;
}