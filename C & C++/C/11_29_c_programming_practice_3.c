#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int main() {

	// ��������(3) : ����ڿ��� ���ڿ��� �Է� �޾�, �� ���ڿ����� �빮�ڴ� �ҹ��ڷ�
	//	�ҹ��ڴ� �빮�ڷ� ����ϴ� ���α׷��� �ۼ��϶�

	char str[81];

	int i;

	int delta = 'a' - 'A';
	// �� 32

	printf("Enter a string: ");
	scanf("%[^\n]s", str);

	printf("\n");
	printf("str = \"%s\"\n", str);
	printf("cnv = \"");

	for (i = 0; str[i] != 0; i++)

		if (str[i] >= 'A' && str[i] <= 'Z')
			printf("%c", str[i] + delta);
		else if (str[i] >= 'a' && str[i] <= 'z')
			printf("%c", str[i] - delta);
		else
			printf("%c", str[i]);

	printf("\"\n");



	return 0;
}
