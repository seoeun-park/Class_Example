#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
using std::string;
/*
// ���ø�(template)
// 1. �Լ� ���ø�(function template)
// 2. Ŭ���� ���ø�(class template)

// Ŭ���� ���ø�(class template)
// �� ��� ������ ��� �Լ��� �ڷ����� Ŭ������ �����ϸ鼭 �����ϴ� �� �ƴ϶�,
//	 �Լ� ���ø�ó�� ������ �ܰ迡�� ���ø� ���ڿ� ���� �ڷ����� �����Ѵ�.

template <typename T>
class Sample
{
private:
	T data;

//public:
	//Sample(T n = 0) :data(n) {}

	//void SetData(T n) { data = n; }
	//T GetData() const { return data; }

	//void Print() const { cout << "data = " << data << endl; }

public:
	Sample(T n = 0);

	void SetData(T n);
	T GetData() const;

	void Print() const;

	template <typename T>
	friend std::ostream& operator<<(std::ostream& os, const Sample<T>& ref);

};

// Ŭ���� ���ø��� ��� �Լ��� Ŭ���� ���ø� �ܺο��� ����
// �� Ŭ���� ���ø��� �� ��� �Լ��� ������ �Լ� ���ø����� �����ؾ� �Ѵ�.
// �� Ŭ������ ��� �Լ��� ������ ���� ������ �ҽ� ���Ͽ� ������, Ŭ���� ���ø��� ��� �Լ�����
//	 �Լ� ���ø��̱� ������ ���� ��� ���� �ȿ� �ۼ��Ѵ�.
template <typename T>
Sample<T>::Sample(T n) :data(n) {}

template <typename T>
void Sample<T>::SetData(T n) { data = n; }

template <typename T>
T Sample<T>::GetData() const { return data; }

template <typename T>
void Sample<T>::Print() const { cout << "data = " << data << endl; }

// ��Ʈ�� ���� ������ �����ε�
template <typename T>
std::ostream& operator<<(std::ostream& os, const Sample<T>& ref)
{
	os << ref.data;
	return os;
}

//----------------------------------------------------------------------------
// Ŭ���� ���ø��� Ư��ȭ
// �� Ư�� �ڷ����� ������� ������ ��ü�� ���� �ٸ� ����� ����ϵ��� �ϱ� ���� Ŭ���� ���ø���
//	 Ư��ȭ�Ѵ�.
// �� Ư��ȭ�� �ϸ� Ư��ȭ�� Ŭ������ ��ü�� ���������ʴ��� �ڵ����� ��üȭ�ȴ�.
// �� ��, Ŭ���� ���ǰ� ��������� ��� �Լ����� �����ϵǾ���� ���Ͽ� ���Եȴ�.
//	 ���� Ư��ȭ�� ũ������ ���� ����Լ��� ���Ǵ��Ϲ����� ���ø� Ŭ�����ʹ� �޸�
//	 ��� ���Ͽ� �ۼ��ؼ��� �ȵǸ� �������Ͽ� �ۼ��ؾ��Ѵ�.
template <>
class Sample<const char*>
{
private:
	char* data;

public:
	
	Sample(const char* str = nullptr);
	Sample(const Sample<const char*>& copy);
	~Sample();

	void SetData(const char* str);
	const char* GetData() const;
	void Print() const;
	
};

Sample<const char*>::Sample(const char* str) : data(nullptr) { SetData(str); };
Sample<const char*>::Sample(const Sample<const char*>& copy) :data(nullptr) { SetData(copy.data); }
Sample<const char*>::~Sample() { if (data) delete[] data; }

void Sample<const char*>::SetData(const char* str)
{
	if (!str) return;

	int length = strlen(str);
	if (length <= 0) return;

	if (data) delete[] data;

	data = new char[length + 1];
	strcpy(data, str);
}
const char* Sample<const char*>::GetData() const { return data; }
void Sample<const char*>::Print() const { cout << "data = " << data << endl; }

int main() {

	// Ŭ���� ���ø��� �̿��� ��ü ����
	// �� Ŭ���� ���ø������� ���ø� ���ڸ� ������ �� ����.

	Sample<int> obj1(10);
	obj1.Print();
	cout << "obj1 = " << obj1 << endl;
	// �� operator<<(cout, obj1);

	Sample<double> obj2(3.14);
	obj2.Print();

	Sample<char> obj3('A');
	obj3.Print();

	Sample<const char*> obj4("Hello World!");
	// Sample<string> obj4("Hello World!");
	// cout << "obj4 = " << obj4 << endl;
	obj4.Print();

	return 0;
}
*/

// ����(exception)
// �� ���α׷� ���� ���� �߻��ϴ� ���� ����
// �� �������� ������ ���ܿ����Ե����ʴ´�.
// �� ���α׷��� ����Ǵ� ���� ���ܰ� �߻��ϸ� ���α׷��� ���� �����Ѵ�. �̷� ��Ȳ�� �߻��ϸ�
//	 ���α׷����� �Ҵ� ���� �ý��� �ڿ� ���� ����� ������ ��������, ����ڰ� �Է���
//	 �����͵��� ���������� ������� �� ���� �ȴ�.
// �� ������ ��ǥ���� ��: 0���� ������ ���

// ���� ó��(exception handling)
// �� ���α׷��� ����� �� �߻��� ���ִ¿��ܸ� ����ؼ� �ڵ带 �ۼ��ϴ� ��
// �� ���α׷��� ���������� ���Ḧ ���� �������� ���� ���¸� �����ϱ� ���ؼ�

/*
int main() {
	int n1, n2;

	cout << "Enter a string: ";
	cin >> n1 >> n2;

	cout << "Quotient = " << n1 / n2 << endl;
	cout << "Remainder = " << n1 % n2 << endl;
}
*/

/*
int main() {
	int n1, n2;

	cout << "Enter an integer: ";
	cin >> n1 >> n2;

	// � ���� 0���� ������ �Ǹ� ���ܰ� �߻��ؼ� ���α׷��� ������ ����ȴ�.
	// �̷��� ��Ȳ�� �߻����� �ʵ��� ������ ���� ������ 0���� Ȯ���Ѵ�.

	if (n2 == 0)
	{
		cout << "The divisor must not be zero!";
	}
	else
	{
		cout << "Quotient = " << n1 / n2 << endl;
		cout << "Remainder = " << n1 % n2 << endl;
	}

	// ���ǹ��� �̿��� ���� ó���� ���� ���� ������
	// 1. ���ܰ� �߻��ϴ� ��ġ�� ���ܰ� �߰ߵǴ� ��ġ�� �ٸ� �� �ִ�.
	// 2. ���� ó���� �ϱ� ���� �ۼ��� �ڵ�� ���α׷� �帧�� �����ϴ� �ڵ带 �����ϱ� ��ƴ�.
	// 
}
*/

/*
int main() {
	int n1, n2;

	cout << "Enter an integer: ";
	cin >> n1 >> n2;

	// � ���� 0���� ������ �Ǹ� ���ܰ� �߻��ؼ� ���α׷��� ������ ����ȴ�.
	// �̷��� ��Ȳ�� �߻����� �ʵ��� ������ ���� ������ 0���� Ȯ���ؼ� ���ܸ� �߻���Ų��.

	// ���ܰ� �߻��� ���ɼ��� �ִ� ������� try ��Ͽ� �ۼ�
	try
	{
		// �������ִ� ��� throw ���� ���� ���ܸ� �߻���Ų��.
		// �̶� throw �� �������� ���� ������ �ǰ�, �� ���� "���� ������(exception data)"��� �Ѵ�.
		// try ��� �ȿ� ���¹������ ����Ǵٰ� throw ���� ������,���� �����и� ������ �ȴ�.
		// �̷��� ������ ���� �����ʹ� try ��� ������ ���´� catch ��Ͽ��� �޾Ƴ���.
		if (n2 == 0)
			throw n2;

		cout << "Quotient = " << n1 / n2 << endl;
		cout << "Remainder = " << n1 % n2 << endl;
	}
	// catch ��Ͽ��� throw���� ���� �������� ���� �����͸� �ޱ� ���� �Ű������� �����Ѵ�.
	// �̶� �Ű������� �ڷ����� ���� �޾Ƴ��� catch ����� �����ȴ�.
	catch (int expn)
	{
		cout << "The divisor must not be zero!";
	}

	// try-catch �������̿��� ���� ó���Ҷ� ������ ��
	// 1. throw ���� ���� ���ܰ� �߻����� �� �̸� ó������ ������ ���α׷��� ���� ����ȴ�.
	// 2. ���� �����Ϳ� catch ��� �Ű������� �ڷ����� ��ġ���� ������ ���ܸ� ó���� �� ���� �ȴ�.
	// 3. try ��� ������ ������ �ٸ� ���� ��Ȳ�� �߻��� �� ������ �� ��� ������ ���ܸ�
	//	  ó���ϱ� ���� ���� �������� �ڷ����� �ٸ� �� �ִ�. �׷��� try ��� ������ ������
	//	  catch ����� ���� ���� �� �� �ִ�.
}
*/


// ���� ��ü(exception object)
// �� ���� �߻��� �˸��µ����Ǵ� ��ü
// �� ��ü�� �̿��ؼ����� ��Ȳ�� �˸��� ���ܰ� �߻��� ���ο� ���� ������ ���� �ڼ��ϰ�
//	 ���� ���ִ�.

// ���� Ŭ����(excepton class)
// �� ���� ��ü�� �����ϱ����� ������ Ŭ����
/*
class ZeroDivideException
{

public:

	void Print() const
	{
		cout << "The divisor must not be zero!" << endl;
	}
};

int main() {

	int n1, n2;

	cout << "Enter an integer: ";
	cin >> n1 >> n2;

	try
	{
		if (n2 == 0)
			throw ZeroDivideException();

		cout << "Quotient = " << n1 / n2 << endl;
		cout << "Remainder = " << n1 % n2 << endl;
	}
	catch(ZeroDivideException& expn)
	{
		expn.Print();
	}

}
*/



