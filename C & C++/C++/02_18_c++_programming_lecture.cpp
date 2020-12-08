#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;

/*
// 간단한 클래스 Sample
class Sample {

private:
	// 멤버 변수(member variable)
	int data;
public:
	// 멤버 함수(member function)

	// 생성자(constructor)
	// → 객체가 생성될 때 자동으로 호출
	Sample(int n = 0) : data(n)
	{
		cout << "Sample::Sample(int n)" << endl;
	}

	// 소멸자(destructor)
	// → 객체가 소멸될 때 자동으로 호출
	// FILO (First In Last Out) : 스택 영역에 메모리가 할당될 때는 
	//							  먼저 들어온 메모리가 제일 나중에 소멸된다.
	~Sample()
	{
		cout << "Sample::~Sample() - data = " << data << endl;
	}

	// 설정자(setter)
	void SetData(int n) { data = n; }

	// 접근자(getter)
	int GetData() { return data; }

	// 출력
	void Print() { cout << "data = " << data << endl; }
};

int main() {

	// 객체(object): 자료형이 클래스인 변수
	Sample obj(10);

	// 객체 배열(object array)
	// → 객체 배열의 각 원소가 객체이다. 즉, 배열이 생성될 때 원소의 개수만큼 생성자가 호출된다. 
	Sample list[10];

	// 객체 포인터(object pointer)
	Sample* ptr = list;

	// 반복문을 이용해 객체의 배열에 값 설정
	for (int i = 0; i < 10; i++)
		ptr[i].SetData(i + 1);

	// 반복문을 이용해 객체 배열의 값 출력
	for (int i = 0; i < 10; i++)
		list[i].Print();

	//---------------------------------------------------------------------------------
	// 동적 메모리 할당
	// 새로운 저장공간이 할당 → 객체 생성 → 생성자 호출
	// new 연산자를 이용해 동적으로 메모리를 할당하면 객체가 생성된다. 이때 생성자가 호출된다.
	// 생성자에 값을 전달할 수도 있다.
	ptr = new Sample(20);

	(*ptr).Print();
	// ptr.Print();		→ 접근 연산자(.)는 피연산자가 객체여야만 하므로 이렇게 쓰면 x
	// 접근 연산자가 포인터 연산자보다 우선순위가 높기 때문에 중괄호로 묶어줘야 한다.

	// 간접 멤버 접근 연산자(->)
	ptr->Print();

	// 동적으로 할당 받은 저장 공간은 반드시 해제해야 한다.
	delete ptr;

	//--------------------------------------------------------------------------------
	const int LENGTH = 10;

	// 동적 메모리 할당
	ptr = new Sample[LENGTH];

	// 반복문을 이용해 값을 설정
	for (int i = 0; i < LENGTH; i++)
		ptr[i].SetData(i + 31);

	// 반복문을 이용해 출력
	for (int i = 0; i < LENGTH; i++)
		ptr[i].Print();
	// → (*(ptr + i)).Print();
	// → (ptr+ i)->Print();

	// 동적으로 할당받은 저장 공간 해제
	// → 소멸자 호출
	delete[] ptr;

	//------------------------------------------------------------------------------
	// 객체 포인터 배열 선언
	// → 배열의 각 원소가 객체 포인터인 배열
	Sample* ptrList[LENGTH];

	// 반복문을 이용해 포인터 배열의 각 원소에 동적 메모리 할당
	for (int i = 0; i < LENGTH; i++)
		ptrList[i] = new Sample(i + 51);

	// 반복문을 이용해 객체 포인터 배열이 값 출력
	for (int i = 0; i < LENGTH; i++)
		ptrList[i]->Print();

	// 반복문을 이용해 객체 포인터 배열에 할당 받은 저장 공간 해제
	for (int i = 0; i < LENGTH; i++)
		delete ptrList[i];

	return 0;
}
*/

//----------------------------------------------------------------------------
/*
class Sample {

private:

	// 멤버 변수(member variable)
	int data;

public:
	// 멤버 함수(memeber function)

	// 생성자(constructor)
	Sample(int n = 0) : data(n) { }

	// 설정자(setter)
	void SetData(int data)
	{
		// 지역 변수와 멤버 변수의 식별자가 충돌할 때 멤버 변수를 읽어오고 싶을 때
		// this 포인터: 멤버 함수에서 객체를 가리키는 포인터
		this->data = data;
		// → (*this).data = data
	}

	// 접근자(getter)
	int GetData() { return data; }

	// 출력
	void Print() { cout << "data = " << data << endl; }

	Sample& Adder(int n) { 
		data += n; 
		
		// 멤버 함수에서 객체 그 자신을 반환

		// 자기 참조자(self reference)
		// → 객체 자신을 참조할 수 있는 참조자
		// → this 포인터를 이용해 객체가 자신의 참조에 사용할 수 있는 참조자를 반환하는
		//	  멤버 함수를 작성할 수 있다.
		return *this;
	}
};

int main() {

	// 객체 생성
	Sample obj(10);

	// 출력
	obj.Print();

	// 설정자를 이용해 멤버 변수의 값 설정
	obj.SetData(20);

	// 출력
	obj.Print();

	// 멤버 함수를 이용해 멤버 변수의 값을 증가
	obj.Adder(3);
	
	// 출력
	obj.Print();

	// 멤버 함수를 연계해서 호출
	obj.Adder(5).Print();

	return 0;
}
*/

//--------------------------------------------------------------
/*
class Sample {

private:

	// 멤버 변수(member variable)
	int data;

public:
	// 멤버 함수(member function)

	// 생성자(constructor)
	Sample(int n = 0) : data(n) { }

	// 기본 소멸자(default destructor)
	// ~Sample() {}

	// 복사 생성자(copy constructor)
	// → 해당 클래스의 객체를 인자로 받는 생성자
	// → 복사 생성자는 객체로 객체를 초기화할 때 함수의 인자로 객체를 전달할 때
	//	  함수에서 객체를 반활할 때 호출된다.

	// 기본 복사 생성자(default copy constructor)
	// → 클래스에 복사 생성자가 정의되어 있지 않으면 기본 복사 생성자가 자동으로 추가
	// → 따라서 일반적인 경우에는 복사 생성자를 정의하지 않아도 된다.
	// → 기본 복사 생성자에서는 인자로 전달된 객체의 멤버 변수로 멤버 변수를 초기화한다.
	//	  이를 "멤버 대 멤버 복사"라고 한다.
	// Sample(const Sample& copy) : data(copy.data) { }
	// Sample(const Sample& copy) : x(copy.x), y(copy.y) { }


	// 설정자(setter)
	void SetData(int n) { data = n; }

	// 접근자(getter)
	int GetData() { return data; }

	// 출력
	void Print() { cout << "data = " << data << endl; }
};

int main() {

	// 객체 생성
	Sample obj1(10);

	// 객체를 이용해 객체를 초기화
	Sample obj2 = obj1;
	// → Sample obj2(obj1);
	// 위 문장에서는 Sample 클래스의 복사 생성자가 호출돼서 객체 obj1의 멤버 변수의 값으로
	// 객체 obj2의 멤버 변수가 초기화된다.

	obj2.Print();

	return 0;
}
*/

//-----------------------------------------------------------------------
/*
class Sample
{
private:

	// 멤버 변수
	char* data;
	// → 동적으로 저장 공간을 할당받아 문자열을 저장

public:

	// 멤버 함수

	// 생성자
	Sample(const char* str) : data(nullptr)
	{
		// 설정자를 이용해 인자로 전달된 문자열을 멤버 변수 data에 복사
		SetData(str);

	}

	// 기본 복사 생성자
	// → 멤버 대 멤버 복사, "얕은 복사"를 진행한다.
	// Sample(const Sample& copy) : data(copy.data) { }

	// 복사 생성자
	// → "깊은 복사"를 할 수 있도록 복사 생성자를 정의한다.
	// → 멤버 변수가 포인터인 경우, 그 주소에 저장되어 있는 값을 복사하는 것을 "깊은 복사"라고 한다.
	//	  주소를 복사하는 것은 의미가 없다. 그 주소에 저장된 값을 복사해야한다.
	Sample(const Sample& copy) :data(nullptr)
	{
		// 설정자를 이용해 매개변수에 전달된 객체의 멤버 변수, 즉 포인터가 가리키는 곳에
		// 저장되어 있는 값을 복사한다.
		SetData(copy.data);
	}

	// 소멸자: 객체가 소멸될 대 객체에서 할당받은 시스템 자원을 해재
	// → 객체에서 동적으로 할당받은 저장 공간을 할당 받았다면 소멸자에서 이를 해제한다.
	~Sample()
	{
		// 객체에서 할당 받은 저장 공간이 있는 경우 멤버 변수 data에는 그 저장공간의 주소가
		// 저장되어있을 것이고 그런 경우 할당 받은 저장 공간을 해제한다.
		if (data) delete[] data;
	}

	void SetData(const char* str)
	{
		// 인자로 전달된 값이 제대로된 문자열인지 확인
		if (!str) return;

		// 문자열의 길이 계산
		int length = strlen(str);
		
		// 인자로 전달된 값이 제대로 된 문자열이 아니면 함수 종료
		if (length <= 0) return;

		// 이전에 할당 받은 저장 공간이 있으면 그 저장 공간을 먼저 해제한다.
		if (data) delete[] data;

		// 문자열의 길이만큼 동적으로 저장공간을 할당
		data = new char[length + 1];
		// → new 연산자를 이용해 동적으로 저장 공간을 할당할 때 저장 공간을 할당하지 못하면
		//	  new 연산자의 연산결과는 nullptr이 된다.

		// 제대로 저장 공간을 할당 받았는지 확인
		if (!data)
		{
			// 오류 메시지 출력
			cout << "ERROR : Insufficient memory!" << endl;

			// exit 함수: 프로그램을 강제로 종료하는 함수
			exit(1);
		}
		strcpy(data, str);
	}
	
	//설정자
	const char* GetData() { return data; }

	// 출력
	void Print() { cout << "data = " << data << endl; }
};

int main() {

	// 객체 생성
	Sample obj1("Hello World!");

	// 출력
	obj1.Print();

	// 기존 객체로 새로운 객체를 초기화
	Sample obj2 = obj1;
	// → Sample obj2(obj1); → 객체를 전달받는 생성자 호출
	// 깊은 복사를 하지 않으면 동적 메모리를 해제하는 과정에서 오류가 뜬다.

	// 출력
	obj2.Print();


	return 0;
}
*/