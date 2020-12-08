#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
// 내가 한 풀이

int main() {
	// 연습문제(1) : 사용자가 숫자 0을 입력할 때까지 또는 최대 30개의 정수를
	//	입력할 때까지 정수를 입력 받아, 그 숫자들의 평균을 구하고
	//	사용자가 입력한 숫자들 중에서 평균 이상인 숫자들의 비율을 구하라

	int score, i;
	double average;
	int	length = 0;
	int sum = 0;
	int above = 0;

	int scores[30] = { 0 };

	while(1) {

		printf("Enter an integer: ");
		scanf("%d", &score);

		scores[length] = score;

		if (score == 0)
			break;

		length++;
	}


	for (i = 0; i < length; i++) {
		sum += scores[i];
	}

	average = (double)sum / length;
	printf("\n");
	printf("The average: %.1f\n", average);

	for (i = 0; i < length; i++) {
		if (scores[i] >= average)
			above++;
	}

	printf("\n");
	printf("above = %d\n", above);
	printf("Percentage of numbers above average: %d%%\n", (int)((double)above / length * 100));

	return 0;
}

*/

/*
// 수업 시간 때 한 풀이

int main() {
	// 연습문제(1) : 사용자가 숫자 0을 입력할 때까지 또는 최대 30개의 정수를
	//	입력할 때까지 정수를 입력 받아, 그 숫자들의 평균을 구하고
	//	사용자가 입력한 숫자들 중에서 평균 이상인 숫자들의 비율을 구하라

	int numbers[30] = { 0 };

	int i;

	int sum = 0;

	double average;

	int count_input = 0;

	int count_gt = 0;

	int ratio_gt;
	
	for (i = 0; i < 30; i++) {
		
		printf("Enter an integer: ");
		scanf("%d", &numbers[i]);

		if (numbers[i] == 0) break;

		sum += numbers[i];

		count_input++;
	}

	average = (double)sum / count_input;
	// →  average = (double)sum / count_input;

	for (i = 0; i < 30 && numbers[i] != 0; i++)
		if (numbers[i] >= average) count_gt++;

	ratio_gt = (int)((double)count_gt / count_input * 100);

	printf("\n");
	printf("The average: %.2f\n", average);
	printf("Percentage of numbers above average: %d%%\n", ratio_gt);
	

	return 0;
}
*/