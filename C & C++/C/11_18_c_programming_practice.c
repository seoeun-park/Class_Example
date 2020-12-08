#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// 연습문제 : 사용자에게 정수를 입력 받아, 그 정수가 10보다 작거나
	//	40보다 큰 경우 "Hello World!" 문자열을 출력하는 프로그램을 작성하라


	// 정수가 10보다 작다 → num < 10
	// 혹은(OR) → 논리합 연산자 = ||
	// 정수가 40보다 크다 → num > 40

	int num;

	printf("Enter an integers: ");r
	scanf("%d", &num);

	if (num < 10 || num > 40)
		printf("\nHello World!\n");

	return 0;
}
