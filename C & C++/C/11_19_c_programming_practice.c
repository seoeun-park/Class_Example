#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main () {

	// ���� �� Ǯ��
	// ��������(11/19): ����ڿ��� ����, ����, ����, ������ �Է� �޾� �����
	// ����ϰ� ����� ������ �� ��� ������ ����� ����ϴ� ���α׷��� �ۼ��϶�


	int x, y, z;
	
	printf("Enter three integers: ");
	scanf("%d %d %d", &x, &y, &z);

	int average = (x + y + z) / 3;

	if (average >= 90)
		printf("����� ������ A����Դϴ�.\n");
	else if (average >= 80)
		printf("����� ������ B����Դϴ�.\n");
	else if (average >= 70)
		printf("����� ������ C����Դϴ�.\n");
	else if (average >= 60)
		printf("����� ������ D����Դϴ�.\n");
	else
		printf("����� ������ F����Դϴ�.\n");


	return 0;
}
*/

//------------------------------------------------------------------------------------
///*
int main () {

	// �����ð��� �� Ǯ��
	// ��������(11/19): ����ڿ��� ����, ����, ����, ������ �Է� �޾� �����
	// ����ϰ� ����� ������ �� ��� ������ ����� ����ϴ� ���α׷��� �ۼ��϶�
	

	int korean, english, math;
	double average;
	char grade;

	printf("���� ������ �Է��Ͻÿ�: ");
	scanf("%d", &korean);

	printf("���� ������ �Է��Ͻÿ�: ");
	scanf("%d", &english);

	printf("���� ������ �Է��Ͻÿ�: ");
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

	//���
	printf("��� %.2f�̰� ����� %c�Դϴ�", average, grade);


	return 0;
}
//*/
