#include <stdio.h>

/* ��������(11/14) : �� ���� ���̰� ���� 25, 15�� ���簢���� ���̿� �ѷ��� ���ϴ� ���α׷��� �ۼ��϶� */

int main() {

	int width = 25;
	int height = 15;

	int area, perimeter;

	area = width * height;

	perimeter = (width + height) * 2;

	printf("area of rectangle = %d\n", area);
	printf("perimeter of rectangle = %d\n", perimeter);
	
	return 0;
}
