#include<stdio.h>

// Function declarations

float sum(float, float);
int stringLength(char []);
float maxList(float [],int,int);
void multiPrint(char [],int);


int main()
{
    char string[20]="Applesauce";
    float numbers[10]={4.0,1.6,2.7,5.5,2.0,3.0};
    printf("%0.2f",sum(5.5,3.3));
    printf("\n Length is %d",stringLength(string));
    printf("\n Max is %f",maxList(numbers,0,2));
    multiPrint("Beep",10);
}

// Function definitions
float sum(float a,float b)
{
    float c;
    c=a+b;
    return c;
}

int stringLength(char text[])
{
    int i;
    i=0;
    while (text[i]!='\0')
    {
        i=i+1;
    }
    return i;
}

float maxList(float list[],int left,int right)
{
    float max;
    int i;
    i=left;
    max=list[left];
    while (i<=right)
    {
        if (list[i]>max){max=list[i];}
        i=i+1;
    }
    return max;
}

void multiPrint(char text[],int count)
{
    int i=1;
    printf("\n");
    while (i<=count){
        printf(" %s",text);
        i=i+1;
    }
}

