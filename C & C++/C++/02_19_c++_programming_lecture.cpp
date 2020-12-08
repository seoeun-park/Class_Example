#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
// ������ Ŭ���� Sample
class Sample
{
private:
	// ��� ����
	int data;

public:
	// ��� �Լ�

	// ������(constructor)
	Sample() :data(0) { }

	// ��ȯ ������(conversion constructor)
	// �� �ٸ� ���� �ڷ����� Ŭ���� �ڷ����� �������� ��ȯ�� �� ȣ��Ǵ� ������
	Sample(int n) : data(n) { }

	// ��ȯ ������: double �ڷ����� ���� sample �ڷ����� ������ �� ��ȯ�� �� ȣ��Ǵ� ������
	// Sample(double n) : data(n) { }

	// ��ȯ �Լ�(conversion function)
	// �� sample �ڷ����� ���� �ٸ� �ڷ����� ������ ��ȯ�� �� ȣ��Ǵ� ��� �Լ�
	// �� ��ȯ �Լ��� sample �ڷ����� �� ��ȯ ������(cast operator)�� �����ϴ� ���̴�.
	operator int()
	{
		// ������ �Լ��� ��ȯ ���� ���� ����� �ȴ�.
		return data;
	}

	operator double()
	{
		return (double)data;
	}

	// ������(setter)
	void SetData(int n) { data = n; }

	// ������(getter)
	int GetData() { return data; }

	// ���
	void Print() { cout << "data = " << data << endl; }


};

// Sample Ŭ������ ��ü�� �Ű������� ���� �޾� ����� �� ��ü�� ��ȯ
// Sample& PrintSample(const Sample& obj)
// Sample obj = obj;(obj ��ü�� �ƴ� �ӽ� ��ü�� �����Ǿ� ���� ����� �� �ʱ�ȭ)
// �� �Ű� ������ ��ü�� ��� ���ο� ��ü�� �ƴ� �����ڸ� �����Ѵ�.
//{
	// const�� ���̴� ����?
	// ���ο� ���� ������ ���� ��ü�� �����Ǿ� ���� �����ϴ� ���� �ƴ϶� �Ȱ��� ���� ������ �ִ� ���� 
	// �����ڸ� ���� �����ϴ� ���̹Ƿ� ���� �̷�������(obj.SetData(20))������� �ٲ��� ���ϰ� �ϱ� ���ؼ�

	//obj.Print();

	//return obj;

//}

int main() {

	// ��ü ����
	Sample obj(10);

	// PrintSample �Լ��� ���� ��ü obj�� ���
	//obj = PrintSample(obj);

	// ���
	obj.Print();

	// ��ü obj�� 20�� ����
	obj = 20;
	// �� obj = (Sample)20;
	// �� obj = Sample(20);		�� �ӽ� ��ü�� ������ �� ���� ����
	// �ӽ� ��ü ���� �� �����ڰ� ȣ��Ǵµ� int�� ���� ���޵ǹǷ� ��ȯ ������(Sample(int n) : data(n) { })�� ȣ��ȴ�.

	// �ӽ� ��ü (temporary object)
	// �� Ŭ������ �ڷ����� ������ ��ȯ�ǰų�, �Լ������� �Ű������� Ŭ������ �ڷ����� �Ű������� ���� �����ϰų�,
	//	  �Լ����� ��ü�� ��ȯ�ϴ� ��Ȳ������ �ӽ÷� ��ü�� �����ȴ�. 
	//	  �̷��� ��ü�� �ӽ� ��ü��� �Ѵ�.
	// �� �ӽ� ��ü�� �����ڷ� �����ϴ� ��Ȳ�� �ƴ϶�� ������ ������ ���� �Ҹ��Ѵ�.

	// double value = 10;
	// �� double value = (double)10;

	// ���
	obj.Print();

	// ��ü obj�� 3.14�� ����
	obj = 3.14;
	// �� obj = (Sample)3.14;
	// �� obj = Sample(3.14);
	// �� obj = Sample(3);		�� �ӽð�ü ���� �� �������� �Ű������� int �ڷ����̱� ������ �� ��ȯ�� �Ͼ��.


	// ���
	obj.Print();

	// ��ü obj�� int �ڷ����� ������ ����
	int value = obj;
	// �� int value = (int)obj;
	// �� �� ���忡���� sample �ڷ����� �� obj�� int �ڷ����� ������ �� ��ȯ�Ϸ��� �õ�������
	//	  �ٲܼ� ���� ������ ������ �߻��Ѵ�.
	//	  �� ������ �ذ��ϱ����ؼ��� sample �ڷ������� int �ڷ������� �� ��ȯ�� �� �ִ� �����
	//	  �����ؾ� �Ѵ� �̸� ��ȯ �Լ�(conversion function) ��� �Ѵ�.
	
	// ���
	cout << "value = " << value << endl;


	return 0;
}
*/

/*
// ������ Ŭ���� Sample
class Sample
{
private:
	// ��� ����
	int data;

	// ��� ��� ����(constant member variable)
	// �� const Ű���带 �ٿ��� ������ ��� ����
	// �� ����̱� ������ ������ ����� �� �ʱ�ȭ ������� �ϱ� ������ �ݵ�� �������� ��� �ʱ�ȭ ����Ʈ���� 
	//	  �ʱ�ȭ���Ѿ� �Ѵ�.
	const int MAX;

public:
	// ��� �Լ�
	Sample(int n = 0) : data(0), MAX(256) { SetData(n); }
	
	// Ư���� ��찡 �ƴ϶��, �����ڿ� �����ڴ� ��� ��� �����鿡 ���� �����س��ƾ� �Ѵ�.
	void SetData(int n) 
	{ 
		data = (n > MAX) ? MAX : n;
	}

	// ��� ��� �Լ�(constant member function)
	// �� const Ű���带 �ٿ��� ������ ��� �Լ�
	// �� ��� ��� �Լ������� ��� ������ ���� �ٲ� �� ����.
	// �� ��� ��ü������ ��� ��� �Լ��� ȣ���� �� �ִ�.
	//	  ���� ��� ������ ���� �����ϴ� ��� �Լ��� �ƴ϶��, ��� ��� �Լ��� �����ϴ� �� ����.
	//	  (���⿡���� �����ڰ� ��� ������ ���� �����ϴ� ��� �Լ��̹Ƿ� ��� ��� �Լ��� �����ϸ� x)
	// �� const ���� ���δ� �Լ� �����ε�(function overloading)�� ������ �ȴ�.
	int GetData() const { return data; }
	void Print() const { cout << "data = " << data << endl; }
	void Print() { cout << "data = " << data << endl; }		// �Լ� �����ε�

	// friend �Լ�
	// �� Ŭ���� �ܺ��� �Լ����� �� Ŭ������ private ����� ������ �� �ֵ��� ������ �ο�
	friend void PrintSample(const Sample& ref);

	// friend Ŭ����
	// �� �ٸ� Ŭ������ ��� �Լ����� �� Ŭ������ private ����� ������ �� �ֵ��� ������ �ο�
	friend class ContSample;

	// friend ������ ������
	// �� friend ������ ��ü ������ ��ǥ���� Ư¡�� "���� ����"�� ���ʶ߸���.
	//	  �׷��� �׷� ���� �ٸ� �������� �߱��ϰ� �ȴ�.
	// �� friend ������ �� �ʿ��� ��쿡�� �ұ������� ����ؾ� �Ѵ�.
	// �� friend�� ����ϱ� ������ �����ڿ� �����ڸ� Ȱ���ؾ� �Ѵ�.
};

// Ŭ���� �ܺ��� �Լ����� Ŭ���� private ����� �����ϴ� �Լ�
void PrintSample(const Sample& ref)
{
	//ref.Print();

	cout << "ref.data = " << ref.data << endl;
	cout << "ref.data = " << ref.GetData << endl;
}

// Sample �ڷ����� ��� ������ ���� ContSample Ŭ����
class ContSample
{
private:
	Sample obj;

public:
	ContSample(int n) : obj(n) {}

	// void SetObj(int n) { obj.data = n; }
	void SetObj(int n) { obj.SetData = n; }

	// int GetObj() { return obj; }
	int GetObj() { return obj.GetData; }

	// void Print() { cout << "obj.data = " << obj.data << endl; }
	void Print() { cout << "obj.data = " << obj.GetData << endl; }
};

int main() {

	// ��� ��ü(constant object)
	// �� ��� ��ü�� ����� ���� ���� �ٲ� �� ����, ��� ��� �Լ��� ȣ���� �� �ִ�.
	const Sample obj;

	// obj.SetData(20);
	// ������ ����

	obj.Print();		// void Print() const ȣ��
	
	// ��ü ����
	Sample obj2(20);

	// ���
	obj2.Print();		// void Print() ȣ��

	// 
	PrintSample(obj2);	// void Print() const ȣ��


	return 0;
}
*/