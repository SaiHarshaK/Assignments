#include <stdio.h>

int main() {
	int x, y;
	scanf("%d", &x);
	if(x > 5)
		y = x + 1;
	else
		y = x;
	printf("%d\n", x+y);
	return 0;
	
}
