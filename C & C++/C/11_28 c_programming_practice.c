#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// 연습문제(11/28) : 배열에 담긴 각 숫자의 개수를 세어 그 개수만큼
	//	"*"을 찍어 그래프를 그리는 프로그램을 작성하라

	// 배열 선언
	int numbers[] = { 1, 3, 4, 2, 1, 3, 4, 1, 2, 3, 1, 3 };

	// 배열 numbers의 크기
	int length = sizeof(numbers) / sizeof(int);

	// 배열 numbers의 원소들 중에서 1, 2, 3, 4의 개수를 저장할 배열
	int counter[4] = { 0 };

	// 인덱스 변수
	register int i, j;

	for (i = 0; i < length; i++)
		// if (numbers[i] == 1) counter[0]++;
		// if (numbers[i] == 2) counter[1]++;
		// if (numbers[i] == 3) counter[2]++;
		// if (numbers[i] == 4) counter[3]++;
		counter[numbers[i] - 1]++;

	// 출력
	for (i = 0; i < 4; i++)
	{
		// 숫자 출력
		printf("%d ", i + 1);

	// 1, 2, 3, 4의 개수만큼 별 출력
	for (j = 0; j < counter[i]; j++)
		printf("*");

	// 개행
	printf("\n");
	}

	return 0;
}

