#include <stdio.h>

// 내가 한 풀이
/*
struct point
{
	// 멤버 변수(member variable)
	int width;
	int height;
};

// typedef 함수
typedef struct point POINT;

// 구조체 point의 변수를 출력하는 함수
// 매개 변수: 구조체 변수(struct point)
// 반환 값: width * height

int rec_area(POINT p)
// struct point p = pos;
{

	return p.width * p.height;

}

int main() {

	// 구조체 변수(structure variable) 선언
	struct point pos, pos2;

	pos.width = 25;
	pos2.height = 35;

	// 출력
	printf("area of rectangle = %d\n", rect_area(pos));

	return 0;
}
*/

//---------------------------------------------------------------------------
/*
// 수업시간에 한 풀이

// 구조체(structure)
// → 특정 대상을 표현하는 여러 값들을 묵어놓은 자료형

// 직사각형을 표현하는 구조체
typedef struct _rect
{
	// 멤버 변수(member variable)
	// → 구조체에서 각각의 값을 저장하기 위한 변수
	int width;
	int height;
} rect;

// 직사각형의 넓이를 구하는 함수
// 매개 변수: 직사각형을 표현하는 구조체 rect 변수(struct_rect)
// 반환 값: 직사각형의 넓이(width * height) → int

int rect_area(rect r)
{

	return r.width * r.height;

}

int main() {

	// 구조체 변수(structure variable) 선언과 초기화
	rect obj = { 25, 35 };
	// struct _rect obj = { 25, 35 };


	// 출력
	// 멤버 접근 연산자(.)
	printf("area of the rectangle = %d\n", obj.width * obj.height);
	printf("area of the rectangle = %d\n", rect_area(obj));

	return 0;
}
*/

