#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main () {

// ���� �� Ǯ��

	int num, i;
	int factorial = 1;

	printf("Enter an integer: ");
	scanf("%d\n", &num);

	// factorial = 1
	// factorial = 1 * 2	��	factorial = factorial * 2
	// factorial = 1 * 2 * 3	��	factorial = factorial * 3

	for (i = 1; i <= num; i++)
		factorial *= i;

	printf("Factorial %d = %d\n", num, factorial);

	return 0;
}
*/

//-----------------------------------------------------------------------------
/*
int main() {

	// �����ð��� �� Ǯ��
	// ��������(): ����ڿ��� ������ �Է��ϰ�, �� ������ ���丮���� ���ϴ� ���α׷�

	int num, i;
	unsigned long long factorial = 1; //unsigned: 2�� 32���� ���� ǥ���� �� ����

	// int = long �� 4����Ʈ
	// long long �� 8����Ʈ

	printf("Enter an integer: ");
	scanf("%d", &num);

	// factorial = 1
	// factorial = 1 * 2	��	factorial = factorial * 2
	// factorial = 1 * 2 * 3	��	factorial = factorial * 3

	for (i = 1; i <= num; i++)
		factorial *= i;

	// factorial�� ���� ���Ǵ� 
	// 5 factorial = 5 * 4 * 3 * 2 * 1 �̹Ƿ�

	for (i = num; i >= 1; i--)
		factorial *= i;

	printf("\nFactorial %d = %lld\n", num, factorial);


	return 0;
}
*/
