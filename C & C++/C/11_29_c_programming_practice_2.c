#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// ��������(2) : ����ڿ��� ���ڿ��� �Է� �޾�, �� ���ڿ��� ������
	//	����ϴ� ���α׷��� �ۼ��϶� / ���ڿ��� �ִ� ���̴� 80��

	char str[81] = { 0 };

	char rev[81] = { 0 };

	int length = 0;

	int i;

	printf("Enter a string: ");
	scanf("%[^\n]s", str);

	for (i = 0; str[length] != 0; length++);

	printf("\n");
	printf("str = \"%s\"\n", str);
	printf("rev = \"");

	for (i = length - 1; i >= 0; i--)
		printf("%c", str[i]);

	printf("\"\n");

	for (i = 0; i < length; i++)
		rev[i] = str[length - i - 1];
		// -1�� �ϴ� ������? �迭�� �ε����� 0���� �����ϹǷ�
		//�迭�� ������ ������ �ε����� length - 1�̴�.

	printf("rev = \"%s\"\n", rev);

	return 0;
}
