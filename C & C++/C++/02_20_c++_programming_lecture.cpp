#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;

///*
//-------------------------------------------------------------------
// 간단한 클래스 Sample
class Sample
{
private:
	// 멤버 변수
	int data;

	// 정적 멤버(static member)
	// → 클래스에서 static 키워드를 붙여서 선언한 멤버 변수 또는 멤버 함수
	// → 일반 멤버는 객체마다 하나씩 생성되지만, 정적 멤버는 클래스당 하나만 생성된다.
	// → 정적 멤버는 클래스에서 선언한 멤버이지만 객체에 속한 멤버는 아니다.
	// → 정적 멤버는 main 함수가 호출되기 전에 프로그램이 시작되면 저장 공간이 할당되기 때문에
	//	  객체가 생성되지 않아도 접근할 수 있다.
	// → 정적 멤버를 클래스 외부에서 정의하는 경우, static 키워드는 선언부에만 붙인다.
	// → 클래스 외부에서 정적 멤버에 접근할 때는 클래스 식별자와 범위 지정 연산자를 사용한다.

	// 정적 멤버 변수(static member variable, 클래스 변수)
	// → 프로그램 전체에서 하나만 존재하며, 클래스로 생성된 모든 객체가 공유하는 멤버 변수
	// → 프로그램이 실행됨과 동시에 저장 공간이 할당되며 초기화하지 않으면 0으로 초기화된다.
	// → 정적 멤버 변수는 객체가 생성되기 이전에 저장 공간이 할당되기 때문에, 생성자에서
	//	  초기화할 수 없다. 따라서 클래스 외부에서 초기화시킨다.
	static int counter;
	// → Sample 자료형의 객체들이 몇 개가 생성되는지 저장하는 변수

	// 상수 멤버 변수(constant member variable)
	// → 상수 멤버 변수는 반드시 생성자의 멤버 초기화 리스트에서 초기화해야 한다.
	// const int MAX;

	// 정적 상수 멤버 변수(static constant member variable)
	// → 상수 멤버변수는 저장 공간을 절약하기 위해 정적 변수로 선언하는 것이 일반적이다.
	// → 정적 상수 멤버 변수의 자료형이 int 자료형인 경우 클래스 내부에서 선언과 동시에 초기화
	//	  할 수 있다. 하지만 다른 자료형인 경우에는 반드시 클래스 외부에서 초기화해야한다.
	static const int MAX = 256;

	// int 자료형이 아닌 정적 상수 멤버 변수는 클래스 외부에서 초기화한다.
	static const char MESSAGE[81];

public:
	// 멤버 함수
	Sample(int n = 0) : data(0)
	{
		counter++;
		cout << "Sample::counter = " << counter << endl;
		SetData(n);
	}

	~Sample()
	{
		counter--;
		cout << "Sample::~counter = " << counter << endl;
	}
	void SetData(int n) { data = (n > MAX) ? MAX : n; }
	int GetData() const { return data; }
	void Print() const { cout << "data = " << data << endl; }

	// 정적 멤버 함수(static member function)
	// → static 키워드를 붙여서 선언한 함수
	// → 객체가 생성되기 이전에 호출할 수 있다.
	//	  따라서 정적 멤버 함수에서는 정적 멤버에만 접근할 수 있다.
	// → 정적 멤버 함수에서는 this 포인터, const 키워드를 쓸 수 없다.
	static void PrintCounter();
};

// 정적 멤버 변수의 초기화
// → 정적 멤버 변수를 0이 아닌 다른 값으로 초기화시킬 때는 클래스 외부에서 초기화시켜야 한다.
int Sample::counter = 0;

// int 자료형이 아닌 정적 상수 멤버 변수는 클래스 외부에서 초기화한다.
const char Sample::MESSAGE[81] = "Hello World!";

// 정적 멤버 함수를 클래스 외부에서 정의할 때는 static 키워드를 붙이지 않는다.
void Sample::PrintCounter() 
{ 
	cout << "counter = " << counter << endl; 
}


int main() {

	// 객체 배열 생성
	//Sample list[10];

	// 클래스 식별자와 범위 지정 연산자를 이용해 정적 멤버 함수를 호출할 수 있다.
	Sample::PrintCounter();

	// 객체 생성
	Sample obj1(10);
	Sample obj2(20);

	obj1.Print();
	obj2.Print();

	// 정적 멤버 함수는 객체를 통해서도 호출할 수 있다.
	obj1.PrintCounter();
	obj2.PrintCounter();

	return 0;
}
//*/

