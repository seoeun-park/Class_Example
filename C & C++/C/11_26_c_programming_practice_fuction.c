#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
// ���� �� Ǯ��
// �������� : �־��� �������� �̿��� ���� ���̸� ���ϴ� �Լ��� �ۼ��ϰ�,
//			  �� �Լ��� �̿��� �������� 17�� ���� ���̸� ���� ����ϴ� ���α׷��� �ۼ��϶�

// �Լ��� ����
double area_circle();

int main() {
	double area;

	area = area_circle(17);

	// �Լ��� ȣ��
	printf("area of circle = %.3f\n", area);
	 
	return 0;
}

// �Լ��� ����
double area_circle(int radius) {

	const double PI = 3.141592;

	return PI * radius * radius;
}
*/

//-----------------------------------------------------------------------------------
/*
// �����ð��� �� Ǯ��

// �������� : �־��� �������� �̿��� ���� ���̸� ���ϴ� �Լ��� �ۼ��ϰ�,
//			  �� �Լ��� �̿��� �������� 17�� ���� ���̸� ���� ����ϴ� ���α׷��� �ۼ��϶�

// �Լ��� ����
double area_circle(int radius);

int main() {


	// �Լ��� ȣ��
	printf("area of circle = %.3f\n", area_circle(17));


	return 0;
}

// �Լ��� ����

// �Ű� ����: ������(int, double)
// �� �Ű� ������ �Լ��� ȣ��Ǹ� ����Ǹ�, ���ڷ� �־��� ������ �ʱ�ȭ �ȴ�

// ��ȯ ��: ���� ����(double)
double area_circle(int radius)
// double radius = 17;
{
	// �̷��� ����� ��ũ�� ����� ġȯ�� �� �ִ�.
	// ��ũ�� ������� ������ �� ��ũ�� ����� �޸� ��������� �Ҵ��� ��
	const double Pi = 3.141592;

	return Pi * radius * radius;
}
*/