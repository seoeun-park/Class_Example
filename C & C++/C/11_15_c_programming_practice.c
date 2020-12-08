#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	//연습문제 : 사용자에게 원의 반지름을 입력 받아 원의 넓이를 구하고
	// 아래와 같이 출력되는 프로그램을 작성하라

	// Enter a radius: 2

	//pi = 3.141592
	// radius of the circle = 2
	// area of the circle = 12.566


	// 사용자가 입력하는 원의 반지름을 저장할 변수
	int radius;

	// 원주율
	// 상수(constant) : 변하지 않는 값을 나타낸다
	const double PI = 3.141592;

	//원의 넓이를 계산해서 저장할 변수
	double area;

	// 사용자에게 원의 반지름 입력
	printf("Enter a radius of the circle: ");

	scanf("%d", &radius);

	//원의 넓이 계산
	area = PI * radius * radius;

		//출력
	printf("\n");
	printf("pi = %.6f\n", PI);
	printf("radius of the circle = %d\n", radius);
	printf("area of the circle = %.3f\n", area);

	return 0;
}