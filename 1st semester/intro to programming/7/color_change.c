#include<stdio.h>
#include<string.h>
#include<stdlib.h>

void color_red_to_blue(char file_name[])
{
	FILE *source,*destination;
	if((source=fopen(file_name,"rb"))==NULL)
	{
		printf("file does not exist\n");
		exit(EXIT_FAILURE);
	}
	destination=fopen("santa_change.bmp","wb");
	printf("File opened\n");
	char header[55];
	fread(header,54,1,source);
	fwrite(header,54,1,destination);

	unsigned char RGB[4];
	
	while(!feof(source))
	{
		if(fread(RGB,3,1,source)==0)
			break;

		if(RGB[0]<200 && RGB[1]<200 && RGB[2]>0)
			{
				RGB[1]=0;
				RGB[2]=0;
				RGB[0]=100;
		}
		fwrite(RGB,3,1,destination);
		
	}

	printf("File succesfully saved\n");
	fclose(source);
}

int main()
{
	char file_name[50];
	printf("Enter the file name of the bmp\n");
	fgets(file_name,sizeof(file_name),stdin);
	file_name[strlen(file_name)-1]='\0';

	//then how does this work?   sscanf(file_name,"%s.bmp",file_name);
	strcat(file_name,".bmp");
	color_red_to_blue(file_name);

}
