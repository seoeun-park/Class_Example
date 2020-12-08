#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// 연습문제(3) : 사용자에게 문자열을 입력 받아, 그 문자열에서 대문자는 소문자로
	//	소문자는 대문자로 출력하는 프로그램을 작성하라

	char str[81];

	int i;

	int delta = 'a' - 'A';
	// → 32

	printf("Enter a string: ");
	scanf("%[^\n]s", str);

	printf("\n");
	printf("str = \"%s\"\n", str);
	printf("cnv = \"");

	for (i = 0; str[i] != 0; i++)

		if (str[i] >= 'A' && str[i] <= 'Z')
			printf("%c", str[i] + delta);
		else if (str[i] >= 'a' && str[i] <= 'z')
			printf("%c", str[i] - delta);
		else
			printf("%c", str[i]);

	printf("\"\n");



	return 0;
}
