#include <stdio.h>
#include <string.h>

/*
// 연습문제: 배열에 문자열을 복사하는 함수를 작성하고, 그 함수를 이용해 배열에 
// "Hello World"를 저장하는 프로그램 작성


// 문자열을 복사해주는 함수
// 매개변수 1: 문자열을 저장할 저장 공간의 주소 (즉 포인터 char *)
// 매개변수 2: 복사할 문자열(const char *) 
//				→ 이 매개변수에 전달할 문자열은 읽기만 할 것이므로 매개변수를 상수로 만드는 것이 좋다.
//				  또한 이 매개변수에 문자열 상수가 전달될 수도 있기 때문에 상수로 선언해야 한다.
// 반환 값: 없음
void str_copy(char *buffer, const char *string)
{
	// 인덱스 변수 선언
	int i;

	// 배열에서 문자열 복사
	// → 이미 선언되어 있는 배열에 문자열을 저장하기 위해서는 배열의 각 원소에 한 글자씩
	//	 복사할 수밖에 없다
	for (i = 0; string[i] != 0; i++)
		buffer[i] = string[i];
}

int main() {

	// 문자열을 저장할 배열 선언
	// → 배열을 선언하면 배열의 크기만큼 저장 공간을 할당 받는다
	//   이 저장 공간은 프로그램에서 임의의 값을 저장할 수 있다.
	char str[81] = { 0 };

	// 문자열 상수는 값을 바꿀 수 없는 상수이다,
	// 따라서 문자열 상수가 저장된 저장 공간의 주소를 저장할 포인터는 const 키워드를 붙여서
	// 선언해서 상수로 만들어 둔다
	// 포인터를 상수로 선언하면 포인터가 가리키는 저장공간에 저장된 값을 바꿀 수 있다.
	// const char *ptr = "Hello World!";

	// 정의해놓은 함수 str_copy를 이용해서 문자열을 배열 str에 복사
	str_copy(str, "Hello World!");

	// 출력
	// printf("ptr = \"%s\"\n", ptr);
	printf("str = \"%s\"\n", str);


	return 0;
}
*/

//---------------------------------------------------------------------------------
/*
int main () {

	char str[81] = { 0 };

	// 문자열을 복사해주는 함수 (#include <string.h>)
	// 매개변수 1: char *
	// 매개변수 2: const char *
	// 반환 값: i (따라서 strcpy 함수의 자료형은 int)
	// int strcpy(char *buffer, const char *string)

	// int strncpy(char *buffer, const char *string, int length)
	strcpy(str, "Hello World!");
	strncpy(str, "Hello World!", 80);

	// 출력
	printf("str = \"%s\"\n", str);

	return 0;
}
*/

//---------------------------------------------------------------------------
/*
int main() {

	// 2차원 배열 선언
	// → 배열의 배열
	// → 첫 번째 인덱스는 배열의 개수, 두 번째 인덱스는 각 배열에서 원소의 개수
	int table[3][4] = {
		{1, 2, 3, 4},		// 첫 번째 배열
		{5, 6, 7, 8},		// 두 번째 배열
		{9, 10, 11, 12}		// 세 번째 배열
	};

	// 2차원 배열에 포함된 배열의 개수 = 행렬에서 행으로 표현
	int rows = sizeof(table) / sizeof(table[0]);
	// 48 / 16 = 3;

	// 2차원 배열에 포함된 원소의 개수 = 행렬에서 열로 표현
	int colums = sizeof(table[0]) / sizeof(int);
	// 16 / 4 = 4;

	// 인덱스 변수 
	int i, j;


	// 배열에 할당 받은 저장 공간의 표시
	printf("sizeof(table) = %d\n", sizeof(table));
	// → 48(12 * 4바이트)

	printf("sizeof(table[0]) = %d\n", sizeof(table[0]));
	// → 첫 번째 배열
	// → 16(4 * 4바이트)

	// 출력
	// printf("%3d", table[0][0]);
	// printf("%3d", table[0][1]);
	// printf("%3d", table[0][2]);
	// printf("%3d", table[0][3]);
	// printf("\n");

	// printf("%3d", table[1][0]);
	// printf("%3d", table[1][1]);
	// printf("%3d", table[1][2]);
	// printf("%3d", table[1][3]);
	// printf("\n");

	// printf("%3d", table[2][0]);
	// printf("%3d", table[2][1]);
	// printf("%3d", table[2][2]);
	// printf("%3d", table[2][3]);
	// printf("\n");

	// 2차원 배열의 모든 원소에 순차적으로 접근하기 위해 중첩 반복문을 사용한다.
	// 바깥쪽 반복문은 행을 표현하고 안쪽 반복문은 열을 표현한다.
	for (i = 0; i < rows; i++)
	{
		for (j = 0; j < colums; j++)
			printf("%3d", table[i][j]);

		printf("\n");
	}

	return 0;
}
*/
