#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
using std::string;
/*
// 템플릿(template)
// 1. 함수 템플릿(function template)
// 2. 클래스 템플릿(class template)

// 클래스 템플릿(class template)
// → 멤버 변수나 멤버 함수의 자료형을 클래스를 정의하면서 결정하는 게 아니라,
//	 함수 템플릿처럼 컴파일 단계에서 템플릿 인자에 따라 자료형을 결정한다.

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

// 클래스 템플릿의 멤버 함수를 클래스 템플릿 외부에서 정의
// → 클래스 템플릿의 각 멤버 함수를 각각의 함수 템플릿으로 정의해야 한다.
// → 클래스의 멤버 함수를 정의할 때는 별도의 소스 파일에 하지만, 클래스 템플릿의 멤버 함수들은
//	 함수 템플릿이기 때문에 값은 헤더 파일 안에 작성한다.
template <typename T>
Sample<T>::Sample(T n) :data(n) {}

template <typename T>
void Sample<T>::SetData(T n) { data = n; }

template <typename T>
T Sample<T>::GetData() const { return data; }

template <typename T>
void Sample<T>::Print() const { cout << "data = " << data << endl; }

// 스트림 삽입 연산자 오버로딩
template <typename T>
std::ostream& operator<<(std::ostream& os, const Sample<T>& ref)
{
	os << ref.data;
	return os;
}

//----------------------------------------------------------------------------
// 클래스 템플릿의 특수화
// → 특정 자료형을 기반으로 생성된 객체에 대해 다른 기능을 사용하도록 하기 우해 클래스 템플릿을
//	 특수화한다.
// → 특수화를 하면 특수화된 클래스는 객체를 선언하지않더라도 자동으로 구체화된다.
// → 즉, 클래스 정의가 만들어지고 멤버 함수들은 컴파일되어실행 파일에 포함된다.
//	 따라서 특수화된 크래스에 대한 멤버함수의 정의는일반적인 템플릿 클래스와는 달리
//	 헤더 파일에 작성해서는 안되며 구현파일에 작성해야한다.
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

	// 클래스 템플릿을 이용해 객체 생성
	// → 클래스 템플릿에서는 템플릿 인자를 생략할 수 없다.

	Sample<int> obj1(10);
	obj1.Print();
	cout << "obj1 = " << obj1 << endl;
	// → operator<<(cout, obj1);

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

// 예외(exception)
// → 프로그램 실행 도중 발생하는 문제 실행
// → 문법적인 오류는 예외에포함되지않는다.
// → 프로그램이 실행되는 도중 예외가 발생하면 프로그램을 강제 종료한다. 이런 상황이 발생하면
//	 프로그램에서 할당 받은 시스템 자원 등을 제대로 해제할 수없으며, 사용자가 입력한
//	 데이터등을 정상적으로 저장아할 수 없게 된다.
// → 예외의 대표적인 예: 0으로 나누는 경우

// 예외 처리(exception handling)
// → 프로그램이 실행될 때 발생할 수있는예외를 대비해서 코드를 작성하는 것
// → 프로그램의 비정상적인 종료를 막고 정상적인 실행 상태를 유지하기 위해서

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

	// 어떤 수를 0으로 나누게 되면 예외가 발생해서 프로그램이 강제로 종료된다.
	// 이러한 상황이 발생하지 않도록 나누기 전에 제수가 0인지 확인한다.

	if (n2 == 0)
	{
		cout << "The divisor must not be zero!";
	}
	else
	{
		cout << "Quotient = " << n1 / n2 << endl;
		cout << "Remainder = " << n1 % n2 << endl;
	}

	// 조건문을 이용해 예외 처리를 했을 때의 문제점
	// 1. 예외가 발생하는 위치와 예외가 발견되는 위치가 다를 수 있다.
	// 2. 예외 처리를 하기 위해 작성한 코드와 프로그램 흐름을 구성하는 코드를 구분하기 어렵다.
	// 
}
*/

/*
int main() {
	int n1, n2;

	cout << "Enter an integer: ";
	cin >> n1 >> n2;

	// 어떤 수를 0으로 나누게 되면 예외가 발생해서 프로그램이 강제로 종료된다.
	// 이러한 상황이 발생하지 않도록 나누기 전에 제수가 0인지 확인해서 예외를 발생시킨다.

	// 예외가 발생할 가능성이 있는 문장들은 try 블록에 작성
	try
	{
		// 문제가있는 경우 throw 문을 통해 예외를 발생시킨다.
		// 이때 throw 문 다음에는 값이 나오게 되고, 이 값을 "예외 데이터(exception data)"라고 한다.
		// try 블록 안에 나온문장들이 실행되다가 throw 문을 만나면,예외 데이털르 던지게 된다.
		// 이렇게 던져진 예외 데이터는 try 블록 다음에 나온느 catch 블록에서 받아낸다.
		if (n2 == 0)
			throw n2;

		cout << "Quotient = " << n1 / n2 << endl;
		cout << "Remainder = " << n1 % n2 << endl;
	}
	// catch 블록에는 throw문에 의해 던져지는 에외 데이터를 받기 위해 매개변수를 저장한다.
	// 이때 매개변수의 자료형에 따라 받아내는 catch 블록이 결정된다.
	catch (int expn)
	{
		cout << "The divisor must not be zero!";
	}

	// try-catch 구문을이용해 예외 처리할때 주의할 점
	// 1. throw 문에 의해 예외가 발생했을 때 이를 처리하지 않으면 프로그램은 강제 종료된다.
	// 2. 예외 데이터와 catch 블록 매개변수의 자료형이 일치하지 앟으면 예외를 처리할 수 없게 된다.
	// 3. try 블록 내에서 유행이 다른 예외 상황이 발생할 수 있으며 이 경우 각각의 예외를
	//	  처리하기 위해 예외 데이터의 자료형이 다를 수 있다. 그래서 try 블록 다음에 나오는
	//	  catch 블록은 여러 개가 될 수 있다.
}
*/


// 예외 객체(exception object)
// → 예외 발생을 알리는데사용되는 객체
// → 객체를 이용해서예외 상황을 알리면 예외가 발생한 원인에 대한 정보를 보다 자세하게
//	 담을 수있다.

// 예외 클래스(excepton class)
// → 예외 객체를 생성하기위해 정의한 클래스
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



