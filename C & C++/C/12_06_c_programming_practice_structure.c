#include <stdio.h>

// ���� �� Ǯ��
/*
struct point
{
	// ��� ����(member variable)
	int width;
	int height;
};

// typedef �Լ�
typedef struct point POINT;

// ����ü point�� ������ ����ϴ� �Լ�
// �Ű� ����: ����ü ����(struct point)
// ��ȯ ��: width * height

int rec_area(POINT p)
// struct point p = pos;
{

	return p.width * p.height;

}

int main() {

	// ����ü ����(structure variable) ����
	struct point pos, pos2;

	pos.width = 25;
	pos2.height = 35;

	// ���
	printf("area of rectangle = %d\n", rect_area(pos));

	return 0;
}
*/

//---------------------------------------------------------------------------
/*
// �����ð��� �� Ǯ��

// ����ü(structure)
// �� Ư�� ����� ǥ���ϴ� ���� ������ ������� �ڷ���

// ���簢���� ǥ���ϴ� ����ü
typedef struct _rect
{
	// ��� ����(member variable)
	// �� ����ü���� ������ ���� �����ϱ� ���� ����
	int width;
	int height;
} rect;

// ���簢���� ���̸� ���ϴ� �Լ�
// �Ű� ����: ���簢���� ǥ���ϴ� ����ü rect ����(struct_rect)
// ��ȯ ��: ���簢���� ����(width * height) �� int

int rect_area(rect r)
{

	return r.width * r.height;

}

int main() {

	// ����ü ����(structure variable) ����� �ʱ�ȭ
	rect obj = { 25, 35 };
	// struct _rect obj = { 25, 35 };


	// ���
	// ��� ���� ������(.)
	printf("area of the rectangle = %d\n", obj.width * obj.height);
	printf("area of the rectangle = %d\n", rect_area(obj));

	return 0;
}
*/

