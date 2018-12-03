#include<stdio.h>
#include<stdlib.h>
#include "colors.h"

main()
{
    system("clear");
	printf(ANSI_RED);
	printf("This is red.");
	printf(ANSI_CLEAR);
	printf(" But not this. \n");
	printf(ANSI_BLUE "This is Blue. \n" ANSI_CLEAR);
}
