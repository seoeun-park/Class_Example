#include <iostream>

using std::cout;
using std::endl;

class Point
{
private:
	int x, y;

public:
	Point(int x = 0, int y = 0) : x(x), y(y) {}
	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }
	void Print() const { cout << "point = [" << x << ", " << y << "]" << endl; }

	//----------------------------------------------------------------------------
	// ��� �Լ� ����� ������ �����ε�(operator overloading)

	// * ������ �����ε�
	// @brief	�Ű������� ���޵� ������ŭ ���ؼ� ���ο� ��ǥ ����
	// @param	���� ����(int)
	// @return	Point Ŭ������ ��ü

	Point operator*(int num)
	{
		return Point(x * num, y * num);
	}

	/**
	 �� ==������ �����ε�
	 �� @brief	�� ��ǥ�� ���� �� Ȯ��
	 �� @param	Ȯ���� Point Ŭ������ ��ü
	 �� @return	�� ��ǥ�� ���� ���� ����(bool)
	*/

	bool operator==(const Point& ref)
	{
		return x == ref.x && y == ref.y;
	}

	friend Point operator*(int num, const Point& ref);

};

//----------------------------------------------------------------------------
// ���� �Լ� ����� ������ �����ε�

// ������ �Լ�
// �� �Ű�����: �������� �ǿ�����
// �� ��ȯ ��: �������� ���� ���

// * ������ �����ε�
// @brief	�Ű������� ���޵� ��ü�� �Ű������� ���޵� ������ŭ ���ؼ� ���ο� ��ǥ ����
// @param	1. ���� ����(int)
//			2. Point Ŭ������ ��ü
// @return	Point Ŭ������ ��ü

Point operator*(int num, const Point& ref)
{
	// return Point(num * ref.GetX(), num * ref.GetY());
	return Point(num * ref.x, num * ref.y);
}

//----------------------------------------------------------------------------
// main �Լ�
int main() {

	Point p1(2, 3);

	Point p2 = p1 * 3;
	// �� Point p2 = p1.operator*(3);	�� ��� �Լ� ����� �����ε�
	// �� Point p2 = operator*(p1, 3);	�� ���� �Լ� ����� �����ε�

	// ������ �����ε��� �Ҷ��� ��ȯ ��Ģ�� ������ �� �ֵ��� �ؾ� �Ѵ�.
	Point p3 = 3 * p1;
	// �� Point p3 = 3.operator*(p1); �� ������ �� �����Ƿ� ���� �Լ� �����ε��� �ؾ� �Ѵ�.
	// �� Point p3 = operator(3, p1);

	p1.Print();
	p2.Print();
	p3.Print();

	if (p2 == p3)
	// �� if (p2.operator==(p3))
	// �� if (operator==(p2, p3))
		cout << "Same points!" << endl;
	else
		cout << "Different points!" << endl;

	return 0;
}