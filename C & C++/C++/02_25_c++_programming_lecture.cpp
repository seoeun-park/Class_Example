#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
// 간단한 기초 클래스
class SampleBase
{
private:
	// 멤버 변수
	int dataBase;

public:
	// 멤버 함수
	SampleBase(int n = 0) : dataBase(n)	{}
	void SetDataBase(int n) { dataBase = n; }
	int GetDataBase() const { return dataBase; }
	//void PrintBase() const { cout << "dataBase = " << dataBase << endl; }

	// 가상 함수(virtual functino)
	// → virtual 키워드를 통해서 선언한 멤버 함수
	// → 가상 함수는 프로그램이 실행될 때 포인터가 가리키는 객체의 자료형에 따라 호출할 함수가 
	//	  결정된다.
	// → 가상 함수는 상속된다. (오버 라이딩된 유도 클래스의 멤버 함수)
	virtual void Print() const { cout << "dataBase = " << dataBase << endl; }
};

// 간단한 유도 클래스 SampleDerived
class SampleDerived : public SampleBase
{
private:
	// 멤버 변수
	int dataDerived;

public:
	// 멤버 함수
	SampleDerived(int n1 = 0, int n2 = 0) : SampleBase(n1), dataDerived(n2) {}
	void SetDataDerived(int n) { dataDerived = n; }
	int GetDataDerived() const { return dataDerived; }

	// 함수 오버로딩(function overloading, 함수 중복)
	// → 매개변수의 개수나 자료형이 다르면 같은 식별자를 가지는 함수를 중복해서 정의할 수 있다.

	// 함수 오버라이딩(function overriding, 함수 재정의)
	// → 유도 클래스에서 기초 클래스의 멤버 함수를 다시 정의할 수 있다.

	// virtual 키워드를 작성하지 않아도 기초 클래스의 멤버 함수를 상속 받기 때문에 가상 함수로
	// 설정되지만 virtual 키워드를 작성하는 것이 관례이다.
	virtual void Print() const
	{ 
		// 기초 클래스의 재정의된 멤버 함수 호출
		SampleBase::Print();
		cout << "dataDerived = " << dataDerived << endl; 
	}
};

// 유도 클래스를 기초 클래스로 받는 유도 클래스 SampleDeDerived
class SampleDeDerived : public SampleDerived
{
private:
	// 멤버 변수
	int dataDeDerived;

public:
	// 멤버 함수
	SampleDeDerived(int n1 = 0, int n2 = 0, int n3 = 0)
		: SampleDerived(n1, n2), dataDeDerived(n3) {}
	void SetDataDeDerived(int n) { dataDeDerived = n; }
	int GetDataDeDerived() const { return dataDeDerived; }

	virtual void Print() const
	{
		// 기초 클래스의 재정의된 멤버 함수 호출
		SampleDerived::Print();
		cout << "dataDeDerived = " << dataDeDerived << endl;
	}

};

int main() {

	// 유도 클래스의 객체 생성
	SampleDerived objDerived(10, 20);

	// 출력
	objDerived.Print();

	//----------------------------------------------------------------------
	// 동적 할당을 통해 유도 클래스의 객체 생성
	SampleDerived* ptrDerived = new SampleDerived(10, 20);

	// 출력
	ptrDerived->Print();

	// 동적으로 할당 받은 저장 공간은 반드시 해제해야 한다.
	delete ptrDerived;

	//-----------------------------------------------------------------------
	// 기초 클래스의 포인터로 유도 클래스의 객체를 가리킬 수 있다.
	// 동적 할당을 통해 유도 클래스의 객체를 생성해서 기초 클래스의 포인터로 참조
	SampleBase* ptrBase = new SampleDerived(3, 5);

	// 함수를 호출할때 어떤 함수를 호출할지 결정하는 방식
	// 1. 정적 바인딩(static binding)
	//	  → 컴파일 할때 함수의 식별자 매개변수의 개수와 자료형에 따라 호출할 함수를 결정
	//	  → 객체의 자료형 또는 포인터의 자료형에 따라 호출할 함수가 결정된다.
	// 2. 동적 바인딩(dynamic binding)
	//	  → 프로그램이 실행되는 단계에서 객체의 자료형 또는 포인터가 가리키는 객체의 자료형에 
	//	     따라 호출할 함수가 결정된다.
	//	  → C++ 프로그램에서는 클래스의 멤버 함수가 동적 바인딩을 하도록 하기 위해
	//	     "가상 함수(virtual function)"로 선언한다.

	// 출력
	ptrBase->Print();
	// 결과: SampleBase의 멤버 함수인 Print 함수 호출 (정적 바인딩)
	// Print 함수를 가상 함수로 선언하면 SampleDerived의 멤버 함수인 Print 함수 호출(동적 바인딩)

	// 동적으로 할당 받은 저장 공간은 반드시 해제해야 한다.
	delete ptrBase;

	//-------------------------------------------------------------------------------------
	// 기초 클래스의 포인터로 유도 클래스의 객체를 가리킬 수 있다.
	// 동적 할당을 통해 유도 클래스의 객체를 생성해서 기초 클래스의 포인터로 참조
	ptrBase = new SampleDeDerived(4, 6, 8);

	// 출력
	ptrBase->Print();

	// 동적으로 할당 받은 저장 공간은 반드시 해제해야 한다.
	delete ptrBase;


	return 0;
}
*/

// 간단한 기초 클래스 SampleBase
class SampleBase
{
private:
	char* dataBase;

public:
	SampleBase(const char* str) : dataBase(nullptr) { SetDataBase(str); }
	SampleBase(const SampleBase& copy) :dataBase(nullptr) { SetDataBase(copy.dataBase); }

	// 가상 소멸자(virtual destructor)
	// → 클래스에서 동적 메모리 할당을 하는 경우 일반적으로 소멸자에서 할당 받은 저장 공간을
	//	 해제해야 한다. 하지만 ...하면 소멸자가 호출되지 않아 할당 받은 저장공간을 해제할 수없게 된다.
	// → 따라서 소멸자는 반드시 가상 함수로 선언되어야 한다!
	//   이러한 소멸자를 가상 소멸자라고 한다.
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

// 간단한 유도 클래스 SampleDerived
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

	// 기초 클래스의 객체와 유도 클래스의 객체 생성
	SampleBase objBase("Hello World!");

	SampleDerived objDerived("Dream come true!", "Boys, Be ambitious!");

	objBase.Print();
	objDerived.Print();

	cout << "----------------------------------------------------------------" << endl;

	// 기초 클래스의 참조자로 유도 클래스의 객체를 참조할 수 있다.
	// SampleBase& refBase = objBase;
	SampleBase& refBase = objDerived;

	refBase.Print();
	// → Print 멤버 함수는 가상 함수이므로 프로그램이 실행되는 단계에서 어떤 함수를 호출할지
	//	  결정한다. 이때 기초 클래스의 참조자의 객체가 유도 클래스의 객체라면 유도 클래스의 
	//	  멤버 함수가 호출된다.

	cout << "----------------------------------------------------------------" << endl;

	// 동적 할당을 통해 유도 클래스의 객체를 생성하고 그 객체를 기초 클래스의 포인터로 참조
	SampleBase* ptrBase = new SampleDerived("Michale Jackson", "Harry Potter");

	// 출력
	ptrBase->Print();
	// → (*ptrBase).Print();

	// 동적으로 할당 받은 저장 공간은 반드시 해제해야 한다.
	// 호출 되는 소멸자는 ~SampleBase 즉, 기초 클래스의 소멸자만 호출되어 dataBase의 저장 공간만 해제한다.
	// 그러므로 dataDerived는 저장공간이 해제되지 않으므로 메모리 누수가 발생한다.
	// 기초 클래스의 소멸자를 가상 함수로 설정한다면 포인터의 자료형이 아니라 객체의 자료형을 보고 소멸자를 
	// 호출하기 때문에 유도 클래스의 소멸자가 호출된 다음 기초 클래스의 소멸자가 호출된다.
	delete ptrBase;


	return 0;
}