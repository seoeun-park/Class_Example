#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;

/*
// ������ Ŭ���� Sample
class Sample {

private:
	// ��� ����(member variable)
	int data;
public:
	// ��� �Լ�(member function)

	// ������(constructor)
	// �� ��ü�� ������ �� �ڵ����� ȣ��
	Sample(int n = 0) : data(n)
	{
		cout << "Sample::Sample(int n)" << endl;
	}

	// �Ҹ���(destructor)
	// �� ��ü�� �Ҹ�� �� �ڵ����� ȣ��
	// FILO (First In Last Out) : ���� ������ �޸𸮰� �Ҵ�� ���� 
	//							  ���� ���� �޸𸮰� ���� ���߿� �Ҹ�ȴ�.
	~Sample()
	{
		cout << "Sample::~Sample() - data = " << data << endl;
	}

	// ������(setter)
	void SetData(int n) { data = n; }

	// ������(getter)
	int GetData() { return data; }

	// ���
	void Print() { cout << "data = " << data << endl; }
};

int main() {

	// ��ü(object): �ڷ����� Ŭ������ ����
	Sample obj(10);

	// ��ü �迭(object array)
	// �� ��ü �迭�� �� ���Ұ� ��ü�̴�. ��, �迭�� ������ �� ������ ������ŭ �����ڰ� ȣ��ȴ�. 
	Sample list[10];

	// ��ü ������(object pointer)
	Sample* ptr = list;

	// �ݺ����� �̿��� ��ü�� �迭�� �� ����
	for (int i = 0; i < 10; i++)
		ptr[i].SetData(i + 1);

	// �ݺ����� �̿��� ��ü �迭�� �� ���
	for (int i = 0; i < 10; i++)
		list[i].Print();

	//---------------------------------------------------------------------------------
	// ���� �޸� �Ҵ�
	// ���ο� ��������� �Ҵ� �� ��ü ���� �� ������ ȣ��
	// new �����ڸ� �̿��� �������� �޸𸮸� �Ҵ��ϸ� ��ü�� �����ȴ�. �̶� �����ڰ� ȣ��ȴ�.
	// �����ڿ� ���� ������ ���� �ִ�.
	ptr = new Sample(20);

	(*ptr).Print();
	// ptr.Print();		�� ���� ������(.)�� �ǿ����ڰ� ��ü���߸� �ϹǷ� �̷��� ���� x
	// ���� �����ڰ� ������ �����ں��� �켱������ ���� ������ �߰�ȣ�� ������� �Ѵ�.

	// ���� ��� ���� ������(->)
	ptr->Print();

	// �������� �Ҵ� ���� ���� ������ �ݵ�� �����ؾ� �Ѵ�.
	delete ptr;

	//--------------------------------------------------------------------------------
	const int LENGTH = 10;

	// ���� �޸� �Ҵ�
	ptr = new Sample[LENGTH];

	// �ݺ����� �̿��� ���� ����
	for (int i = 0; i < LENGTH; i++)
		ptr[i].SetData(i + 31);

	// �ݺ����� �̿��� ���
	for (int i = 0; i < LENGTH; i++)
		ptr[i].Print();
	// �� (*(ptr + i)).Print();
	// �� (ptr+ i)->Print();

	// �������� �Ҵ���� ���� ���� ����
	// �� �Ҹ��� ȣ��
	delete[] ptr;

	//------------------------------------------------------------------------------
	// ��ü ������ �迭 ����
	// �� �迭�� �� ���Ұ� ��ü �������� �迭
	Sample* ptrList[LENGTH];

	// �ݺ����� �̿��� ������ �迭�� �� ���ҿ� ���� �޸� �Ҵ�
	for (int i = 0; i < LENGTH; i++)
		ptrList[i] = new Sample(i + 51);

	// �ݺ����� �̿��� ��ü ������ �迭�� �� ���
	for (int i = 0; i < LENGTH; i++)
		ptrList[i]->Print();

	// �ݺ����� �̿��� ��ü ������ �迭�� �Ҵ� ���� ���� ���� ����
	for (int i = 0; i < LENGTH; i++)
		delete ptrList[i];

	return 0;
}
*/

//----------------------------------------------------------------------------
/*
class Sample {

private:

	// ��� ����(member variable)
	int data;

public:
	// ��� �Լ�(memeber function)

	// ������(constructor)
	Sample(int n = 0) : data(n) { }

	// ������(setter)
	void SetData(int data)
	{
		// ���� ������ ��� ������ �ĺ��ڰ� �浹�� �� ��� ������ �о���� ���� ��
		// this ������: ��� �Լ����� ��ü�� ����Ű�� ������
		this->data = data;
		// �� (*this).data = data
	}

	// ������(getter)
	int GetData() { return data; }

	// ���
	void Print() { cout << "data = " << data << endl; }

	Sample& Adder(int n) { 
		data += n; 
		
		// ��� �Լ����� ��ü �� �ڽ��� ��ȯ

		// �ڱ� ������(self reference)
		// �� ��ü �ڽ��� ������ �� �ִ� ������
		// �� this �����͸� �̿��� ��ü�� �ڽ��� ������ ����� �� �ִ� �����ڸ� ��ȯ�ϴ�
		//	  ��� �Լ��� �ۼ��� �� �ִ�.
		return *this;
	}
};

int main() {

	// ��ü ����
	Sample obj(10);

	// ���
	obj.Print();

	// �����ڸ� �̿��� ��� ������ �� ����
	obj.SetData(20);

	// ���
	obj.Print();

	// ��� �Լ��� �̿��� ��� ������ ���� ����
	obj.Adder(3);
	
	// ���
	obj.Print();

	// ��� �Լ��� �����ؼ� ȣ��
	obj.Adder(5).Print();

	return 0;
}
*/

//--------------------------------------------------------------
/*
class Sample {

private:

	// ��� ����(member variable)
	int data;

public:
	// ��� �Լ�(member function)

	// ������(constructor)
	Sample(int n = 0) : data(n) { }

	// �⺻ �Ҹ���(default destructor)
	// ~Sample() {}

	// ���� ������(copy constructor)
	// �� �ش� Ŭ������ ��ü�� ���ڷ� �޴� ������
	// �� ���� �����ڴ� ��ü�� ��ü�� �ʱ�ȭ�� �� �Լ��� ���ڷ� ��ü�� ������ ��
	//	  �Լ����� ��ü�� ��Ȱ�� �� ȣ��ȴ�.

	// �⺻ ���� ������(default copy constructor)
	// �� Ŭ������ ���� �����ڰ� ���ǵǾ� ���� ������ �⺻ ���� �����ڰ� �ڵ����� �߰�
	// �� ���� �Ϲ����� ��쿡�� ���� �����ڸ� �������� �ʾƵ� �ȴ�.
	// �� �⺻ ���� �����ڿ����� ���ڷ� ���޵� ��ü�� ��� ������ ��� ������ �ʱ�ȭ�Ѵ�.
	//	  �̸� "��� �� ��� ����"��� �Ѵ�.
	// Sample(const Sample& copy) : data(copy.data) { }
	// Sample(const Sample& copy) : x(copy.x), y(copy.y) { }


	// ������(setter)
	void SetData(int n) { data = n; }

	// ������(getter)
	int GetData() { return data; }

	// ���
	void Print() { cout << "data = " << data << endl; }
};

int main() {

	// ��ü ����
	Sample obj1(10);

	// ��ü�� �̿��� ��ü�� �ʱ�ȭ
	Sample obj2 = obj1;
	// �� Sample obj2(obj1);
	// �� ���忡���� Sample Ŭ������ ���� �����ڰ� ȣ��ż� ��ü obj1�� ��� ������ ������
	// ��ü obj2�� ��� ������ �ʱ�ȭ�ȴ�.

	obj2.Print();

	return 0;
}
*/

//-----------------------------------------------------------------------
/*
class Sample
{
private:

	// ��� ����
	char* data;
	// �� �������� ���� ������ �Ҵ�޾� ���ڿ��� ����

public:

	// ��� �Լ�

	// ������
	Sample(const char* str) : data(nullptr)
	{
		// �����ڸ� �̿��� ���ڷ� ���޵� ���ڿ��� ��� ���� data�� ����
		SetData(str);

	}

	// �⺻ ���� ������
	// �� ��� �� ��� ����, "���� ����"�� �����Ѵ�.
	// Sample(const Sample& copy) : data(copy.data) { }

	// ���� ������
	// �� "���� ����"�� �� �� �ֵ��� ���� �����ڸ� �����Ѵ�.
	// �� ��� ������ �������� ���, �� �ּҿ� ����Ǿ� �ִ� ���� �����ϴ� ���� "���� ����"��� �Ѵ�.
	//	  �ּҸ� �����ϴ� ���� �ǹ̰� ����. �� �ּҿ� ����� ���� �����ؾ��Ѵ�.
	Sample(const Sample& copy) :data(nullptr)
	{
		// �����ڸ� �̿��� �Ű������� ���޵� ��ü�� ��� ����, �� �����Ͱ� ����Ű�� ����
		// ����Ǿ� �ִ� ���� �����Ѵ�.
		SetData(copy.data);
	}

	// �Ҹ���: ��ü�� �Ҹ�� �� ��ü���� �Ҵ���� �ý��� �ڿ��� ����
	// �� ��ü���� �������� �Ҵ���� ���� ������ �Ҵ� �޾Ҵٸ� �Ҹ��ڿ��� �̸� �����Ѵ�.
	~Sample()
	{
		// ��ü���� �Ҵ� ���� ���� ������ �ִ� ��� ��� ���� data���� �� ��������� �ּҰ�
		// ����Ǿ����� ���̰� �׷� ��� �Ҵ� ���� ���� ������ �����Ѵ�.
		if (data) delete[] data;
	}

	void SetData(const char* str)
	{
		// ���ڷ� ���޵� ���� ����ε� ���ڿ����� Ȯ��
		if (!str) return;

		// ���ڿ��� ���� ���
		int length = strlen(str);
		
		// ���ڷ� ���޵� ���� ����� �� ���ڿ��� �ƴϸ� �Լ� ����
		if (length <= 0) return;

		// ������ �Ҵ� ���� ���� ������ ������ �� ���� ������ ���� �����Ѵ�.
		if (data) delete[] data;

		// ���ڿ��� ���̸�ŭ �������� ��������� �Ҵ�
		data = new char[length + 1];
		// �� new �����ڸ� �̿��� �������� ���� ������ �Ҵ��� �� ���� ������ �Ҵ����� ���ϸ�
		//	  new �������� �������� nullptr�� �ȴ�.

		// ����� ���� ������ �Ҵ� �޾Ҵ��� Ȯ��
		if (!data)
		{
			// ���� �޽��� ���
			cout << "ERROR : Insufficient memory!" << endl;

			// exit �Լ�: ���α׷��� ������ �����ϴ� �Լ�
			exit(1);
		}
		strcpy(data, str);
	}
	
	//������
	const char* GetData() { return data; }

	// ���
	void Print() { cout << "data = " << data << endl; }
};

int main() {

	// ��ü ����
	Sample obj1("Hello World!");

	// ���
	obj1.Print();

	// ���� ��ü�� ���ο� ��ü�� �ʱ�ȭ
	Sample obj2 = obj1;
	// �� Sample obj2(obj1); �� ��ü�� ���޹޴� ������ ȣ��
	// ���� ���縦 ���� ������ ���� �޸𸮸� �����ϴ� �������� ������ ���.

	// ���
	obj2.Print();


	return 0;
}
*/