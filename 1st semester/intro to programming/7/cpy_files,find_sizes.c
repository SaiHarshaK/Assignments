#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
void copy_files_txt(char file1[])
{
   char cpy_file[50];
   FILE *source, *duplicate;
 
   source = fopen(file1, "r");
   printf("Opening file - %s\n",file1);
   if( source == NULL )
   {
      printf("File does not exist...\n");
      return;
   }
 
   printf("Enter name of the duplicate file\n");
   fgets(cpy_file,50,stdin);
   cpy_file[strlen(cpy_file) - 1] ='\0';
   strcat(cpy_file,".txt");
   printf("%s\n",cpy_file );
 
   duplicate = fopen(cpy_file, "w");
 
   char line[1000000];
   while(!feof(source) )
      {
         fgets(line,sizeof(line),source);
         fprintf(duplicate,"%s",line);
      }
 
   printf("File copied successfully :)\n");
 
   fclose(source);
   fclose(duplicate);
}

void copy_files_bmp(char file1[])
{
   char cpy_file[50];
   FILE *source, *duplicate;
 
   source = fopen(file1, "rb");
   printf("Opening file - %s\n",file1);
   if( source == NULL )
   {
      printf("File does not exist...\n");
      return;
   }
 
   printf("Enter name of the duplicate file\n");
   fgets(cpy_file,50,stdin);
   cpy_file[strlen(cpy_file) - 1] ='\0';
   strcat(cpy_file,".bmp");
   printf("%s\n",cpy_file );
 
   duplicate = fopen(cpy_file, "wb");
 
 
   char header[55];
   fread(header,54,1,source);
   fwrite(header,54,1,duplicate);


    char RGB[4];
    while (!feof(source))
    {
        if (fread(RGB,3,1,source)==0) break; //rgb is the block of size 3 to be copied, '1' here is the sizeof(char)...
        fwrite(RGB,3,1,duplicate);
    }
 
   printf("File copied successfully :)\n");
 
   fclose(source);
   fclose(duplicate);
}

void print_file(char file1[])
{
   FILE *source;
   char ch;
   source = fopen(file1, "r");
   printf("Opening file - %s\n",file1);
   if( source == NULL )
   {
      printf("File does not exist...\n");
      return;
   }

    while( ( ch = fgetc(source) ) != EOF )
      printf("%c",ch);

   printf("End of the file\n");
   fclose(source);
   return ;
}



void printf_file_size(char file1[])
{
   FILE *source;
   source = fopen(file1, "r");
   printf("Opening file - %s\n",file1);
   if( source == NULL )
   {
      printf("File does not exist...\n");
      return;
   }

   fseek(source,0,SEEK_END);
   long long int size=ftell(source);
   printf("The size of the file is : %lld\n",size);
   fclose(source);
   return ;
}

void check()
{
   printf("Press Enter to continue...\n");
   while(getchar() != '\n')
      ;  //empty loop  

}
int main()
{
   char file1[50]="capitals.txt",file2[50]="santa.bmp";
   copy_files_txt(file1);
   check();
   system("clear");
   
   copy_files_bmp(file2);
   check();
   system("clear");

   print_file(file1);
   check();
   system("clear");

   printf_file_size(file1);
   check();
   system("clear");

   printf_file_size(file2);

   return 0;
}
