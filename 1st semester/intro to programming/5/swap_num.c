#include <stdio.h>
	int main()
	{
	  int x, y;
	  printf("Enter the values of x and y\n");
 	  scanf("%d %d",&x,&y);
	  x = x ^ y; 
	  y = x ^ y; 
	  x = x ^ y;
	  printf("After Swapping: x = %d, y = %d", x, y);
	 
	  return 0;
	}