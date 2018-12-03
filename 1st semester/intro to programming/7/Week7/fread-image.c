#include<stdio.h>

int main()
{
    char RGB[4];
    char header[55];
    FILE *ptr,*ptr2;

    printf("\n *** Program to read and copy an image file *** \n");

    if ((ptr=fopen(".bmp","rb"))==NULL)
        {printf("Error in opening file"); return 0;}
    ptr2=fopen(".bmp","wb");

    fread(header,54,1,ptr);
    fwrite(header,54,1,ptr2);

    while (!feof(ptr))
    {
        if (fread(RGB,3,1,ptr)==0) break;
        fwrite(RGB,3,1,ptr2);
    }

    printf("\n File copied succesfully! \n");

    fclose(ptr2);
    fclose(ptr);
    printf("\n");
}
