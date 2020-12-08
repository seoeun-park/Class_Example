#include <stdio.h>

// 연습문제(12/5): 반복문을 이용해 2차원 배열에 1부터 25까지 정수를, 홀수행은 왼쪽부터
//	숫자가 증가하도록 저장하고, 짝수행은 오른쪽부터 숫자가 증가하도록 저장한후, 그 배열
//	의 값을 행과 열에 맞춰 출력하는 프로그램을 작성하라

/*
int main() {

	// 내가 한 풀이

	// 2차원 배열 선언
	// → 배열의 배열
	// → 첫 번째 인덱스는 배열의 개수, 두 번째 인덱스는 각 배열에서 원소의 개수
	int table[5][5] = { 0 };
		//= {
		//{1, 2, 3, 4, 5},
		//{6, 7, 8, 9, 10},
		//{11, 12, 13, 14, 15},
		//{16, 17, 18, 19, 20},
		//{21, 22, 23, 24, 25}
	//};

	// 2차원 배열에 포함된 배열의 개수 = 행렬에서 행으로 표현
	int rows = sizeof(table) / sizeof(table[0]);

	// 2차원 배열에 포함된 원소의 개수 = 행렬에서 열로 표현
	int colums = sizeof(table[0]) / sizeof(int);

	// 인덱스 변수 
	int i, j, k = 0;

		for(i = 0; i < rows; i++)
			for (j = 0; j < colums; j++) {
				k++;
				table[i][j] = k;
			}

	// 출력
	// printf("%3d", table[0][0]);1
	// printf("%3d", table[0][1]);2
	// printf("%3d", table[0][2]);3
	// printf("%3d", table[0][3]);4
	// printf("%3d", table[0][4]);5
	// printf("\n");

	// printf("%3d", table[1][4]);
	// printf("%3d", table[1][3]);
	// printf("%3d", table[1][2]);
	// printf("%3d", table[1][1]);
	// printf("%3d", table[1][0]);
	// printf("\n");

	// printf("%3d", table[2][0]);
	// printf("%3d", table[2][1]);
	// printf("%3d", table[2][2]);
	// printf("%3d", table[2][3]);
	// printf("%3d", table[2][4]);
	// printf("\n");

	// 2차원 배열의 모든 원소에 순차적으로 접근하기 위해 중첩 반복문을 사용한다.
	// 바깥쪽 반복문은 행을 표현하고 안쪽 반복문은 열을 표현한다.
	for (i = 0; i < rows; i++)
	{
		for (j = 0; j < colums; j++)
			if (table[i][0] % 2 == 1)
				printf("%3d", table[i][j]);
			else
				printf("%3d", table[i][(colums - 1) - j]);
				
		printf("\n");
	}

	return 0;
}
*/

//---------------------------------------------------------------------------------

// 수업시간에 한 풀이
/*
int main() {

	// 2차원 배열 선언
	int table[5][5] = { 0 };


	// 2차원 배열에 포함된 배열의 개수 = 행렬에서 행으로 표현
	int rows = sizeof(table) / sizeof(table[0]);

	// 2차원 배열에 포함된 원소의 개수 = 행렬에서 열로 표현
	int colums = sizeof(table[0]) / sizeof(int);

	// 인덱스 변수
	int i, j;

	// 2차원 배열에 저장할 값을 표현하는 변수
	int value = 1;

	// 중첩 반복문을 이용해서 2차원 배열에 값을 저장
	// → 바깥쪽 반복문을 이용해서 행을 표현
	// → 안쪽 반복문을 이용해서 열을 표현
	for (i = 0; i < rows; i++)
	{
		// 첫 번째 행, 세 번째 행, 다섯 번째 행인 경우
		// if (i == 0 || i == 2 || i == 4)
		if (i % 2 == 0)
			for (j = 0; j < colums; j++, value++)
				table[i][j] = value;
				// table[i][j] = i * 5 + j + 1;
		// 두 번째 행, 네 번째 행인 경우
		else
			for (j = 4; j >= 0; j--, value++)
				table[i][j] = value;
				// table[i][j] = (i * 5) + (5 - j);
	}

	// 출력
	for (i = 0; i < rows; i++)
	{
		for (j = 0; j < colums; j++)
				printf("%3d", table[i][j]);
		printf("\n");
	}

	return 0;
}
*/
