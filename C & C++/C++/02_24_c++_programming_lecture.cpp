#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
///*
// 간단한 기초 클래스 SampleBase
class SampleBase
{
private:
	// 멤버 변수
	int dataBase;

public:
	// 멤버 함수
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

// SampleBase를 상속받는 간단한 유도 클래스 SampleDerived
class SampleDerived : public SampleBase
{
private:
	// 멤버 변수
	int dataDerived;

public:
	// 멤버 함수

	// 유도 클래스의 생성자
	// 1. 유도 클래스의 생성자에서는 기초 클래스의 멤버 변수 또한 초기화시켜야 할 의무가 있다.
	// 2. 유도 클래스의 객체는 기초 클래스의 객체가 포함된 형태이며 유도 클래스의 객체가 생성될
	//	  때 기초 클래스의 객체 또한 생성된다.
	//	  이때 기초 클래스의 생성자가 호출된다.
	// 3. 기초 클래스의 멤버 변수는 기초 클래스 생성자의 멤버 초기화 리스트를 통해서 초기화해야
	//	  한다. 유도 클래스의 멤버 초기화 리스트에서 기초 클래스의 생성자를 명시해주면
	//	  기초 클래스가 생성될 때 이 생성자를 통해 전달된 값으로 초기화시킬 수 있다.
	// 4. 만약 유도 클래스 생성자의 멤버 초기화 리스트에 기초 클래스의 생성자를 명시해주지 않으면
	//	  기초 클래스의 기본 생성자가 호출된다.
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

	// 유도 클래스의 객체 생성
	// 1. 유도 클래스 생성자 호출
	// 2. 유도 클래스 생성자의 멤버 초기화 리스트를 통해 멤버 변수의 초기화
	// 3. 기초 클래스의 생성자 호출
	// 4. 기초 클래스 생성자의 멤버 초기화 리스트를 통해 멤버 변수의 초기화
	// 5. 기초 클래스 생성자의 본체가 실행
	// 6. 유도 클래스 생성자의 본체가 실행
	SampleDerived objDerived(10, 20);

	// 출력
	// objDerived.PrintBase();
	objDerived.PrintDerived();

	// 유도 클래스의 객체 소멸
	// → 1. 유도 클래스의 소멸자 호출
	//   2. 기초 클래스의 소멸자 호출

	return 0;
}
//*/

// 기초 클래스 Flower
class Flower
{
private:
	// 멤버 변수
	char name[81];
	int price;

public:
	// 멤버 함수
	Flower(const char* _name, int _price = 0)
		: name{0}, price(0)
	{
		SetName(_name);
		SetPrice(_price);
	}
	void SetName(const char* str)
	{
		// 배열에 문자열을 저장할 때는 복사한다.
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

	// 동적 할당을 통해 유도 Rose 클래스의 객체 생성
	Rose* rose = new Rose;

	// 동적 할당을 통해 유도 Tulip 클래스의 객체 생성
	Tulip* tulip = new Tulip;

	// 출력
	rose->Print();
	tulip->Print();

	// 동적으로 할당 받은 메모리 해제
	delete rose;
	delete tulip;

	return 0;
}