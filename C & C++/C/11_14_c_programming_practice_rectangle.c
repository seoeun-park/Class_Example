#include <stdio.h>

/* 연습문제(11/14) : 두 변의 길이가 각각 25, 15인 직사각형의 넓이와 둘레를 구하는 프로그램을 작성하라 */

int main() {

	int width = 25;
	int height = 15;

	int area, perimeter;

	area = width * height;

	perimeter = (width + height) * 2;

	printf("area of rectangle = %d\n", area);
	printf("perimeter of rectangle = %d\n", perimeter);
	
	return 0;
}
