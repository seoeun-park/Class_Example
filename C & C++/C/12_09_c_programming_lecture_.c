#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 매크로 상수(macro constant)
#define LENGTH		10
/*
int main() {

	// 인덱스 변수
	int i;

	// 동적 메모리 할당(dynamic memory allocation)
	// → 프로그램이 실행되는 도중 필요한 메모리를 할당 받는 것

	int *ptr = (int *)malloc(sizeof(int) * LENGTH);
	// → int 자료형의 값을 10개 저장할 수 있도록 메모리를 할당해달라고 요청하고
	//	 메모리가 정상적으로 할당되면 malloc 함수는 (void *) 자료형의 주소를 반환한다,
	//	 이 주소는 할당 받은 메모리의 시작 주소이다.
	//	 하지만 이렇게 할당된 메모리에는 int 자료형의 값을 저장할 것이므로 malloc 함수가
	//	 반환하는 (void *) 자료형의 주소를 (int *)로 형 변환해서
	//	 (int *)자료형의 포인터에 대입한다.
	// → 동적 할당을 통해 할당된 메모리는 연속된 공간에 할당되므로 배열과 같은 방법으로 활용한다.
	// → 동적으로 할당된 메모리는 초기화되어 있지 않는다!

	// 0으로 초기화 하는 방법
	int array[LENGTH] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

	//-----------------------------------------------------------------------
	
	// 반복문을 이용해 동적으로 할당 받은 메모리에 순차적으로 접근
	for (i = 0; i < LENGTH; i++)
	{
		array[i] = 0;
		ptr[i] = 0;
		// *(ptr + i) = 0;
	}


	// 지정한 주소의 메모리(dest)를 지정한 크기(size)만큼 지정한 값(val)으로 설정하는 함수
	// 여기서 size는 byte 단위
	// #include <string.h>
	// void *memset(void *dest, int val, size_t size);
	memset(ptr, 0, sizeof(int) * LENGTH);


	//--------------------------------------------------------------------------
	// 반복문을 이용해 동적으로 할당 받은 메모리에 순차적으로 접근
	for (i = 0; i < LENGTH; i++)
	{
		ptr[i] = array[i];
	}

	// 지정한 주소(src)의 메모리에 저장되어 있는 내용을 지정한 크기(size) 만큼 읽어와서
	// 지정한 주소(dest)에 복사하는 함수
	//#include <string.h>
	// void *memcpy(void *dest, void *src, size_t size);
	memcpy(ptr, array, sizeof(int) * LENGTH);

	// 출력
	for (i = 0; i < LENGTH; i++)
	{
		printf("ptr[%d] = %d\n", i, ptr[i]);
	}


	// 동적으로 할당 받은 저장 공간은는 반드시 해제해야 한다!
	// → 동적으로 할당 받은 저장 공간은 자동으로 해제되지 않고, 반드시
	//	 free 함수를 이용해서 해제해야 한다.
	//	 그리고 동적으로 할당 받은 저장 공간을 해제하지 않고 프로그램을 종료하면,
	//	 그 저장 공간은 더 이상 다른 프로그램에서 사용할 수 없게 된다.
	//	 이를 메모리 누수(memory leak)라고 한다.
	free(ptr);

	return 0;
}
*/


//--------------------------------------------------------------------------------
/*
int main() {

	// 문자열을 저장하기 위한 배열 선언
	char str[81] = "Hello World!";
	// → 문자열 상수 "Hello World!"의 각 문자를 배열 str의 각 원소에 순차적으로 대입한다,

	char *ptr = "Hello World!";
	// → 문자열 상수 "Hello World!"가 저장되어 있는 저장 공간의 시작 주소를 포인터 ptr에 대입한다,

	// 할당 받고자 하는 문자열의 길이 계산
	int length = strlen(ptr);

	// 문자열을 저장하기 위한 메모리 할당
	char *str2 = (char *)malloc(sizeof(char) * (length + 1));

	// 할당 받는 메모리에 문자열 복사
	strcpy(str2, ptr);

	// 출력
	printf("str = %s\n", str);
	printf("ptr = %s\n", ptr);
	printf("str2 = %s\n", str2);

	// 메모리 해제
	free(str2);

	return 0;

}
*/
