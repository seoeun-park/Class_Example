#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	//�������� : ����ڿ��� ���� �������� �Է� �޾� ���� ���̸� ���ϰ�
	// �Ʒ��� ���� ��µǴ� ���α׷��� �ۼ��϶�

	// Enter a radius: 2

	//pi = 3.141592
	// radius of the circle = 2
	// area of the circle = 12.566


	// ����ڰ� �Է��ϴ� ���� �������� ������ ����
	int radius;

	// ������
	// ���(constant) : ������ �ʴ� ���� ��Ÿ����
	const double PI = 3.141592;

	//���� ���̸� ����ؼ� ������ ����
	double area;

	// ����ڿ��� ���� ������ �Է�
	printf("Enter a radius of the circle: ");

	scanf("%d", &radius);

	//���� ���� ���
	area = PI * radius * radius;

		//���
	printf("\n");
	printf("pi = %.6f\n", PI);
	printf("radius of the circle = %d\n", radius);
	printf("area of the circle = %.3f\n", area);

	return 0;
}