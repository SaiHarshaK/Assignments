#include<stdio.h>

int main()
{
    unsigned char RGB[4];
    char header[55];
    FILE *ptr,*ptr2;

    printf("\n *** Program to read and copy an image file with color changes *** \n");

    if ((ptr=fopen("santa.bmp","rb"))==NULL)
        {printf("Error in opening file"); return 0;}
    ptr2=fopen("santa2.bmp","wb");

    fread(header,54,1,ptr);
    fwrite(header,54,1,ptr2);

    while (!feof(ptr))
    {
        if (fread(RGB,3,1,ptr)==0) break;
        if (RGB[2]>50 && RGB[0]<50 && RGB[1]<50)
        {
            RGB[1]=200;RGB[0]=0;
            RGB[2]=0;
        }
        fwrite(RGB,3,1,ptr2);
    }

    printf("\n File copied succesfully! \n");

    fclose(ptr2);
    fclose(ptr);
    printf("\n");
}
