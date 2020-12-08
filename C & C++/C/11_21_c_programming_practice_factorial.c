#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main () {

// 내가 한 풀이

	int num, i;
	int factorial = 1;

	printf("Enter an integer: ");
	scanf("%d\n", &num);

	// factorial = 1
	// factorial = 1 * 2	→	factorial = factorial * 2
	// factorial = 1 * 2 * 3	→	factorial = factorial * 3

	for (i = 1; i <= num; i++)
		factorial *= i;

	printf("Factorial %d = %d\n", num, factorial);

	return 0;
}
*/

//-----------------------------------------------------------------------------
/*
int main() {

	// 수업시간에 한 풀이
	// 연습문제(): 사용자에게 정수를 입력하고, 그 정수의 팩토리얼을 구하는 프로그램

	int num, i;
	unsigned long long factorial = 1; //unsigned: 2의 32승의 값을 표현할 수 있음

	// int = long → 4바이트
	// long long → 8바이트

	printf("Enter an integer: ");
	scanf("%d", &num);

	// factorial = 1
	// factorial = 1 * 2	→	factorial = factorial * 2
	// factorial = 1 * 2 * 3	→	factorial = factorial * 3

	for (i = 1; i <= num; i++)
		factorial *= i;

	// factorial의 원래 정의는 
	// 5 factorial = 5 * 4 * 3 * 2 * 1 이므로

	for (i = num; i >= 1; i--)
		factorial *= i;

	printf("\nFactorial %d = %lld\n", num, factorial);


	return 0;
}
*/
