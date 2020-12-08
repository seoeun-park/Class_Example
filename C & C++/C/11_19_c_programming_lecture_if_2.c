#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main () {

	// if 조건문------------------------------------------------

	//연습문제(1): 사용자에게 정수를 입력받아 그 정수가 3의 배수인지 확인하는 프로그램을 작성하라

	// 3의 배수: 3으로나누어 떨어지는 수
	// 3으로 나누었을 때 나머지가 0인 수
	// num % 3 == 0
	// !(num % 3)
	// → 부정 연산자 안에 들어가는 조건식은 오로지 true아님 false의 결과값만 가진다
	// → 사실상 false는 0, true는 0이 아닌 수를 결과 값으로 가진다.

	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	if (num % 3 == 0)
		printf("%d is a multiple of 3.\n", num);

	return 0;
}
*/

//----------------------------------------------------------------------------
/*
int main () {
	// if-else 조건문

	//연습문제 (2): 사용자에게 정수를 입력받아 그 정수가 짝수인 지
	//	홀수인 지 확인하는 프로그램을 작성하라

	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	if (num % 2 == 0)
		printf("%d is an even number!\n", num);
	else
		printf("%d is an odd number!\n", num);

	return 0;
		
}
*/

//--------------------------------------------------------------------------
/*
int main () {
	//연습문제 (3): 사용자에게 두 정수를 입력 받아 두 정수 중
	//	큰 수에서 작은 수를 뺀 값을 구하는 프로그램을 작성하라

		int x, y, z;

		printf("Enter two integers: ");
		scanf("%d %d", &x, &y);

		// 방법 (1) → if-else 조건문을 이용한 방법(변수 2개)

		if (x > y)
			printf("%d - %d = %d\n", x, y, x - y);
		else
			printf("%d - %d = %d\n", y, x, y - x);

		// 방법 (2) → if-else 조건문을 이용한 방법(변수 3개)

		z = x - y;

		if (z > 0)
			printf("%d - %d = %d\n", x, y, z);
		else
			printf("%d - %d = %d\n", y, x, -z);

		// 방법 (3) → 조건 연산자를 이용한 방법

		printf("max - min = %d\n", (x > y) ? x - y : y - x);

		return 0;
}
*/

//---------------------------------------------------------------------------
/*
int main () {

	// if-else-if 중첩 조건문

	// 연습문제 (4): 사용자에게 정수를 입력받아 그 숫자가 홀수, 짝수, 0인지 구분하는 프로그램을 작성하라

	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	// if-else-if 구문을 이용해 프로그램을 작성할 때는 검사하는 순서도 중요하다.

	if (num == 0)
		printf("%d is zero.\n", num);
	else if (num % 2 == 0)
		printf("%d is an even number.\n", num);
	else
		printf("%d is an odd number.\n", num);

	
	return 0;
}
*/
