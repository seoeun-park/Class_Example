#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

/*
// 매크로 함수(macro function)
// → 컴파일 되기 전에 전처리기(preprocessor)에 의해 치환된다
// → 매크로 함수를 정의할 때는 연산자 우선 순위에 신경 써야 한다

#define SQUARE(x)	((x) * (x))
// 매크로 함수 또한 전처리기에서 컴파일하기 전에 대입한 값을 먼저 치환한 다음 컴파일한다.
// 매개변수 x를 ()로 묶는 이유는? 연산자 우선 순위에 의해 결과값이 달라지는 것을 막기 위해서

// 정수의 제곱을 구하는 함수
int square(int num)
{
	return num * num;
}

int main() {

	// 함수를 호출할 때는 오버헤드(Overhead)가 들어간다
	// 그래서 간단한 함수의 경우 매크로 함수로 정의하기도 한다
	// 한 줄이 넘어가는 함수일 경우 매크로 함수보다는 함수를 정의하여 호출하는 것이 낫다
	// 함수를 정의하고 호출하는 것보다 매크로 함수를 이용해 호출하는 것이 속도면에서 훨씬 효율적이다

	printf("square(3) = %d\n", square(3));
	printf("SQUARE(3) = %d\n", SQUARE(3));
	// printf("SQUARE(3) = %d\n", 3 * 3);
	
	printf("square(3 + 2) = %d\n", square(3 + 2));
	printf("SQUARE(3 + 2) = %d\n", SQUARE(3 + 2));
	// → printf("SQUARE(3 + 2) = %d\n", 3 + 2 * 3 + 2);
	// → printf("SQUARE(3 + 2) = %d\n", 11);
	
	// → printf("SQUARE(3 + 2) = %d\n", (3 + 2) * (3 + 2));

	printf("81 / square(3 + 2) = %.2f\n", (double)81 / square(3 + 2));
	printf("81 / SQUARE(3 + 2) = %.2f\n", (double)81 / SQUARE(3 + 2));
	// → printf("81 / SQUARE(3 + 2) = %.2f\n", 81 / ((3 + 2) * (3 + 2)));

	return 0;
}
*/


//-----------------------------------------------------------------------
/*
int main() {

	// 배열(array): 저장 공간들의 집합
	// 배열의 원소(item): 배열의 각 저장공간
	// 배열의 인덱스(index): 배열의 원소에 접근하기 위해 사용하는 0부터 시작하는 정수
	// 배열의 크기(length): 배열에서 원소들의 개수

	// 배열의 선언
	int numbers[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
	// → numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }; → 컴파일 오류 발생

	// 배열의 크기 계산
	int length = sizeof(numbers) / sizeof(int);
	// → int length = 10;

	// 배열의 인덱스를 표현할 인덱스 변수
	int i;

	//출력
	printf("length = %d\n", length);

	// 배열 numbers의 세 번째 원소의 출력
	// → 배열의 원소에 접근할 때는 그 원소에 해당하는 인덱스와 인덱스 연산자([])를 사용한다
	printf("numbers[2] = %d\n", numbers[2]);

	// 배열 numbers의 여섯 번째 원소에 11이라는 값을 대입
	numbers[5] = 11;

	// for 구문을 이용해 배열의 모든 원소에 순차적으로 접근
	for (i = 0; i < length; i++)
		printf("numbers[%d] = %d\n", i, numbers[i]);

	// for 구문을 이용해 배열의 원소를 역순으로 출력
	for (i = length - 1; i >= 0; i--)
		printf("numbers[%d] = %d\n", i, numbers[i]);


	return 0;
}
*/


//------------------------------------------------------------------------
/*
	// 연습문제 (2) : 배열 scores의 모든 원소들을 2배만큼 큰 값으로 바꾸고
	// 모든 원소들의 값을 출력

int main() {


	int i;

	int score[] = { 88, 92, 76, 64, 86, 96 };

	int length = sizeof(score) / sizeof(int);

	// 반복문을 이용해 배열 scores의 원소들에 순차적으로 접근해서
	for (i = 0; i < length; i++)
	{
		// 각 원소의 값을 2배만큼 큰 값으로 바꾸고
		score[i] *= 2;

		// 그 값을 출력
		printf("score[%d] =  %d\n", i, score[i]);
	}
	return 0;
}
*/


//----------------------------------------------------------------------
/*
// 연습문제 (3) : 배열의 원소들 중에서 80보다 큰 값만 출력 

int main() {

	int i;

	int scores[] = { 88, 92, 76, 64, 86, 96 };

	int length = sizeof(scores) / sizeof(int);

	for (i = 0; i < length; i++)
		if (scores[i] > 80)
			printf("scores[%d] = %d\n", i, scores[i]);

	return 0;
}
*/

//-----------------------------------------------------------------------
/*
// 연습문제 (4) : 모든 원소들의 합계와 평균을 구하는 프로그램을 작성하라
int main() {

	int i;
	int scores[] = { 88, 92, 76, 64, 86, 96 };
	int length = sizeof(scores) / sizeof(int);
	int sum = 0;
	double average;

	for (i = 0; i < length; i++)
		sum += scores[i];

	average = (double)sum / length;
	

	printf("sum = %d\n", sum);
	printf("average = %.2f\n", average);

	return 0;
}
*/

//------------------------------------------------------------------
/*
// 연습문제(4)
int main() {

	int i;
	int scores[] = { 88, 92, 76, 64, 86, 96 };
	int length = sizeof(scores) / sizeof(int);

	// 최대값과 최소값을 저장할 변수
	int max = scores[0];
	int min = scores[0];

	// 배열 scores의 원소들 중에서 최대값과 최소값 구하기

	// 반복문을 이용해 배열의 모든 원소에 순차적으로 접근해서
	for (i = 1; i < length; i++)
	{
		// 변수 max와 변수 min의 값과 배열의 각 원소를 비교해서
		// 큰 값과 작은 값을 변수 max와 변수 min에 대입한다
		max = (max > scores[i]) ? max : scores[i];
		min = (min < scores[i]) ? min : scores[i];
	}

	// 출력
	printf("max = %d\n", max);
	printf("min = %d\n", min);

	return 0;
}
*/