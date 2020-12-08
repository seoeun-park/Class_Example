#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
using std::string;

/*
class Point
{
private:
	int x, y;

public:
	Point(int x = 0, int y = 0) : x(x), y(y) {}

	// 기본 복사 생성자(default copy constructor)
	// Point(const Point& copy) : x(copy.x), y(copy.y) {}

	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }
	void Print() const { cout << "point = [" << x << ", " << y << "]" << endl; }

	// 전역 함수 기반의 스트림 삽입 연산자 함수에서 private 멤버 변수(x, y)에 접근하기 위하여
	friend std::ostream& operator<<(std::ostream& os, const Point& ref);

	//-------------------------------------------------------------------
	// 대입 연산자(=) 오버로딩
	// → 클래스에 대입 연산자 오버로딩을 하지않으면 기본 대입 연산자 오버로딩이 추가된다.

	// 기본 대입 연산자 오버로딩(default assignment operator overloading)
	// @param	대입할 객체
	// @return	객체 그 자신

	Point& operator=(const Point& ref)
	{
		// 멤버 대 멤버 복사 → 얕은 복사
		x = ref.x;
		y = ref.y;

		// 자기 참조자 반환
		return *this;
	}
};

// 스트림 삽입 연산자(<<) 오버로딩
// → @brief	cout 객체와스트림 삽입 연산자를 이용해 Point 객체의 값을 출력
// → @param	1. cout 객체
//				2. 출력하고자 하는 Point 클래스 객체
// → @return

std::ostream& operator<<(std::ostream& os, const Point& ref)
{
	os << "[" << ref.x << ", " << ref.y << "]";
	return os;
}


int main() {

	// cout 객체
	// → iostream.h 파일에 정의되어 있는 ostream 클래스의 객체

	// 스트림 삽입 연산자(<<, 비트 시프트 연산자)
	// → ostream 클래스에서 연산자 오버로딩 해놓은 연산자
	// → 스트림 삽입 연산자를 연이어 사용해서 여러 값을 출력하기 위해 스트림 삽입 연산자의
	//	  연산자 함수는 반드시 cout 객체를 반환해야 한다.

	cout << "Hello World!\n";
	// → cout.operator<<("Hello World!\n");

	cout << "I am a " << "boy!\n";
	// → cout.operator<<("I am a").operator<<("boy!\n");
	// → 스트림 삽입 연산자(<<)를 연이어 사용해서 여러 값을 출력하기 위해 스트림 삽입 연산자의
	//	  연산자 함수는 반드시 cout 객체를 반환해야 한다.

	int num = 10;

	cout << "num = " << num << endl;
	// → cout.operator<<("num = ").operator<<(num).operator<<(endl);

	Point p1(2, 3), p2(4, 2);

	// cout << p1;
	// → cout.operator<<(p1);		// WARNING!
	// → 컴파일 오류가 뜨는 이유는 내가 지정한 클래스의 객체를 받는 스트림 삽입 연산자는 
	//	  ostream 클래스에서 오버로딩되지 않았기 때문이다. 
	//	  그렇다고 ostream 라이브러리를 직접 접근하여 제어할 수 없기 때문에 전역 함수 기반의
	//	  오버로딩을 해야 한다.
	// → operator(cout, p1);
	// → 스트림 삽입 연산자를 전역 함수 기반으로 오버로딩한다면 Print 함수를 쓰지 않고 유연하게
	//	  출력할 수 있게 된다.

	cout << "p1 = " << p1 << endl;
	// → operator(cout.operator<<("p1 = "), p1).operator<<(endl);

	//---------------------------------------------------------------------------------
	Point p3 = p1;
	// → Point p4(p1);
	// → 객체를 초기화하는 동시에 객체를 대입
	// → 기본 복사 생성자를 호출하여 대입

	p3 = p2;
	// → p3.operator=(p2);
	// → 기본 대입 연산자 오버로딩을 통해 대입
	// → 기본 대입 연산자 오버로딩은 따로 작성하지 않아도 기본 복사 생성자처럼 자동으로 호출

	cout << "p3 = " << p3 << endl;


	return 0;
}
*/

/*
// 간단한 클래스 Sample
class Sample
{
private:
	char* data;

public:

	Sample(const char* str = nullptr) :data(nullptr) { SetData(str); }

	// 복사 생성자
	// → "깊은 복사"를하기 위해 복사 생성자 정의
	Sample(const Sample& copy) : data(nullptr) { SetData(copy.data); }

	~Sample() { if (data) delete[] data; }

	void SetData(const char* str)
	{
		if (!str) return;

		int length = strlen(str);

		if (length <= 0) return;

		if (data) delete[] data;

		data = new char[length + 1];

		strcpy(data, str);
	}
	const char* GetData() const { return data; }
	void Print() const { cout << "data = " << data << endl; }

	friend std::ostream& operator<<(std::ostream& os, const Sample& ref);
	
	// 대입 연산자 오버로딩 (기본 대입 연산자 오버로딩 x)
	// → 깊은 복사를 할 수 있도록 대입 연산자함수를 정의한다.
	Sample& operator=(const Sample& ref)
	{
		// data = ref.data;		→ 멤버 대 멤버 복사(얕은 복사)

		SetData(ref.data);
		return *this;
	}

};

// 스트림 삽입 연산자 오버로딩
std::ostream& operator<<(std::ostream& os, const Sample& ref)
{
	os << ref.data;
	return os;
}

int main() {

	// 객체 생성
	Sample obj1("Hello World!");
	Sample obj2 = obj1;

	cout << "obj1 = " << obj1 << endl;
	cout << "obj2 = " << obj2 << endl;

	Sample obj3;

	obj3 = obj1;
	// → obj3.operator=(obj1);
	// 대입 연산자 오버로딩 필요

	cout << "obj3 = " << obj3 << endl;


	return 0;
}
*/

int main() {

	// string 클래스
	// → #include <string>
	// → 문자열을 처리하기 위해 C++ 표준 라이브러리에 정의되어 있는 클래스

	string str = "Hello World!";

	cout << "str = " << str << endl << endl;

	string str1 = "C++ ";
	string str2 = "Programming";

	string str3 = str1 + str2;

	cout << "str3 = " << str3 << endl << endl;

	str1 += str2;

	if (str1 == str2)
		cout << "Same string!" << endl << endl;
	else
		cout << "Different string!" << endl << endl;

	cout << "str1[2] = " << '"' << str1[2] << '"' << endl << endl;

	// cin 객체를 통해 문자열 입력
	cout << "Enter a string: ";
	cin >> str;

	cout << "str = " << str << endl;


	return 0;
}

// c++ 레퍼런스 사이트: cplusplus.com