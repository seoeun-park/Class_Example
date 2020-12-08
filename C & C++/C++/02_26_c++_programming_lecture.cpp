#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;

// ��ǥ ��鿡�� ���� ǥ���ϴ� Ŭ���� Point
class Point
{
private:
	// ��� ����
	int x;
	int y;

public:
	// ��� �Լ�
	Point (int x = 0, int y = 0) : x(x), y(y) { }
	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }
	void Print() const { cout << "point = [" << x << ", " << y << "]" << endl; }

	Point Add(const Point& ref)
	{
		// �ӽ� ��ü(temporary object)�� �����ؼ� ��ȯ
		return Point(x + ref.x, y + ref.y);
	}

	// ������ �����ε�(operator overloading)
	// �� C++ �����Ϸ������� �⺻ �ڷ����� ���� �����ڵ��� ��ɵ��� ��� ���ǵǾ� �ִ�.
	//    ������ �츮�� ������ �ڷ����� ���� �����ڵ��� ����� ���ǵǾ����� �ʴ�.
	//	  ������ "������ �����ε�"�� ���� �츮�� ������ �ڷ���(Ŭ����)�� ���� �������� �����
	//	  ������ �� �ִ�.
	//	  �̸� �����ϴ� ���� "������ �����ε�"�̶�� �Ѵ�.
	// �� �������� �ǿ����ڰ� �⺻ �ڷ����� ���� �ƴ϶� ��ü�� ���,�����Ϸ��� �����ڸ� �Լ���
	//    ����Ѵ�. �̷��� �Լ��� "������ �Լ�(operator function)"��� �Ѵ�.
	// �� ������ �Լ� ���� �Լ��̹Ƿ� "�Լ� �����ε�"�� �����ϴ�. �̸� "������ �����ε�"�̶�� �Ѵ�.
	// �� ������ �Լ��� �ĺ��ڴ� operator Ű���� ������ ���� ��ȣ�� �ٿ��� �ۼ��Ѵ�.
	// �� �������� �ǿ����ڰ� ��ü�� ���, �����Ϸ��� ù ��° �ǿ������� ��� �Լ� �߿���
	//	  ������ �Լ��� ã��, ������ ���� �Լ� �߿��� ������ �Լ��� ã�´�.

	// ������ �����ε�(operator function)�� ��� 2����
	// 1. ��� �Լ� ����� ������ �����ε�
	// 2. ���� �Լ� ����� ������ �����ε�

	// 1. ��� �Լ� ����� + ������ �����ε�
	Point operator+(const Point& ref)
	{
		// �ӽ� ��ü(temporary object)�� �����ؼ� ��ȯ
		return Point(x + ref.x, y + ref.y);
	}

	// 1. ��� �Լ� ����� - ������ �����ε�
	Point operator-(const Point& ref)
	{
		return Point(x - ref.x, y - ref.y);
	}

	// == ������ �����ε�
	// �� ������ �Լ������� ��ȯ ���� ���� ����̴�.
	bool operator==(const Point& ref)
	{
		return x == ref.x && y == ref.y;
	}

	// friend �Լ� ����
	friend Point AddPoint(const Point& p1, const Point& p2);
	friend Point operator+(const Point& p1, const Point& p2);

};

// �� ���� ���ϴ� �Լ�
// �� �Ű�����: ���ϰ��� �ϴ� �� ��(Point)
// �� ��ȯ ��: �� ���� ���� ��(Point)
// ��ü�� ��ȯ�ϹǷ� �����ڷ� ������ ���� ���� �ٲ��� ���ϰԲ� ����� �����Ѵ�.
Point AddPoint(const Point& p1, const Point& p2)
{
	// Point p3(p1.GetX() + p2.GetX(), p1.GetY() + p2.GetY());

	// Point p3(p1.x + p2.x, p1.y + p2.y);
	// return p3;

	// �ӽ� ��ü(temporary object)�� �����ؼ� ��ȯ
	// ��ȯ ���� ��ü�� ��� ��ü�� �����ؼ� ��ȯ�Ǳ� ������ ���� �����ڰ� ȣ��ȴ�.
	return Point(p1.x + p2.x, p1.y + p2.y);

}

// 2. ���� �Լ� ����� ������ �����ε�
Point operator+(const Point& p1, const Point& p2)
{
	// �ӽ� ��ü(temporary object)�� �����ؼ� ��ȯ
	return Point(p1.x + p2.x, p1.y + p2.y);

}

int main() {

	// ��ü ����
	Point p1(3, 5), p2(6, 2);

	p1.Print();
	p2.Print();

	// ���� �Լ��� �� ��ü�� ���� ���� ��ȯ
	Point p4 = AddPoint(p1, p2);

	p4.Print();

	// ��� �Լ��� �� ��ü�� ���� ���� ��ȯ
	Point p5 = p1.Add(p2);

	p5.Print();

	Point p6 = p1 + p2;
	// Point p6 = p1.operator+(p2);
	// �� operator�� p1�� ��� �Լ��� ������� �����ε� �� �Լ�
	// Point p6 = operator+(p1, p2);
	// �� �̶� operator�� ���� �Լ��� ������� �����ε� �� �Լ�

	p6.Print();

	Point p7 = p1 - p2;

	p7.Print();

	//---------------------------------------------------------
	// == ������ �����ε�
	if (p1 == p2)
	// if (p1.operator==(p2))
		cout << "Same points!" << endl;
	else
		cout << "Different points!" << endl;

	return 0;
}