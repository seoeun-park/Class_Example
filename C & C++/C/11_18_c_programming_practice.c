#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// �������� : ����ڿ��� ������ �Է� �޾�, �� ������ 10���� �۰ų�
	//	40���� ū ��� "Hello World!" ���ڿ��� ����ϴ� ���α׷��� �ۼ��϶�


	// ������ 10���� �۴� �� num < 10
	// Ȥ��(OR) �� ���� ������ = ||
	// ������ 40���� ũ�� �� num > 40

	int num;

	printf("Enter an integers: ");r
	scanf("%d", &num);

	if (num < 10 || num > 40)
		printf("\nHello World!\n");

	return 0;
}
