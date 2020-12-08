#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
// 매크로(macro)
// → 컴파일 되기 전에 전처리기에 의해 지정한 값으로 치환
// 실제로 저장공간이 할당되지 않음

// 매크로 상수 정의
#define PI 3.14
// 매크로 상수는 대문자로 작성하는 것이 관례이다
// 전처리기에서 컴파일하기 전에 대입한 값을 먼저 치환한 다음 컴파일한다

#define TRUE 1
#define FALSE 0

#define HELLO printf("Hello World!\n")

int main() {
	
	HELLO;
	// → printf("Hello World!");

	return 0;
}
*/

//---------------------------------------------------------------------------------------
/*
// 연습문제 (2): 주어진 두 정수의 평균을 구하는 함수를 작성하고 사용자에게 정수 2개를 입력받은후
//				 작성한 함수를 이용해 평균을 구해 출력하는 프로그램을 작성하라
double average(int x, int y);

int main() {
	int num1, num2;

	printf("Enter two integers: ");
	scanf("%d %d", &num1, &num2);

	
	printf("average = %.2f\n", average(num1, num2));

	return 0;
}

double average(int x, int y) {

	return (double)(x + y) / 2;
}
*/

/*
//--------------------------------------------------------------------------------
// 전역변수는 안쓰면 안쓸수록 좋은 변수이다.
// 전역변수와 지역변수의 이름이 충돌할 경우 지역변수가 우선한다.
void count() {

	// 지역변수
	int cnt = 0;
	// 정적변수 → static int cnt = 0;

	cnt++;

	printf("count = %d\n", cnt);
}

int main() {

	count(); // 지역변수일 경우	   // 정적변수일 경우
	count();	//	count = 1		count = 1
	count();	//	count = 1		count = 2
	count();	//	count = 1		count = 3
	count();	//	count = 1		count = 4
	count();	//	count = 1		count = 5

	return 0;
}
*/