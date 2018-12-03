#include<stdio.h>
int main()
{
	printf("How can you throw an egg as hard as you can and have it come straight back to you without breaking first?\n");
	printf("need options? press 1\n");
	int x;
	scanf("%d",&x);
	if(x==1)
	{
		yolo:
		printf("A) Thats impossible\tB)Throw it up straight in the air\nC)Bounce it off a wall\tD)umm..eat it?\n");
		char a;
		scanf("%c",&a);
		getchar();
	switch(a)
	{
		case 'a':
		case 'A':
		case 'c':
		case 'C':
		case 'D':
		case 'd':
		printf("wrong :(");
		break;

		case 'b':
		case 'B':
		printf("Correct :)");
		break;
	}
if(a=='c'||a=='C')
return 0;
	printf("\nTry again? press y\n");
	scanf("%c",&a);
	scanf("%c",&a);
	if(a=='y'||a=='Y')
		goto yolo;
	}
	else return 0;
	return 0;
}
