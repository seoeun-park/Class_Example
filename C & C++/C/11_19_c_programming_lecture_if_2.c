#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main () {

	// if ���ǹ�------------------------------------------------

	//��������(1): ����ڿ��� ������ �Է¹޾� �� ������ 3�� ������� Ȯ���ϴ� ���α׷��� �ۼ��϶�

	// 3�� ���: 3���γ����� �������� ��
	// 3���� �������� �� �������� 0�� ��
	// num % 3 == 0
	// !(num % 3)
	// �� ���� ������ �ȿ� ���� ���ǽ��� ������ true�ƴ� false�� ������� ������
	// �� ��ǻ� false�� 0, true�� 0�� �ƴ� ���� ��� ������ ������.

	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	if (num % 3 == 0)
		printf("%d is a multiple of 3.\n", num);

	return 0;
}
*/

//----------------------------------------------------------------------------
/*
int main () {
	// if-else ���ǹ�

	//�������� (2): ����ڿ��� ������ �Է¹޾� �� ������ ¦���� ��
	//	Ȧ���� �� Ȯ���ϴ� ���α׷��� �ۼ��϶�

	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	if (num % 2 == 0)
		printf("%d is an even number!\n", num);
	else
		printf("%d is an odd number!\n", num);

	return 0;
		
}
*/

//--------------------------------------------------------------------------
/*
int main () {
	//�������� (3): ����ڿ��� �� ������ �Է� �޾� �� ���� ��
	//	ū ������ ���� ���� �� ���� ���ϴ� ���α׷��� �ۼ��϶�

		int x, y, z;

		printf("Enter two integers: ");
		scanf("%d %d", &x, &y);

		// ��� (1) �� if-else ���ǹ��� �̿��� ���(���� 2��)

		if (x > y)
			printf("%d - %d = %d\n", x, y, x - y);
		else
			printf("%d - %d = %d\n", y, x, y - x);

		// ��� (2) �� if-else ���ǹ��� �̿��� ���(���� 3��)

		z = x - y;

		if (z > 0)
			printf("%d - %d = %d\n", x, y, z);
		else
			printf("%d - %d = %d\n", y, x, -z);

		// ��� (3) �� ���� �����ڸ� �̿��� ���

		printf("max - min = %d\n", (x > y) ? x - y : y - x);

		return 0;
}
*/

//---------------------------------------------------------------------------
/*
int main () {

	// if-else-if ��ø ���ǹ�

	// �������� (4): ����ڿ��� ������ �Է¹޾� �� ���ڰ� Ȧ��, ¦��, 0���� �����ϴ� ���α׷��� �ۼ��϶�

	int num;

	printf("Enter an integers: ");
	scanf("%d", &num);

	// if-else-if ������ �̿��� ���α׷��� �ۼ��� ���� �˻��ϴ� ������ �߿��ϴ�.

	if (num == 0)
		printf("%d is zero.\n", num);
	else if (num % 2 == 0)
		printf("%d is an even number.\n", num);
	else
		printf("%d is an odd number.\n", num);

	
	return 0;
}
*/
