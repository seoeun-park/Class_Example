#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// ��������(11/28) : �迭�� ��� �� ������ ������ ���� �� ������ŭ
	//	"*"�� ��� �׷����� �׸��� ���α׷��� �ۼ��϶�

	// �迭 ����
	int numbers[] = { 1, 3, 4, 2, 1, 3, 4, 1, 2, 3, 1, 3 };

	// �迭 numbers�� ũ��
	int length = sizeof(numbers) / sizeof(int);

	// �迭 numbers�� ���ҵ� �߿��� 1, 2, 3, 4�� ������ ������ �迭
	int counter[4] = { 0 };

	// �ε��� ����
	register int i, j;

	for (i = 0; i < length; i++)
		// if (numbers[i] == 1) counter[0]++;
		// if (numbers[i] == 2) counter[1]++;
		// if (numbers[i] == 3) counter[2]++;
		// if (numbers[i] == 4) counter[3]++;
		counter[numbers[i] - 1]++;

	// ���
	for (i = 0; i < 4; i++)
	{
		// ���� ���
		printf("%d ", i + 1);

	// 1, 2, 3, 4�� ������ŭ �� ���
	for (j = 0; j < counter[i]; j++)
		printf("*");

	// ����
	printf("\n");
	}

	return 0;
}

