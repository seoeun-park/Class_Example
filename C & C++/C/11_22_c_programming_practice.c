#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <limits.h>
/*
int main() {

	// 수업시간에 한 풀이
	// 연습문제 (1) : 사용자에게 숫자 0을 입력할 때까지 정수를 입력받아,
	// 그 숫자들의 최대값과 최소값, 평균을 구하는 프로그램을 작성하라


		// 변수 선언
		int num;

		// 누적해서 더한 값을 저장할 변수는 0으로 초기화한다
		int sum = 0;
		int count = 0;

		// 평균을 저장할 변수 선언
		double average;

		// 최대값과 최소값을 저장할 변수
		// 최대값을 저장하는 변수는 나올 수 있는 값 중에 가장 작은 값으로 초기화
		// 최소값을 저장하는 변수는 나올 수 있는 값 중에 가장 큰 값으로 초기화
		// INT_MAX와 INT_MIN는 limits.h 파일에 정의되어 있는 int 자료형의 값중에
		// 가장 큰 값 또는 가장 작은 값을 나타내는 매크로 상수(macro constant) 이다
		int max = INT_MIN;
		int min = INT_MAX;
		// 	int max = 0;
		//	int min = 0; 으로 초기화 하면 최댓값은 바뀌지만 최솟값은 항상 0이 된다

		do {

			printf("Enter an integers: ");
			scanf("%d", &num);

			if (num != 0)
			{
				// 사용자가 입력한 값들의 합계를 누적해서 더한다
				sum += num;

				// 사용자가 입력한 횟수 증가
				count++;

				// 사용자가 값을 입력할 때마다 변수 max와 min에 저장되어 있는 값과
				// 사용자가 입력한 값을 비교해서 최대값과 최소값을 구한다

				// 변수가 초기화되어 있지 않았을 때 표현식에서 사용하면 오류가 발생한다
				max = (max > num) ? max : num;
				min = (min < num) ? min : num;

			}

			} while (num != 0);

			// 평균 계산
			average = (double)sum / count;

			// 출력
			printf("\n");
			printf("The maximum number : %d\n", max);
			printf("The minimum number : %d\n", min);
			printf("The average : %.1f\n", average);

	return 0;
}
*/

//----------------------------------------------------------
/*
int main() {

	// 내가 한 풀이
	// 연습문제 (2) : 별을 출력해서 직각 삼각형 그리기

	int i, j;

	for (i = 0; i < 9; i++) {
		for (j = 0; j <= i; j++)
			printf("*");
		printf("\n");
	}

	// 수업시간에 한 풀이
	// 연습문제 (2) : 별을 출력해서 직각 삼각형 그리기

	int i, j;

	// 바깥쪽 반복문을 통해서 행(row)을 표현
	for (i = 0; i < 9; i++) {
		// 안쪽 반복문을 통해서 열(column)을 표현
		for (j = 0; j <= i; j++)
			printf("*");
		}
		// 별을 모두 출력한 다음 개행
		printf("\n");


	return 0;

}
*/

//----------------------------------------------------------
/*
int main() {

	// 내가 한 풀이
	// 연습문제 (3) : 별을 출력해서 피라미드 그리기

	int i, j;

	for (i = 0; i < 10; i++) {
		for (j = 0; j < 19; j++) {
			if ((j >= 9 - i) && (j <= 9 + i))
				printf("*");
			else
				printf(" ");
		}
		printf("\n");
	}

	// 수업시간에 한 풀이
	// 연습문제 (3) : 별을 출력해서 피라미드 그리기

	int i, j;

	// 줄 : 1 2 3 4 5 6 7 8 9 10  → i 
	//빈칸: 9 8 7 6 5 4 3 2 1  0  → 10 - i
	// 별 : 1 3 5 7 9 13 15 17 19 → (i * 2) - 1 

	for (i = 1; i <= 10; i++) {
		for (j = 1; j <= 10 - i; j++)
			printf(" ");
		for (j = 1; j <= i * 2 - 1; j++)
			printf("*");
		printf("\n");
	}

	return 0;
}
*/



