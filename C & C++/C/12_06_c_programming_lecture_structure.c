#include <stdio.h>
/*
int main() {

	// 2차원 배열 선언
	int numbers[3][4] = {
		{1, 2, 3, 4},
		{5, 6, 7, 8},
		{9, 10, 11, 12}
	};

	// 배열 numbers는 배열 numbers가 할당 받는 저장 공간의 시작 주소를 나타내는 포인터이다.

	// 포인터의 자료형은 포인터가 가리키는 저장 공간에 저장되어 있는 값의 자료형을 의미한다.
	// 포인터 연산은 이 자료형의 크기에 의해 결정된다

	numbers[0][0];		// 자료형 int

	numbers[0];			// 자료형 int* → 2차원 배열 numbers의 첫 번째 배열

	numbers[0] + 1; // 첫번째 배열의 2번째 원소가 저장되어 있는 저장공간의 주소

	*(numbers[0] + 1)
	== numbers[0][1];

	numbers;			// 자료형 int** → 이중 포인터
						// 자세히 말하면 이 자료형은 int**이 아니라 int[4] *
						// 실제로 존재하지 않는 자료형

	numbers + 1; // 두번째 배열이 저장되어 있는 저장공간의 시작주소 (int형의 4칸만큼 이동)
	*(numbers + 1)
		== numbers[1];

//-----------------------------------------------------------------------
	int *ptr1 = numbers[0];
	int *ptr2 = numbers; // 둘 다 독같은 주소를 나타냄

	ptr2 + 1;		// numbers[0][1]의 시작 주소를 나타냄
	*(ptr2 + 1)
		== numbers[0][1];

	int *ptr[4];
	// 배열 ptr은 (int *) 자료형의 배열이다
	// 즉  각 원소는 int 자료형 포인터가 된다. → 포인터들을 담은 포인터 배열

	int(*ptr2)[4] = numbers;
	// 포인터 ptr2는 int[4]이라는 자료형을 가진다
	// 즉 이때의 각 원소는 배열 그 자체 → 배열을 가리키는 배열 포인터
	// 따라서 포인터 산술 연산을 할때 한칸의 크기는 int 자료형 네 칸만큼의 크기가 된다

	ptr2 + 1;		// numbers[1]의 시작 주소를 나타냄

	*(ptr2 + 1)
		== numbers[1]
		== ptr2[1];

	return 0;
}
*/

//------------------------------------------------------------------------------
/*
int main() {

	// 배열
	// → 같은 유형의 여러 값들을 저장하기 위해 사용

	// 포인터 배열(pointer array)
	// → 포인터들의 배열
	//	 즉, 배열의 각 원소가 포인터인 배열
	// → 포인터 배열은 문자열 상수들을 묶어서 저장하기 위해 사용하는 경우가 많다

	// 문자열 상수(string constant)
	// → 문자열이 저장된 저장 공간의 시작 주소를 가리키는 포인터(const char *)]

	char *names[3] = {"a", "b", "c" };
	// 배열 names의 각원소의 자료형은 (char *)이다
	// → 따라서 배열 names의 자료형은 (char **)이다

	int i;

	char **ptr = names;

	for (i = 0; i < 3; i++)
		printf("names[%d] = %s\n", i, names[i]);

	return 0;
}
*/

//---------------------------------------------------------------------------
/*
// 구조체(structure)
// → 특정 대상을 표현하는 여러 값들을 저장하기 위해 사용
// → 배열은 같은 유형의 여러값들을 저장하기 위해 사용
// → 구조체는 다른 유형의 값들을 묶어두기 위해서 사용
// → struct 키워드를 사용해서 기존 자료형들을 묶어서 새로운 자료형을 정의

// 좌표 평면에서 점을 표현하는 구조체
// → 자료형 정의 (struct point는 int, double과 같이 자료형의 종류 중의 하나)
struct point
{
	// 멤버 변수(member variable)
	// → 구조체에서 실제 값을 저장하기 위한 저장 공간
	int x;
	int y;
};

// typedef 함수
// → 기존 자료형을 새로운 이름의 자료형으로 정의
typedef unsigned int size_t;
typedef unsigned int UNINT;
typedef unsigned char BYTE;

typedef struct point POINT;

// 구조체 point의 변수를 출력하는 함수
// 매개 변수: 구조체 변수(struct point)
// → 멤버 변수(x) 다른 유형의 값일 뿐만 아니라 여러 개수일 경우에 구조체를 쓰기 때문에
// 반환 값: 없음(void)

//void print_point(struct point p)
void print_point(POINT p)
// struct point p = pos;
{
	printf("pos = [%d, %d]\n", p.x, p.y);

}

int main() {

	// 구조체 변수(structure variable) 선언
	// → 구조체를 정의하는 것은 새로운 자료형을 정의하는 것이고 실제 값을 저장하기 위해서는
	//	 변수를 선언해야 한다.
	struct point pos, pos2;

	// 구조체 변수를 선언할 때 중괄호를 이용해 멤버 변수의 값을 초기화할 수 있다.
	// 이때 중괄호 안에 나열한 값들은 구조체를 선언할때 나열했던 멤버 변수의 순서대로 대입된다
	struct point pos3 = { 4, 2 };
	// POINT pos3 = { 4, 2 };

	// 구조체 포인터
	struct point *ptr = &pos;

	// 구조체 배열
	// struct point array[3] = { {1, 2}, {3, 4}, {5, 6} };
	POINT array[3] = { {1, 2}, {3, 4}, {5, 6} };

	// 구조체 변수는 저장 공간일 뿐 실제로 값을 저장하는 변수는 구조체의 멤버 변수이다.
	// 구조체 변수는 구조체 변수에 포함된 멤버 변수들을 묶어주는 역할을 한다
	// 실제 값은 구조체 변수 pos의 멤버 변수에 저장된다.
	// 따라서 구조체 변수 pos에 값을 저장하기 위해서는 구조체 변수 pos의 멤버 변수에 접근해야 한다.
	// 이때 멤버 접근 연산자(.)을 이용한다.
	pos.x = 3;
	pos.y = 5;

	// 출력
	printf("sizeof(pos) = %d\n", sizeof(pos));
	printf("sizeof(struct point) = %d\n", sizeof(struct point));
	
	// printf("pos = [%d, %d]\n", pos.x, pos.y);

	// 함수 호출
	print_pos(pos);

	// 구조체 변수에 구조체 변수를 대입할 수 있다.
	// 구조체 변수에 구조체 변수를 대입할 때는 멤버 변수들의 값이 각각의 멤버 변수에 대입된다.
	// 이를 "멤버 대 멤버 복사"라고 한다.
	pos2 = pos;
	// pos2.x = pos.x
	// pos2.y = pos.y

	pos2.x = 7;

	return 0;
}
*/