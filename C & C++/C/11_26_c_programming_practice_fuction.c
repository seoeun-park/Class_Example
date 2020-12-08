#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
// 내가 한 풀이
// 연습문제 : 주어진 반지름을 이용해 원의 넓이를 구하는 함수를 작성하고,
//			  이 함수를 이용해 반지름이 17인 원의 넓이를 구해 출력하는 프로그램을 작성하라

// 함수의 선언
double area_circle();

int main() {
	double area;

	area = area_circle(17);

	// 함수의 호출
	printf("area of circle = %.3f\n", area);
	 
	return 0;
}

// 함수의 정의
double area_circle(int radius) {

	const double PI = 3.141592;

	return PI * radius * radius;
}
*/

//-----------------------------------------------------------------------------------
/*
// 수업시간에 한 풀이

// 연습문제 : 주어진 반지름을 이용해 원의 넓이를 구하는 함수를 작성하고,
//			  이 함수를 이용해 반지름이 17인 원의 넓이를 구해 출력하는 프로그램을 작성하라

// 함수의 선언
double area_circle(int radius);

int main() {


	// 함수의 호출
	printf("area of circle = %.3f\n", area_circle(17));


	return 0;
}

// 함수의 정의

// 매개 변수: 반지름(int, double)
// → 매개 변수는 함수가 호출되면 선언되며, 인자로 주어진 값으로 초기화 된다

// 반환 값: 원의 넓이(double)
double area_circle(int radius)
// double radius = 17;
{
	// 이러한 상수는 매크로 상수로 치환할 수 있다.
	// 매크로 상수와의 차이점 → 매크로 상수와 달리 저장공간이 할당이 됨
	const double Pi = 3.141592;

	return Pi * radius * radius;
}
*/