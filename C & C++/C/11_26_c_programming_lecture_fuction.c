#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <math.h> // 수학과 관련된 기능을 담고 있음  → 제곱근을 구하는 함수(sqrt)를 사용하기 위해 씀

/*
// 함수의 선언 : 컴파일러에게 함수를 호출하기 위해 필요한 정보
//				(반환값의 자료형 , 함수의 이름, 매개변수의 목록)를 컴파일러에게 전달하기 위해 사용
// → 원형부분만 남겨놓고 선언한다.
void hello();

// c 프로그램에서는 무조건 main 함수부터 실행한다.
int main() {

	// 함수의 호출(call)
	// ()는 함수의 호출 연산자
	hello();

	//...
	//...
	//...

	// 함수의 호출(call)
	hello();


	return 0;
}
// "Hello World!"를 출력하는 함수
// 함수의 정의 : 함수의 기능 작성
// main 함수위에 해당 함수가 선언되어 있다면 정의는 main 함수 아래에서 이루어져도 무방하다.

// void 자료형 
// → 특별한 자료형으로 함수에서는 함수의 반환 값이 없는 경우 반환 값의 자료형으로 지정한다
// → void 자료형을 사용하는 2가지의 경우 → 1. 함수의 반환값이 없는 경우 2. 포인터의 자료형을 지정하지 않기 위해서
void hello() {

	printf("Hello World!\n");

}
*/

/*
//----------------------------------------------------------------------------------------
// 연습문제: "Show me the money!" 문자열을 표준 출력에 출력하는 함수와 "Boys, be ambitious!"
//	문자열을 표준 출력에 출력하는 함수를 작성하고 이 함수를 호출에 출력하는 프로그램을 작성하라

// 함수의 선언 → 함수의 선언 없이 함수의 정의가 호출 후에 정의되어 있다면 호출이 정상적으로 되지 않음
void say_money();
void say_ambitious();

int main() {

	// 함수의 호출
	say_money();
	say_ambitious();

	// return 0;은 운영 체제로 반환값을 되돌려준다
	// return;는 반환값이 없다는 의미이므로 자료형이 반드시 void여야 한다.
	// 매개변수는 여러개를 지정할 수 있지만 반환값은 오로지 하나만 지정할 수 있다.
	return 0;
}

// 함수의 정의
void say_money() {
	printf("Show me the money!\n");
}
void say_ambitious() {
	printf("Boys, be ambitious!\n");
}
*/