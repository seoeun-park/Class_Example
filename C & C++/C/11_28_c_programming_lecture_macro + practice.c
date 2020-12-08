#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

/*
// ��ũ�� �Լ�(macro function)
// �� ������ �Ǳ� ���� ��ó����(preprocessor)�� ���� ġȯ�ȴ�
// �� ��ũ�� �Լ��� ������ ���� ������ �켱 ������ �Ű� ��� �Ѵ�

#define SQUARE(x)	((x) * (x))
// ��ũ�� �Լ� ���� ��ó���⿡�� �������ϱ� ���� ������ ���� ���� ġȯ�� ���� �������Ѵ�.
// �Ű����� x�� ()�� ���� ������? ������ �켱 ������ ���� ������� �޶����� ���� ���� ���ؼ�

// ������ ������ ���ϴ� �Լ�
int square(int num)
{
	return num * num;
}

int main() {

	// �Լ��� ȣ���� ���� �������(Overhead)�� ����
	// �׷��� ������ �Լ��� ��� ��ũ�� �Լ��� �����ϱ⵵ �Ѵ�
	// �� ���� �Ѿ�� �Լ��� ��� ��ũ�� �Լ����ٴ� �Լ��� �����Ͽ� ȣ���ϴ� ���� ����
	// �Լ��� �����ϰ� ȣ���ϴ� �ͺ��� ��ũ�� �Լ��� �̿��� ȣ���ϴ� ���� �ӵ��鿡�� �ξ� ȿ�����̴�

	printf("square(3) = %d\n", square(3));
	printf("SQUARE(3) = %d\n", SQUARE(3));
	// printf("SQUARE(3) = %d\n", 3 * 3);
	
	printf("square(3 + 2) = %d\n", square(3 + 2));
	printf("SQUARE(3 + 2) = %d\n", SQUARE(3 + 2));
	// �� printf("SQUARE(3 + 2) = %d\n", 3 + 2 * 3 + 2);
	// �� printf("SQUARE(3 + 2) = %d\n", 11);
	
	// �� printf("SQUARE(3 + 2) = %d\n", (3 + 2) * (3 + 2));

	printf("81 / square(3 + 2) = %.2f\n", (double)81 / square(3 + 2));
	printf("81 / SQUARE(3 + 2) = %.2f\n", (double)81 / SQUARE(3 + 2));
	// �� printf("81 / SQUARE(3 + 2) = %.2f\n", 81 / ((3 + 2) * (3 + 2)));

	return 0;
}
*/


//-----------------------------------------------------------------------
/*
int main() {

	// �迭(array): ���� �������� ����
	// �迭�� ����(item): �迭�� �� �������
	// �迭�� �ε���(index): �迭�� ���ҿ� �����ϱ� ���� ����ϴ� 0���� �����ϴ� ����
	// �迭�� ũ��(length): �迭���� ���ҵ��� ����

	// �迭�� ����
	int numbers[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
	// �� numbers = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }; �� ������ ���� �߻�

	// �迭�� ũ�� ���
	int length = sizeof(numbers) / sizeof(int);
	// �� int length = 10;

	// �迭�� �ε����� ǥ���� �ε��� ����
	int i;

	//���
	printf("length = %d\n", length);

	// �迭 numbers�� �� ��° ������ ���
	// �� �迭�� ���ҿ� ������ ���� �� ���ҿ� �ش��ϴ� �ε����� �ε��� ������([])�� ����Ѵ�
	printf("numbers[2] = %d\n", numbers[2]);

	// �迭 numbers�� ���� ��° ���ҿ� 11�̶�� ���� ����
	numbers[5] = 11;

	// for ������ �̿��� �迭�� ��� ���ҿ� ���������� ����
	for (i = 0; i < length; i++)
		printf("numbers[%d] = %d\n", i, numbers[i]);

	// for ������ �̿��� �迭�� ���Ҹ� �������� ���
	for (i = length - 1; i >= 0; i--)
		printf("numbers[%d] = %d\n", i, numbers[i]);


	return 0;
}
*/


//------------------------------------------------------------------------
/*
	// �������� (2) : �迭 scores�� ��� ���ҵ��� 2�踸ŭ ū ������ �ٲٰ�
	// ��� ���ҵ��� ���� ���

int main() {


	int i;

	int score[] = { 88, 92, 76, 64, 86, 96 };

	int length = sizeof(score) / sizeof(int);

	// �ݺ����� �̿��� �迭 scores�� ���ҵ鿡 ���������� �����ؼ�
	for (i = 0; i < length; i++)
	{
		// �� ������ ���� 2�踸ŭ ū ������ �ٲٰ�
		score[i] *= 2;

		// �� ���� ���
		printf("score[%d] =  %d\n", i, score[i]);
	}
	return 0;
}
*/


//----------------------------------------------------------------------
/*
// �������� (3) : �迭�� ���ҵ� �߿��� 80���� ū ���� ��� 

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
// �������� (4) : ��� ���ҵ��� �հ�� ����� ���ϴ� ���α׷��� �ۼ��϶�
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
// ��������(4)
int main() {

	int i;
	int scores[] = { 88, 92, 76, 64, 86, 96 };
	int length = sizeof(scores) / sizeof(int);

	// �ִ밪�� �ּҰ��� ������ ����
	int max = scores[0];
	int min = scores[0];

	// �迭 scores�� ���ҵ� �߿��� �ִ밪�� �ּҰ� ���ϱ�

	// �ݺ����� �̿��� �迭�� ��� ���ҿ� ���������� �����ؼ�
	for (i = 1; i < length; i++)
	{
		// ���� max�� ���� min�� ���� �迭�� �� ���Ҹ� ���ؼ�
		// ū ���� ���� ���� ���� max�� ���� min�� �����Ѵ�
		max = (max > scores[i]) ? max : scores[i];
		min = (min < scores[i]) ? min : scores[i];
	}

	// ���
	printf("max = %d\n", max);
	printf("min = %d\n", min);

	return 0;
}
*/