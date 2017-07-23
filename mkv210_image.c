
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define BUFSIZE 		(16*1024)
#define IMG_SIZE		(16*1024)
#define SPL_HEADER_SIZE 16
#define SPL_HEADER 	"S5PC110 HEADER"


int main(int argc,char *argv[])
{
	FILE *fp;
	char *Buf,*a;
	int BufLen;
	int nbytes,fileLen;
	unsigned int checksum,count;
	int i;


	if(argc !=3)
	{
		printf("usage:mkbl1 <source file> <destination file>\n");
		return -1;
	}
	
	BufLen = BUFSIZE;
	Buf = (char *)malloc(BufLen);
	
	if(!Buf)
	{
		printf("Alloc buffer failed!\n");
		return -1;
	}

	memset(Buf,0x00,BufLen);

	fp = fopen(argv[1],"rb");
	if(fp == NULL)
	{
		printf("source file open erroe!\n");
		free(Buf);
		return-1;
	}

	fseek(fp, 0L, SEEK_END);
	fileLen = ftell(fp);
	fseek(fp, 0L, SEEK_SET);

	count=  (fileLen<(IMG_SIZE - SPL_HEADER_SIZE))? fileLen:(IMG_SIZE - SPL_HEADER_SIZE);

	memcpy(&Buf[0],  SPL_HEADER, SPL_HEADER_SIZE);
	
	nbytes =fread(Buf + SPL_HEADER_SIZE, 1, count, fp);

	if(nbytes != count )
	{
		printf("source file read error!\n");
		free(Buf);
		fclose(fp);
		return -1;
	}

	fclose(fp);

	a = (char *)(BUFSIZE +SPL_HEADER_SIZE);
	for(i=0 ,checksum =0; i < IMG_SIZE - SPL_HEADER_SIZE ;i++)
		checksum +=(0x000000FF)&*a++;

	a=Buf +8;

	fp =fopen(argv[2], "wb");
	if( fp == NULL )
	{
		printf("destination file open error!\n");
		free(Buf);
		return -1;
	}

	a = Buf;
	nbytes = fwrite(a ,1 ,BufLen, fp);
	if( nbytes != BufLen )
	{
		printf("destination file write error!\n");
		free(Buf);
		fclose(fp);
		return -1;
	}

	free(Buf);
	fclose(fp);

	return 0;
	
}

