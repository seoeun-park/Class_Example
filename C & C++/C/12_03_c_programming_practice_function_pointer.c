#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>


// 연습문제 : 문자열에서 대문자는 소문자로, 소문자는 대문자로 바꾸는 함수를 작성하고
//	이 함수를 사용해 문자열 "Hello World!"의 내용을 바꾸는 프로그램을 작성하라

// 문자열에서 대문자는 소문자로 소문자는 대문자로 바꾸는 함수
// → 매개변수: 변환할 문자열(char *)
// → 반환 값: 없음
void str_conv(char* ptr)
{
	// 인덱스 변수
	int i;

	// 대문자와 소문자와의 차이
	int delta = 'a' - 'A';
	// → 32

	for (i = 0; ptr[i] != 0; i++)
	{
		// 배열 str의 i번째 원소가 대문자인지 확인
		if (ptr[i] >= 'A' && ptr[i] <= 'Z')
			// 대문자롤 소문자로 출력
			ptr[i] += delta;

			// 배열 str의 i번째 원소가 소문자인지 확인
		else if (ptr[i] >= 'a' && ptr[i] <= 'z')
			// 소문자를 대문자로 출력
			ptr[i] -= delta;
	}
}

int main () {

	// 문자열에서 저장할 배열
	char str[81] = "Hello World!";

	// 출력
	printf("str = \"%s\"\n", str);

	// 문자열에서 대문자는 소문자로, 소문자는 대문자로 바꾸는 함수 호출
	str_conv(str);

	// 출력
	printf("str = \"%s\"\n", str);

	return 0;
}


