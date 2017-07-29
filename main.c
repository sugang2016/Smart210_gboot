
#define 	GPJ2CON 	(volatile unsigned long *)0xE0200280
#define  	GPJ2DAT 	(volatile unsigned long *)0xE0200284

int main(void)
{
	*(GPJ2CON) = 0x00001111;
	*(GPJ2DAT) = 0x0;
	
	return 0;
}


