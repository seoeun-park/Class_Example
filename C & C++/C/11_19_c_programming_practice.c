#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main () {

	// 내가 한 풀이
	// 연습문제(11/19): 사용자에게 국어, 영여, 수학, 점수를 입력 받아 평균을
	// 계산하고 등급을 구분한 후 평균 점수의 등급을 출력하는 프로그램을 작성하라


	int x, y, z;
	
	printf("Enter three integers: ");
	scanf("%d %d %d", &x, &y, &z);

	int average = (x + y + z) / 3;

	if (average >= 90)
		printf("당신의 학점은 A등급입니다.\n");
	else if (average >= 80)
		printf("당신의 학점은 B등급입니다.\n");
	else if (average >= 70)
		printf("당신의 학점은 C등급입니다.\n");
	else if (average >= 60)
		printf("당신의 학점은 D등급입니다.\n");
	else
		printf("당신의 학점은 F등급입니다.\n");


	return 0;
}
*/

//------------------------------------------------------------------------------------
///*
int main () {

	// 수업시간에 한 풀이
	// 연습문제(11/19): 사용자에게 국어, 영여, 수학, 점수를 입력 받아 평균을
	// 계산하고 등급을 구분한 후 평균 점수의 등급을 출력하는 프로그램을 작성하라
	

	int korean, english, math;
	double average;
	char grade;

	printf("국어 점수를 입력하시오: ");
	scanf("%d", &korean);

	printf("영어 점수를 입력하시오: ");
	scanf("%d", &english);

	printf("수학 점수를 입력하시오: ");
	scanf("%d", &math);

	average = (double)(korean + english + math) / 3;

	if (average >= 90)
		grade = 'A';
	else if (average >= 80)
		grade = 'B';
	else if (average >= 70)
		grade = 'C';
	else if (average >= 60)
		grade = 'D';
	else
		grade = 'F';

	//출력
	printf("평균 %.2f이고 등급은 %c입니다", average, grade);


	return 0;
}
//*/
