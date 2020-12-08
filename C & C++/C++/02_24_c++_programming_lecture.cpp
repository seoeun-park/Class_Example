#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
///*
// ������ ���� Ŭ���� SampleBase
class SampleBase
{
private:
	// ��� ����
	int dataBase;

public:
	// ��� �Լ�
	SampleBase(int n = 0) :dataBase(n)
	{
		cout << "SampleBase::SampleBase (int n)" << endl;
	}

	~SampleBase()
	{
		cout << "SampleBase::~SampleBase (int n)" << endl;
	}

	void SetSampleBase(int n) { dataBase = n; }
	int GetSampleBase() const { return dataBase; }
	void PrintBase() const { cout << "dataBase = " << dataBase << endl; }
};
//---------------------------------------------------------------------------

// SampleBase�� ��ӹ޴� ������ ���� Ŭ���� SampleDerived
class SampleDerived : public SampleBase
{
private:
	// ��� ����
	int dataDerived;

public:
	// ��� �Լ�

	// ���� Ŭ������ ������
	// 1. ���� Ŭ������ �����ڿ����� ���� Ŭ������ ��� ���� ���� �ʱ�ȭ���Ѿ� �� �ǹ��� �ִ�.
	// 2. ���� Ŭ������ ��ü�� ���� Ŭ������ ��ü�� ���Ե� �����̸� ���� Ŭ������ ��ü�� ������
	//	  �� ���� Ŭ������ ��ü ���� �����ȴ�.
	//	  �̶� ���� Ŭ������ �����ڰ� ȣ��ȴ�.
	// 3. ���� Ŭ������ ��� ������ ���� Ŭ���� �������� ��� �ʱ�ȭ ����Ʈ�� ���ؼ� �ʱ�ȭ�ؾ�
	//	  �Ѵ�. ���� Ŭ������ ��� �ʱ�ȭ ����Ʈ���� ���� Ŭ������ �����ڸ� ������ָ�
	//	  ���� Ŭ������ ������ �� �� �����ڸ� ���� ���޵� ������ �ʱ�ȭ��ų �� �ִ�.
	// 4. ���� ���� Ŭ���� �������� ��� �ʱ�ȭ ����Ʈ�� ���� Ŭ������ �����ڸ� ��������� ������
	//	  ���� Ŭ������ �⺻ �����ڰ� ȣ��ȴ�.
	SampleDerived(int n1 = 0, int n2 = 0) : SampleBase(n1), dataDerived(n2)
	{
		cout << "SampleDerived::SampleDerived(int n)" << endl;
	}

	~SampleDerived()
	{
		cout << "SampleDerived::~SampleDerived(int n)" << endl;
	}

	void SetDataDerived(int n) { dataDerived = n; }
	int GetDataeDerived() const { return dataDerived; }
	void PrintDerived() const 
	{ 
		PrintBase();
		// cout << "dataBase = " << dataBase << endl;

		cout << "dataDerived = " << dataDerived << endl;
	}
};

int main() {

	// ���� Ŭ������ ��ü ����
	// 1. ���� Ŭ���� ������ ȣ��
	// 2. ���� Ŭ���� �������� ��� �ʱ�ȭ ����Ʈ�� ���� ��� ������ �ʱ�ȭ
	// 3. ���� Ŭ������ ������ ȣ��
	// 4. ���� Ŭ���� �������� ��� �ʱ�ȭ ����Ʈ�� ���� ��� ������ �ʱ�ȭ
	// 5. ���� Ŭ���� �������� ��ü�� ����
	// 6. ���� Ŭ���� �������� ��ü�� ����
	SampleDerived objDerived(10, 20);

	// ���
	// objDerived.PrintBase();
	objDerived.PrintDerived();

	// ���� Ŭ������ ��ü �Ҹ�
	// �� 1. ���� Ŭ������ �Ҹ��� ȣ��
	//   2. ���� Ŭ������ �Ҹ��� ȣ��

	return 0;
}
//*/

// ���� Ŭ���� Flower
class Flower
{
private:
	// ��� ����
	char name[81];
	int price;

public:
	// ��� �Լ�
	Flower(const char* _name, int _price = 0)
		: name{0}, price(0)
	{
		SetName(_name);
		SetPrice(_price);
	}
	void SetName(const char* str)
	{
		// �迭�� ���ڿ��� ������ ���� �����Ѵ�.
		strncpy(name, str, 80);
	}

	void SetPrice(int n)
	{
		price = (n < 0) ? 0 : n;
	}

	const char* GetName() const { return name; }
	int GetPrice() const { return price; }

	void Print() const
	{
		cout << "Name: " << name << endl;
		cout << "Price: " << price << endl << endl;
	}
};

class Rose : public Flower
{
public:
	Rose () : Flower("Rose", 100) {}
};

class Tulip : public Flower
{
public:
	Tulip() : Flower("Tulip", 200) {}
};

int main() {

	// ���� �Ҵ��� ���� ���� Rose Ŭ������ ��ü ����
	Rose* rose = new Rose;

	// ���� �Ҵ��� ���� ���� Tulip Ŭ������ ��ü ����
	Tulip* tulip = new Tulip;

	// ���
	rose->Print();
	tulip->Print();

	// �������� �Ҵ� ���� �޸� ����
	delete rose;
	delete tulip;

	return 0;
}