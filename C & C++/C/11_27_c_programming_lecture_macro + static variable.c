#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
// ��ũ��(macro)
// �� ������ �Ǳ� ���� ��ó���⿡ ���� ������ ������ ġȯ
// ������ ��������� �Ҵ���� ����

// ��ũ�� ��� ����
#define PI 3.14
// ��ũ�� ����� �빮�ڷ� �ۼ��ϴ� ���� �����̴�
// ��ó���⿡�� �������ϱ� ���� ������ ���� ���� ġȯ�� ���� �������Ѵ�

#define TRUE 1
#define FALSE 0

#define HELLO printf("Hello World!\n")

int main() {
	
	HELLO;
	// �� printf("Hello World!");

	return 0;
}
*/

//---------------------------------------------------------------------------------------
/*
// �������� (2): �־��� �� ������ ����� ���ϴ� �Լ��� �ۼ��ϰ� ����ڿ��� ���� 2���� �Է¹�����
//				 �ۼ��� �Լ��� �̿��� ����� ���� ����ϴ� ���α׷��� �ۼ��϶�
double average(int x, int y);

int main() {
	int num1, num2;

	printf("Enter two integers: ");
	scanf("%d %d", &num1, &num2);

	
	printf("average = %.2f\n", average(num1, num2));

	return 0;
}

double average(int x, int y) {

	return (double)(x + y) / 2;
}
*/

/*
//--------------------------------------------------------------------------------
// ���������� �Ⱦ��� �Ⱦ����� ���� �����̴�.
// ���������� ���������� �̸��� �浹�� ��� ���������� �켱�Ѵ�.
void count() {

	// ��������
	int cnt = 0;
	// �������� �� static int cnt = 0;

	cnt++;

	printf("count = %d\n", cnt);
}

int main() {

	count(); // ���������� ���	   // ���������� ���
	count();	//	count = 1		count = 1
	count();	//	count = 1		count = 2
	count();	//	count = 1		count = 3
	count();	//	count = 1		count = 4
	count();	//	count = 1		count = 5

	return 0;
}
*/