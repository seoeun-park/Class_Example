#include <stdio.h>
/*
int main() {
	// 포인터(pointer): 저장 공간(변수 등)의 주소(address)를 저장하기 위한 변수
	// → 포인터 또한 변수이므로 선언해야 사용할 수 있다.
	//	  포인터를 선언할 때는 포인터 연산자(*)를 사용한다.
	// → 포인터를 이용해 저장 공간(변수 등)에 접근할 수 있다.
	// → 포인터의 자료형은 포인터가 가리키고 있는 저장 공간에 저장되어 있는 값의 자료형을 나타낸다.

	int num = 10;

	// 포인터 선언
	int *numPtr;

	// 참조 연산자(&): 저장 공간의 주소를 구하는 연산자
	// → 참조 연산자의 피연산자는 반드시 저장 공간(변수 등)이어야 한다
	numPtr = &num;

	// %p 서식 지정자: 주소(pointer) 형태로 출력(16진수 형태로 출력)
	printf("numPtr = %p\n", numPtr);
	printf("&num = %p\n", &num);

	// 포인터 연산자(*): 주소에 저장된 값에 접근하기 위한 연산자
	// → 포인터 연산자의 피연산자는 반드시 주소(pointer)이어야 한다.
	printf("%d\n", *numPtr); 
	printf("%d\n", num);
	
	// *numPtr
	// 포인터 numPtr이 가리키고 있는 저장 공간(= 변수 num)에 저장되어 있는 값

	*numPtr = 20;
	// 포인터 numPtr이 가리키고 있는 저장 공간(변수 num)에 20을 대입한다.

	printf("%d\n", *numPtr);
	printf("%d", num);

	return 0;
}
*/

//--------------------------------------------------------------------------------
/*
int main() {

	// 배열(array): 저장 공간들의 집합
	// 배열의 원소(item): 배열의 각각의 저장 공간
	// 배열의 인덱스(index): 배열의 원소에 접근하기 위해 사용하는, 0부터 시작하는 정수
	// 배열의 크기(length): 배열의 원소들의 개수

	// 배열 선언
	int numbers[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
	// 중괄호({})는 여러개의 값을 한꺼번에 초기화 시켜주는 문장을 의미한다.


	// 포인터 선언
	int *ptr;
	char *cptr;
	// 저장 공간의 크기는 둘 다 4바이트 → 자료형과 상관없이 주소는 항상 똑같은 크기를 가진다

	int x = 10;
	int y = 20;

	// 여기서 ptr은 변수이기 때문에 얼마든지 다른 저장공간(변수)를 할당할 수 있다.
	ptr = &x;
	ptr = &y;

	// 배열 numbers는 배열 numbers에 할당된 저장 공간의 시작 주소를 나타내는 포인터이다.
	// → 그러나 일반 포인터와 달리 배열에 할당된 저장 공간의 시작 주소는 바꿀 수 없다.
	//	  배열 numbers에 저장된 주소는 바꿀 수 없다.(상수)
	// → 배열은 값들을 저장하기 위해서 자료형과 배열의 크기만큼 저장 공간을 할당 받는다.

	// 포인터(pointer)
	// 1. 포인터에는 언제든지 새로운 주소를 저장할 수 있다.
	// 2. 포인터는 주소를 저장하기 위한 저장 공간(4바이트)을 할당받는다.

	ptr = numbers;
	// 여기서 ptr과 numbers는 주소를 가리키므로 대입연산자를 통해 대입이 가능하다
	// numbers는 시작 주소를 가리킴

	printf("numbers = %p\n", numbers);
	printf("ptr = %p\n", ptr);

	printf("*numbers = %d\n", *numbers);
	printf("*ptr = %d\n", *ptr);
	printf("numbers[0] = %d\n", numbers[0]);

	// *numbers
	// (배열 numbers가 가리키는 저장 공간)에 저장된 값
	// (배열 numbers에 할당된 저장 공간의 시작 주소가 가리키는 저장 공간)에 저장된 값
	// (배열 number의 첫 번째 원소에 할당된 저장 공간)에 저장된 값

	printf("numbers + 1 = %p\n", numbers + 1);
	printf("ptr + 1 = %p\n", ptr + 1);
	// 배열 numbers의 두 번째 저장 공간의 주소를 나타낸다.

	// 포인터의 산술 연산(ptr +/- n)
	// + 연산: 포인터가 가리키고 있는 주소에서 n칸만큼 앞으로 이동
	// - 연산: 포인터가 가리키고 있는 주소에서 n칸만큼 뒤로 이동
	// → 자료형의 크기가 1칸의 크기를 결정

	printf("*(numbers + 1) = %d\n", *(numbers + 1));

	printf("*(numbers + 3) = %d\n", *(numbers + 3));
	printf("numbers[3] = %d\n", numbers[3]);
	printf("ptr[3] = %d\n", ptr[3]);
	// → printf("ptr[3] = %d\n", *(ptr + 3));
	
	// *(numbers + 1)
	// → (배열 numbers가 가리키는 저장 공간에서 한 칸 이동한 저장 공간)에 저장되어 있는 값
	// → 배열 numbers의 두 번째 원소의 값
	
	// numbers[3]
	// → *(numbers + 3)
	// → (배열 numbers가 가리키는 저장 공간에서 세 칸 이동한 저장 공간)에 저장되어 있는 값
	// → 배열 numbers의 네 번째 원소의 값

	return 0;
}
*/

//-----------------------------------------------------------------------------------------
/*
// 문자열의 길이를 구하는 함수 str_len
// 매개변수: 길이를 구하고자 하는 문자열 배열(char *)
// → 함수가 호출될 때마다 선언되는 변수로서, 함수를 호출할 때 전달하는 값(인자)로 초기화된다.
// 반환 값: 문자열의 길이(int)

int str_len(const char* ptr)
// char *ptr = str;
{
	int length;

	// ptr[0] = 0;
	// → *(ptr + 0) = 0;
	// → *ptr = 0;

	for (length = 0; ptr[length] != 0; length++);

	return length;
}

int main() {

	// 문자열을 저장하기 위해 배열 선언
	char str[81] = "Hello Wolrd!";

	// 문자열의 길이를 저장할 변수
	int length;

	// 문자열의 길이 계산
	for (length = 0; str[length] != 0; length++);

	// 출력
	printf("str = \"%s\"\n", str);
	printf("length = %d\n", length);
	printf("str_len(str) = %d\n", str_len(str));

	return 0;
}
*/


