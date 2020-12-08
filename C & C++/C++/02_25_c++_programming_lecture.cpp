#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
// ������ ���� Ŭ����
class SampleBase
{
private:
	// ��� ����
	int dataBase;

public:
	// ��� �Լ�
	SampleBase(int n = 0) : dataBase(n)	{}
	void SetDataBase(int n) { dataBase = n; }
	int GetDataBase() const { return dataBase; }
	//void PrintBase() const { cout << "dataBase = " << dataBase << endl; }

	// ���� �Լ�(virtual functino)
	// �� virtual Ű���带 ���ؼ� ������ ��� �Լ�
	// �� ���� �Լ��� ���α׷��� ����� �� �����Ͱ� ����Ű�� ��ü�� �ڷ����� ���� ȣ���� �Լ��� 
	//	  �����ȴ�.
	// �� ���� �Լ��� ��ӵȴ�. (���� ���̵��� ���� Ŭ������ ��� �Լ�)
	virtual void Print() const { cout << "dataBase = " << dataBase << endl; }
};

// ������ ���� Ŭ���� SampleDerived
class SampleDerived : public SampleBase
{
private:
	// ��� ����
	int dataDerived;

public:
	// ��� �Լ�
	SampleDerived(int n1 = 0, int n2 = 0) : SampleBase(n1), dataDerived(n2) {}
	void SetDataDerived(int n) { dataDerived = n; }
	int GetDataDerived() const { return dataDerived; }

	// �Լ� �����ε�(function overloading, �Լ� �ߺ�)
	// �� �Ű������� ������ �ڷ����� �ٸ��� ���� �ĺ��ڸ� ������ �Լ��� �ߺ��ؼ� ������ �� �ִ�.

	// �Լ� �������̵�(function overriding, �Լ� ������)
	// �� ���� Ŭ�������� ���� Ŭ������ ��� �Լ��� �ٽ� ������ �� �ִ�.

	// virtual Ű���带 �ۼ����� �ʾƵ� ���� Ŭ������ ��� �Լ��� ��� �ޱ� ������ ���� �Լ���
	// ���������� virtual Ű���带 �ۼ��ϴ� ���� �����̴�.
	virtual void Print() const
	{ 
		// ���� Ŭ������ �����ǵ� ��� �Լ� ȣ��
		SampleBase::Print();
		cout << "dataDerived = " << dataDerived << endl; 
	}
};

// ���� Ŭ������ ���� Ŭ������ �޴� ���� Ŭ���� SampleDeDerived
class SampleDeDerived : public SampleDerived
{
private:
	// ��� ����
	int dataDeDerived;

public:
	// ��� �Լ�
	SampleDeDerived(int n1 = 0, int n2 = 0, int n3 = 0)
		: SampleDerived(n1, n2), dataDeDerived(n3) {}
	void SetDataDeDerived(int n) { dataDeDerived = n; }
	int GetDataDeDerived() const { return dataDeDerived; }

	virtual void Print() const
	{
		// ���� Ŭ������ �����ǵ� ��� �Լ� ȣ��
		SampleDerived::Print();
		cout << "dataDeDerived = " << dataDeDerived << endl;
	}

};

int main() {

	// ���� Ŭ������ ��ü ����
	SampleDerived objDerived(10, 20);

	// ���
	objDerived.Print();

	//----------------------------------------------------------------------
	// ���� �Ҵ��� ���� ���� Ŭ������ ��ü ����
	SampleDerived* ptrDerived = new SampleDerived(10, 20);

	// ���
	ptrDerived->Print();

	// �������� �Ҵ� ���� ���� ������ �ݵ�� �����ؾ� �Ѵ�.
	delete ptrDerived;

	//-----------------------------------------------------------------------
	// ���� Ŭ������ �����ͷ� ���� Ŭ������ ��ü�� ����ų �� �ִ�.
	// ���� �Ҵ��� ���� ���� Ŭ������ ��ü�� �����ؼ� ���� Ŭ������ �����ͷ� ����
	SampleBase* ptrBase = new SampleDerived(3, 5);

	// �Լ��� ȣ���Ҷ� � �Լ��� ȣ������ �����ϴ� ���
	// 1. ���� ���ε�(static binding)
	//	  �� ������ �Ҷ� �Լ��� �ĺ��� �Ű������� ������ �ڷ����� ���� ȣ���� �Լ��� ����
	//	  �� ��ü�� �ڷ��� �Ǵ� �������� �ڷ����� ���� ȣ���� �Լ��� �����ȴ�.
	// 2. ���� ���ε�(dynamic binding)
	//	  �� ���α׷��� ����Ǵ� �ܰ迡�� ��ü�� �ڷ��� �Ǵ� �����Ͱ� ����Ű�� ��ü�� �ڷ����� 
	//	     ���� ȣ���� �Լ��� �����ȴ�.
	//	  �� C++ ���α׷������� Ŭ������ ��� �Լ��� ���� ���ε��� �ϵ��� �ϱ� ����
	//	     "���� �Լ�(virtual function)"�� �����Ѵ�.

	// ���
	ptrBase->Print();
	// ���: SampleBase�� ��� �Լ��� Print �Լ� ȣ�� (���� ���ε�)
	// Print �Լ��� ���� �Լ��� �����ϸ� SampleDerived�� ��� �Լ��� Print �Լ� ȣ��(���� ���ε�)

	// �������� �Ҵ� ���� ���� ������ �ݵ�� �����ؾ� �Ѵ�.
	delete ptrBase;

	//-------------------------------------------------------------------------------------
	// ���� Ŭ������ �����ͷ� ���� Ŭ������ ��ü�� ����ų �� �ִ�.
	// ���� �Ҵ��� ���� ���� Ŭ������ ��ü�� �����ؼ� ���� Ŭ������ �����ͷ� ����
	ptrBase = new SampleDeDerived(4, 6, 8);

	// ���
	ptrBase->Print();

	// �������� �Ҵ� ���� ���� ������ �ݵ�� �����ؾ� �Ѵ�.
	delete ptrBase;


	return 0;
}
*/

// ������ ���� Ŭ���� SampleBase
class SampleBase
{
private:
	char* dataBase;

public:
	SampleBase(const char* str) : dataBase(nullptr) { SetDataBase(str); }
	SampleBase(const SampleBase& copy) :dataBase(nullptr) { SetDataBase(copy.dataBase); }

	// ���� �Ҹ���(virtual destructor)
	// �� Ŭ�������� ���� �޸� �Ҵ��� �ϴ� ��� �Ϲ������� �Ҹ��ڿ��� �Ҵ� ���� ���� ������
	//	 �����ؾ� �Ѵ�. ������ ...�ϸ� �Ҹ��ڰ� ȣ����� �ʾ� �Ҵ� ���� ��������� ������ ������ �ȴ�.
	// �� ���� �Ҹ��ڴ� �ݵ�� ���� �Լ��� ����Ǿ�� �Ѵ�!
	//   �̷��� �Ҹ��ڸ� ���� �Ҹ��ڶ�� �Ѵ�.
	virtual ~SampleBase() { if (dataBase) delete[] dataBase; }

	void SetDataBase(const char* str)
	{
		if (!str) return;

		int length = strlen(str);

		if (length <= 0) return;

		if (dataBase) delete[] dataBase;

		dataBase = new char[length + 1];

		strcpy(dataBase,str);
	}

	const char* GetDataBase() const { return dataBase; }

	virtual void Print() const { cout << "dataBase = " << dataBase << endl; }
};

// ������ ���� Ŭ���� SampleDerived
class SampleDerived : public SampleBase
{
private:
	char* dataDerived;

public:
	SampleDerived(const char* str1, const char* str2)
		:SampleBase(str1), dataDerived(nullptr)
	{
		SetDataDerived(str2);
	}

	SampleDerived(const SampleDerived& copy) 
		: SampleBase(copy), dataDerived(nullptr)
	{
		SetDataDerived(copy.dataDerived);
	}

	virtual ~SampleDerived() { if (dataDerived) delete[] dataDerived; }

	void SetDataDerived(const char* str)
	{
		if (!str) return;

		int length = strlen(str);

		if (length <= 0) return;

		if (dataDerived) delete[] dataDerived;

		dataDerived = new char[length + 1];

		strcpy(dataDerived, str);
	}

	const char* GetDataDerived()const { return dataDerived; }

	virtual void Print() const 
	{ 
		SampleBase::Print();
		cout << "dataDerived = " << dataDerived << endl; 
	}

};

int main() {

	// ���� Ŭ������ ��ü�� ���� Ŭ������ ��ü ����
	SampleBase objBase("Hello World!");

	SampleDerived objDerived("Dream come true!", "Boys, Be ambitious!");

	objBase.Print();
	objDerived.Print();

	cout << "----------------------------------------------------------------" << endl;

	// ���� Ŭ������ �����ڷ� ���� Ŭ������ ��ü�� ������ �� �ִ�.
	// SampleBase& refBase = objBase;
	SampleBase& refBase = objDerived;

	refBase.Print();
	// �� Print ��� �Լ��� ���� �Լ��̹Ƿ� ���α׷��� ����Ǵ� �ܰ迡�� � �Լ��� ȣ������
	//	  �����Ѵ�. �̶� ���� Ŭ������ �������� ��ü�� ���� Ŭ������ ��ü��� ���� Ŭ������ 
	//	  ��� �Լ��� ȣ��ȴ�.

	cout << "----------------------------------------------------------------" << endl;

	// ���� �Ҵ��� ���� ���� Ŭ������ ��ü�� �����ϰ� �� ��ü�� ���� Ŭ������ �����ͷ� ����
	SampleBase* ptrBase = new SampleDerived("Michale Jackson", "Harry Potter");

	// ���
	ptrBase->Print();
	// �� (*ptrBase).Print();

	// �������� �Ҵ� ���� ���� ������ �ݵ�� �����ؾ� �Ѵ�.
	// ȣ�� �Ǵ� �Ҹ��ڴ� ~SampleBase ��, ���� Ŭ������ �Ҹ��ڸ� ȣ��Ǿ� dataBase�� ���� ������ �����Ѵ�.
	// �׷��Ƿ� dataDerived�� ��������� �������� �����Ƿ� �޸� ������ �߻��Ѵ�.
	// ���� Ŭ������ �Ҹ��ڸ� ���� �Լ��� �����Ѵٸ� �������� �ڷ����� �ƴ϶� ��ü�� �ڷ����� ���� �Ҹ��ڸ� 
	// ȣ���ϱ� ������ ���� Ŭ������ �Ҹ��ڰ� ȣ��� ���� ���� Ŭ������ �Ҹ��ڰ� ȣ��ȴ�.
	delete ptrBase;


	return 0;
}