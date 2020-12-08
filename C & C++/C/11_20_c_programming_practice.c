#define _CRT_SECURE_NO_WARINGS
#include <stdio.h>

int main () {

	int i;

	for (i = 2; i <= 100; i += 2)
		printf("%d\n", i);

	printf("\n");
	
	for (i = 1; i <= 100; i++)
		if ( !(i % 2) )
			printf("%d\n", i);
	
	printf("\n");

	for (i = 1; i <= 50; i++)
		printf("%d\n", (i * 2));

	return 0;
}
