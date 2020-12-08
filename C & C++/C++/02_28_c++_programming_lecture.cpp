#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
using std::string;

/*
// �� ������ ���ϴ� �Լ�
int Add(int n1, int n2) {

	return n1 + n2;
}

// �Լ� �����ε�(function overloading)
// �� �Ű������� ������ �Ű������� �ڷ����� �ٸ��� ���� �ĺ��ڸ� ������ �Լ��� ������ �� �ִ�.

// �� �Ǽ��� ���ϴ� �Լ�
double Add(double n1, double n2) {

	return n1 + n2;
}

// �� ���ڸ� ���ϴ� �Լ�
char Add(char n1, char n2) {

	return n1 + n2;
}

int main() {

	cout << "Add(3, 5) = " << Add(3, 5) << endl;
	cout << "Add(2.1, 3.8) = " << Add(2.1, 3.8) << endl;
	cout << "Add('1', '2') = " << Add('1', '2') << endl;

	return 0;
}
*/

/*
// �Լ� ���ø�(function template)
// �� �پ��� �ڷ����� �Լ��� ����� ���� ����
// �� �Լ��� ����� ������ ������ �ڷ����� �������� ���� �����̹Ƿ� �پ��� �ڷ����� 
//	  �Լ��� ���� ���ִ�.
// �� template Ű���带 ����� ���ø��� �����Ѵ�.
//	  template Ű���尡 ������ �� ���� ����� ���� ������ ���ø��� �ȴ�.
// �� template Ű���� �������� ���ø� �ȿ��� ����� �ڷ����� �̸��� �����ϴ� "���ø� �Ű�����"
//	  �� ���´�.
template <typename T>
T Add(T n1, T n2) {

	cout << "template function : ";
	return n1 + n2;
}

// �� ������ ���ϴ� �Լ�
int Add(int n1, int n2) {

	cout << "ordinary function : ";
	return n1 + n2;
}

// ���ø� �Լ�(template function)
// �� �Լ� ���ø����� ������� �Լ�
// �� ���ø� �Լ��� ó�� �� �Լ��� ȣ������ �� �����Ϸ��� ���� ���������.
// �� ���ø� �Լ��� ȣ���� ���� �Լ� ���ø��� �����ߴ� �Լ��� �ĺ��� ������ "���ø� ����"
//	  �� �����Ѵ�. �̶� ���ø� ���ڴ� �Լ� ���ø��� ���ø� �Ű������� ���޵� �ڷ����̴�.

//template <>
//int Add<int>(int n1, int n2) {

	//return n1 + n2;
//}

// �� �̻��� ���ø� �Ű������� ������ ���ø�
// �� ���ø� �Ű������� 2�� �̻��� ��쿡�� ��ǥ�� �����ؼ� �����Ѵ�
// �� �̶� typename Ű����� class Ű����� ����� ���ִ�.
template <typename T, class U>
void PrintData(double num)
{
	cout << (T)num << ", " << (U)num << endl;
}

int main() {

	cout << "Add(3, 5) = " << Add(3, 5) << endl;
	// cout << "Add(3, 5) = " << Add<int>(3, 5) << endl;
	// �� ���ø� �Լ��� ȣ���ϸ鼭 ���ø� ���ڸ� �������� ������ ������ �ڷ����� Ȯ���ؼ�
	//	  ���ø� �Լ��� �ڷ����� �����Ѵ�.
	// �� ���� ���� �ĺ��ڸ� ���� �ִ� �Ϲ� �Լ��� ���ø� �Լ��� ����Ǿ� ������
	//	  �Լ��� ȣ���� �� ���ø� ���ڸ� �������� �ʴ°�� �Ϲ� �Լ��� ȣ��ȴ�.
	// �� �Լ� ���ø��� ������ ��Ȳ���� ���� �ĺ��ڸ� ������ �Ϲ� �Լ��� �����ϴ� ���� �ٶ������� ���ϴ�.

	cout << "Add(2.1, 3.8) = " << Add<double>(2.1, 3.8) << endl;
	cout << "Add('1', '2') = " << Add<char>('1', '2') << endl;
	// �� ������ �ܰ迡�� �Լ� ���ø��� �̿��� ���ø� �Ű����� T�� ����ؼ� ���ø� ���ڷ� �־���
	//	 double, char �ڷ����� ���ø� �Լ��� �����Ѵ�.

	PrintData<char, int>(65);
	// �� ���ø� �Ű������� �� �̻��� ���ø� �Լ��� ȣ���� ���� ���ø� ���ڸ� ������ �� ����.


	return 0;
}
*/

/*
// ��������:  �Ʒ��� ���� ���α׷���������� �� �ֵ��� �Ű������� ���� �� ����
//			  ���� ū ���� ��ȯ�ϴ� Max �Լ��� �Լ� ���ø��� �����϶�.

template <typename T>
T Max(T data1, T data2)
{
	return data1 > data2 ? data1 : data2;
}

// �ڷ����� const char* �� ��쿡�� ������ ������ �Լ� ���ø����δ� ����� �������� �ʴ´�
//const char* Max(const char* data1, const char* data2)
//{
	//return data1 > data2 ? data1 : data2;
//}

template <>
const char* Max(const char* data1, const char* data2)
{
	// strcmp �Լ� : ���ڿ��� ���ϴ� �Լ�
	// �� ���ڿ��� ���� ���� ������ ������ ������ ������ ���� �� ū ���̴�.

	// #include <cstring>
	// int strcmp(const char* str1, const char* str2);
	// int strncmp(const char*str1, const char* str2, size_t length);
	//@return 1. positive- str1�� str2���� ū ���
	//		  2. negative - str2�� str1���� ū ���
	//		  3. 0		  - str1�� str2�� ���� ���
	return strcmp(data1, data2) > 0 ? data1 : data2;
	// return data1 > data2 ? data1 : data2;
}

// �Լ� ���ø��� Ư��ȭ(specialization)
// �� ������ �ڷ����� �ܿ� �Լ� ���ø��� ��������ʰ� ������ ������ ���ø��� ����ϵ��� �ϴ� ���

int main() {

	cout << Max(10, 20) << endl;
	cout << Max('a', 'Z') << endl;
	cout << Max<const char*>("Hello", "Hi") << endl;

	return 0;
}
*/

///*
// ��������(2) ���ڷ� ���޵Ǵ� �� ������ ����� ���� ���� ��ȯ�ϴ� swap �Լ��� ���ø����� �����϶�.
//				�׸��� ���� Point Ŭ������ ��ü�� ������� ���� ��ȯ�� �̷����� Ȯ���� �� �ֵ���
//				main �Լ��� �ۼ��϶�.
class Point
{
private:
	int x, y;
public:
	Point(int x = 0, int y = 0): x(x), y(y) {}
	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }

	friend std::ostream& operator<<(std::ostream& os, const Point& ref);

};

// �� ���� ���� �޾� ��ȯ�ϴ� �Լ� swap �Լ��� �Լ� ���ø�
template <typename T>
void swap(T& p1, T& p2)
{
	T tmp = p1;
	p1 = p2;
	p2 = tmp;
}

// ��Ʈ�� ���� ������(<<) �����ε�
std::ostream& operator<<(std::ostream& os, const Point& ref)
{
	os << "[" << ref.x << ", " << ref.y << "]";
	return os;
}

int main() {

	Point p1(1, 3), p2(7, 2);

	cout << "p1 = " << p1 << ", p2 = " << p2 << endl;
	swap(p1, p2);
	// swap<Point>(p1, p2);

	std::swap(p1, p2);
	cout << "p1 = " << p1 << ", p2 = " << p2 << endl;

	return 0;
}
//*/