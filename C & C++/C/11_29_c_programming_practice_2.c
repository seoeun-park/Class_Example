#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// 연습문제(2) : 사용자에게 문자열을 입력 받아, 그 문자열을 뒤집어
	//	출력하는 프로그램을 작성하라 / 문자열의 최대 길이는 80자

	char str[81] = { 0 };

	char rev[81] = { 0 };

	int length = 0;

	int i;

	printf("Enter a string: ");
	scanf("%[^\n]s", str);

	for (i = 0; str[length] != 0; length++);

	printf("\n");
	printf("str = \"%s\"\n", str);
	printf("rev = \"");

	for (i = length - 1; i >= 0; i--)
		printf("%c", str[i]);

	printf("\"\n");

	for (i = 0; i < length; i++)
		rev[i] = str[length - i - 1];
		// -1을 하는 이유는? 배열의 인덱스는 0부터 시작하므로
		//배열의 마지막 원소의 인덱스는 length - 1이다.

	printf("rev = \"%s\"\n", rev);

	return 0;
}
