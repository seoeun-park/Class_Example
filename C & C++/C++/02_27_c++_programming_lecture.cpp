#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
using std::string;

/*
class Point
{
private:
	int x, y;

public:
	Point(int x = 0, int y = 0) : x(x), y(y) {}

	// �⺻ ���� ������(default copy constructor)
	// Point(const Point& copy) : x(copy.x), y(copy.y) {}

	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }
	void Print() const { cout << "point = [" << x << ", " << y << "]" << endl; }

	// ���� �Լ� ����� ��Ʈ�� ���� ������ �Լ����� private ��� ����(x, y)�� �����ϱ� ���Ͽ�
	friend std::ostream& operator<<(std::ostream& os, const Point& ref);

	//-------------------------------------------------------------------
	// ���� ������(=) �����ε�
	// �� Ŭ������ ���� ������ �����ε��� ���������� �⺻ ���� ������ �����ε��� �߰��ȴ�.

	// �⺻ ���� ������ �����ε�(default assignment operator overloading)
	// @param	������ ��ü
	// @return	��ü �� �ڽ�

	Point& operator=(const Point& ref)
	{
		// ��� �� ��� ���� �� ���� ����
		x = ref.x;
		y = ref.y;

		// �ڱ� ������ ��ȯ
		return *this;
	}
};

// ��Ʈ�� ���� ������(<<) �����ε�
// �� @brief	cout ��ü�ͽ�Ʈ�� ���� �����ڸ� �̿��� Point ��ü�� ���� ���
// �� @param	1. cout ��ü
//				2. ����ϰ��� �ϴ� Point Ŭ���� ��ü
// �� @return

std::ostream& operator<<(std::ostream& os, const Point& ref)
{
	os << "[" << ref.x << ", " << ref.y << "]";
	return os;
}


int main() {

	// cout ��ü
	// �� iostream.h ���Ͽ� ���ǵǾ� �ִ� ostream Ŭ������ ��ü

	// ��Ʈ�� ���� ������(<<, ��Ʈ ����Ʈ ������)
	// �� ostream Ŭ�������� ������ �����ε� �س��� ������
	// �� ��Ʈ�� ���� �����ڸ� ���̾� ����ؼ� ���� ���� ����ϱ� ���� ��Ʈ�� ���� ��������
	//	  ������ �Լ��� �ݵ�� cout ��ü�� ��ȯ�ؾ� �Ѵ�.

	cout << "Hello World!\n";
	// �� cout.operator<<("Hello World!\n");

	cout << "I am a " << "boy!\n";
	// �� cout.operator<<("I am a").operator<<("boy!\n");
	// �� ��Ʈ�� ���� ������(<<)�� ���̾� ����ؼ� ���� ���� ����ϱ� ���� ��Ʈ�� ���� ��������
	//	  ������ �Լ��� �ݵ�� cout ��ü�� ��ȯ�ؾ� �Ѵ�.

	int num = 10;

	cout << "num = " << num << endl;
	// �� cout.operator<<("num = ").operator<<(num).operator<<(endl);

	Point p1(2, 3), p2(4, 2);

	// cout << p1;
	// �� cout.operator<<(p1);		// WARNING!
	// �� ������ ������ �ߴ� ������ ���� ������ Ŭ������ ��ü�� �޴� ��Ʈ�� ���� �����ڴ� 
	//	  ostream Ŭ�������� �����ε����� �ʾұ� �����̴�. 
	//	  �׷��ٰ� ostream ���̺귯���� ���� �����Ͽ� ������ �� ���� ������ ���� �Լ� �����
	//	  �����ε��� �ؾ� �Ѵ�.
	// �� operator(cout, p1);
	// �� ��Ʈ�� ���� �����ڸ� ���� �Լ� ������� �����ε��Ѵٸ� Print �Լ��� ���� �ʰ� �����ϰ�
	//	  ����� �� �ְ� �ȴ�.

	cout << "p1 = " << p1 << endl;
	// �� operator(cout.operator<<("p1 = "), p1).operator<<(endl);

	//---------------------------------------------------------------------------------
	Point p3 = p1;
	// �� Point p4(p1);
	// �� ��ü�� �ʱ�ȭ�ϴ� ���ÿ� ��ü�� ����
	// �� �⺻ ���� �����ڸ� ȣ���Ͽ� ����

	p3 = p2;
	// �� p3.operator=(p2);
	// �� �⺻ ���� ������ �����ε��� ���� ����
	// �� �⺻ ���� ������ �����ε��� ���� �ۼ����� �ʾƵ� �⺻ ���� ������ó�� �ڵ����� ȣ��

	cout << "p3 = " << p3 << endl;


	return 0;
}
*/

/*
// ������ Ŭ���� Sample
class Sample
{
private:
	char* data;

public:

	Sample(const char* str = nullptr) :data(nullptr) { SetData(str); }

	// ���� ������
	// �� "���� ����"���ϱ� ���� ���� ������ ����
	Sample(const Sample& copy) : data(nullptr) { SetData(copy.data); }

	~Sample() { if (data) delete[] data; }

	void SetData(const char* str)
	{
		if (!str) return;

		int length = strlen(str);

		if (length <= 0) return;

		if (data) delete[] data;

		data = new char[length + 1];

		strcpy(data, str);
	}
	const char* GetData() const { return data; }
	void Print() const { cout << "data = " << data << endl; }

	friend std::ostream& operator<<(std::ostream& os, const Sample& ref);
	
	// ���� ������ �����ε� (�⺻ ���� ������ �����ε� x)
	// �� ���� ���縦 �� �� �ֵ��� ���� �������Լ��� �����Ѵ�.
	Sample& operator=(const Sample& ref)
	{
		// data = ref.data;		�� ��� �� ��� ����(���� ����)

		SetData(ref.data);
		return *this;
	}

};

// ��Ʈ�� ���� ������ �����ε�
std::ostream& operator<<(std::ostream& os, const Sample& ref)
{
	os << ref.data;
	return os;
}

int main() {

	// ��ü ����
	Sample obj1("Hello World!");
	Sample obj2 = obj1;

	cout << "obj1 = " << obj1 << endl;
	cout << "obj2 = " << obj2 << endl;

	Sample obj3;

	obj3 = obj1;
	// �� obj3.operator=(obj1);
	// ���� ������ �����ε� �ʿ�

	cout << "obj3 = " << obj3 << endl;


	return 0;
}
*/

int main() {

	// string Ŭ����
	// �� #include <string>
	// �� ���ڿ��� ó���ϱ� ���� C++ ǥ�� ���̺귯���� ���ǵǾ� �ִ� Ŭ����

	string str = "Hello World!";

	cout << "str = " << str << endl << endl;

	string str1 = "C++ ";
	string str2 = "Programming";

	string str3 = str1 + str2;

	cout << "str3 = " << str3 << endl << endl;

	str1 += str2;

	if (str1 == str2)
		cout << "Same string!" << endl << endl;
	else
		cout << "Different string!" << endl << endl;

	cout << "str1[2] = " << '"' << str1[2] << '"' << endl << endl;

	// cin ��ü�� ���� ���ڿ� �Է�
	cout << "Enter a string: ";
	cin >> str;

	cout << "str = " << str << endl;


	return 0;
}

// c++ ���۷��� ����Ʈ: cplusplus.com