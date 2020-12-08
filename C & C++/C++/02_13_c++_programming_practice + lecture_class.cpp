#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
// ��������: �Ӽ�(�̸�, ����)�� ���(�Ӽ����� ���� ���)�� ������ ���(Person)�� Ŭ������ �����϶�.
//			 �� ����ü
struct person
{
	char name[81];
	int age;
};

void Print(struct person p) {

	cout << "name = " << p.name << endl << "age = " << p.age << endl;

}

int main() {

	struct person pos;

	strcpy(pos.name, "Michael Jackson");

	pos.age = 25;

	Print(pos);

	return 0;
}
*/

/*
//-----------------------------------------------------------------
// �������� �� Ŭ����
class Person {

// ���� ���� ������
private:

	// ��� ����(member variable)
	// �� Ư���� ��찡 �ƴ϶�� ��� ������ �Ϲ������� private ����� ����
	char name[256];
	int age;

public:

	// ��� �Լ�(member function)
	// �� ��� �Լ��� Ư���� ��찡 �ƴ� �̻� public ����� ����

	// ������(setter)
	// �� ��� ������ private ����� �����ؼ� �ܺο��� ������ �� ������ �����ϰ�
	//	  ��� ������ ���� �����ϱ� ���� ��� �Լ��� �̿��Ѵ�.
	// �� �����ڸ� ����ϴ� ������ �ܺο��� ��� ������ �߸��� ���� �������� ���ϵ��� �� �� �ִ�.
	// �� �������� �ĺ��ڴ� ���� ("Set + �������")�� �ĺ��ڷ� �ۼ��Ѵ�. 
	void SetName(const char* str)
	{
		// �� �Ű������� ����� �����ϴ� ������ �Ű������� ���޵� ���� �Լ� ������ �������� 
		//	  �ʰڴٴ� ���� ��Ÿ���� ���� �Ű������� ����� �����Ѵ�.
		// �� ���ڿ� ����� ���� �޴� �Ű������� �ݵ�� const char* �ڷ������� �����ؾ� �Ѵ�.
		strncpy(name, str, 256);
	}

	void SetAge (int n) 
	{
		// �����ڸ� �̿��� ��� ������ �߸��� ���� �����Ǵ� ���� �����Ѵ�.
		age = (n < 0) ? 0 : n;
	}

	// ������(getter) 
	// ��  ��� ������ ���� ��ȯ�ϴ� ��� �Լ�
	// �� �������� �ĺ��ڴ� ���� ("Get + "��� ������ �ĺ���")�� �ۼ��Ѵ�.
	const char* GetName() { return name; }
	// �� ��� �Լ��� ��ȯ ���� �ּ��� ��� ��ü �ܺο��� �� �ּҸ� ���� ��� ������ ����
	//	  ������ ���ִ�. ���� �̷��� ��� �Լ��� ��ȯ���� �ּ��� ��쿡�� ����� �����Ѵ�.

	int GetAge() { return age; }

	void Print ()
	{
		cout << "Name: " << name << endl;
		cout << "Age: " << age << endl << endl;
	}
};

int main() {

	// ��ü(object): �ڷ����� Ŭ������ ����
	Person pos;

	// ��� ���� �����ڸ� �̿��� ��� ������ ����
	// pos.name�� �迭���� ���(�ּ�)�̰� ���ڿ��� ���(�ּ�)�̹Ƿ� ���� ������ �� ����.
	// ���ڿ��� �迭�� ������ ���� ���ڿ��� �迭�� �����ؾ� �Ѵ�.
	// �׷��� ��� ������ private ����� ������ ��� 
	// ��� ���� �����ڸ� �̿��� ��� ������ ������ �� ���� �ȴ�.
	// strncpy(pos.name, "Michael Jackson", 256);

	// �迭(array): �迭�� �Ҵ�� ��������� �����ּ� 
	// �� �� �ּҴ� ������ �� ����.
	// ���ڿ� ���(string constant): ���ڿ��� ����� ���� ������ ���� �ּ�
	// �� �� �ּҿ� �� �ּҿ� ����� ���� ������ �� ����.
	pos.SetName("Michael Jackson");

	pos.SetAge(25);

	// ��� ���� �����ڸ� �̿��� ��� �Լ� ȣ��
	pos.Print();

	cout << "Jackson's age is " << pos.GetAge() << endl;
	cout << "Jackson's name is " << pos.GetName() << endl << endl;

	return 0;
}
*/