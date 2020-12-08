#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main() {

	// 연습문제(1): 1부터 100까지의 모든 정수 중에 짝수를 출력하라

	int i;

	// 반복문을 이용해 2부터 100보다 작거나 같은 동안 2씩 증가시키면서 출력
	for (i = 2; i <= 100; i += 2)
		printf("%d\n", i);

	printf("\n");

	// 반복문을 이용해 1부터 100보다 작거나 같은 동안 1씩 증가시키면서 짝인지 확인해서 출력
	for (i = 1; i <= 100; i++)
		if ( !(i % 2) )
			printf("%d\n", i);

	// 반복문을이용해 1부터 50보다 작거나 같은 동안 1씩 증가시키면서 2배 큰 값을 출력
	for (i = 1; i <= 50; i++)
		printf("%d\n", i * 2);

	return 0;
}
*/

//------------------------------------------------------------
/*
int main() {

	// 연습문제(2) : 사용자가 입력한 정수만큼 "Hello World!"를 출력

	int num;
	int i;

	printf("Enter an integer: ");
	scanf("%d", &num);

	for (i = 1; i <= num; i++) // i = 1, 2, 3
		printf("Hello World!\n");

	for (i = 0; i < num; i++) // i = 0, 1, 2
		printf("Hello World!\n");

	return 0;
}
*/

//--------------------------------------------------------------
/*
int main () {
	// 연습문제(3) : 1부터 100가지 더한 값을 for 구문을 이용하여 출력
	
	int i;

	// 누적해서 합계를 저장하는 변수는 반드시 0으로 초기화 한다
	// 누적해서 곱한 값을 저장하는 변수는 반드시 1로 초기화 한다
	int sum = 0;

	// sum = 1 + 2 + 3 + 4 + ... + 99 + 100;

	// sum = 0;
	// sum = sum + 1;
	// sum = sum + 2;
	// sum = sum + 3;
	// ...
	// sum = sum + 99;
	// sum = sum + 100;

	// 반복문을 이용해 1부터 100보다 작거나 같은 동안 1씩 증가해가면서 그 값을 변수 num에 누적해서 더한다
	 for (i = 1; i <= 100; i++)
		sum += i; // sum = sum + i

	printf("sum = %d\n", sum);
	
	//---------------------------------------------
	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	int sum = ((1 + num) * num) / 2;

	printf("sum = %d\n", sum);

	return 0;
	
}
*/

//--------------------------------------------------------------
/*
int main () {
	// 연습문제(4) : 1부터 1000까지의 정수 중에서 7의 배수들의 합을 구하는 프로그램을 작성하라

	int i;

	int sum = 0;

	for (i = 1; i <= 1000; i++)
		if (i % 7 == 0)
			sum += i;

	printf("7의 배수들의 합 = %d\n", sum);

	
	return 0;
}
*/

//-------------------------------------------------------
/*
int main () {
	// 연습문제(5) : 사용자에게 정수 2개를 입력 받아 그 두 정수 사이에 있는 정수들의 합계를 구하는 프로그램을 작성하라

	// 방법 (1)
	int i, x, y;

	int sum = 0;

	printf("Enter two integers: ");
	scanf("%d %d", &x, &y);

	if (x > y)
		for (i = y; i <= x; i++)
			sum += i;
	else
		for (i = x; i <= y; i++)
			sum += i;

	printf("sum = %d\n", sum);

	// 방법 (2)

	int i, x, y;


	// 사용자가 입력할 두 값 중에 작은 값과 큰 값을 저장할 변수 이용
	int min, max;

	printf("Enter two integers: ");
	scanf("%d %d", &x, &y);

	min = (x < y) ? x : y;
	max = (x > y) ? x : y;

	for (sum = 0, i = min; i <= max; i++)
		sum += i;

	printf("sum = %d\n", sum);
	

	return 0;
}
*/
