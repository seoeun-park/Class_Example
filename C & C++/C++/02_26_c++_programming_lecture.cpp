#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;

// 좌표 평면에서 점을 표현하는 클래스 Point
class Point
{
private:
	// 멤버 변수
	int x;
	int y;

public:
	// 멤버 함수
	Point (int x = 0, int y = 0) : x(x), y(y) { }
	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }
	void Print() const { cout << "point = [" << x << ", " << y << "]" << endl; }

	Point Add(const Point& ref)
	{
		// 임시 객체(temporary object)를 생성해서 반환
		return Point(x + ref.x, y + ref.y);
	}

	// 연산자 오버로딩(operator overloading)
	// → C++ 컴파일러에서는 기본 자료형에 대한 연산자들의 기능들이 모두 정의되어 있다.
	//    하지만 우리가 정의한 자료형에 대한 연산자들의 기능은 정의되어있지 않다.
	//	  하지만 "연산자 오버로딩"을 통해 우리가 정의한 자료형(클래스)에 대한 연산자의 기능을
	//	  정의할 수 있다.
	//	  이를 정의하는 것은 "연산자 오버로딩"이라고 한다.
	// → 연산자의 피연산자가 기본 자료형의 값이 아니라 객체인 경우,컴파일러는 연산자를 함수로
	//    취급한다. 이러한 함수를 "연산자 함수(operator function)"라고 한다.
	// → 연산자 함수 또한 함수이므로 "함수 오버로딩"이 가능하다. 이를 "연산자 오버로딩"이라고 한다.
	// → 연산자 함수의 식별자는 operator 키워드 다음에 연산 기호를 붙여서 작성한다.
	// → 연산자의 피연산자가 객체인 경우, 컴파일러는 첫 번째 피연산자의 멤버 함수 중에서
	//	  연산자 함수를 찾고, 없으면 전역 함수 중에서 연산자 함수를 찾는다.

	// 연산자 오버로딩(operator function)의 방법 2가지
	// 1. 멤버 함수 기반의 연산자 오버로딩
	// 2. 전역 함수 기반의 연산자 오버로딩

	// 1. 멤버 함수 기반의 + 연산자 오버로딩
	Point operator+(const Point& ref)
	{
		// 임시 객체(temporary object)를 생성해서 반환
		return Point(x + ref.x, y + ref.y);
	}

	// 1. 멤버 함수 기반의 - 연산자 오버로딩
	Point operator-(const Point& ref)
	{
		return Point(x - ref.x, y - ref.y);
	}

	// == 연산자 오버로딩
	// → 연산자 함수에서는 반환 값이 연산 결과이다.
	bool operator==(const Point& ref)
	{
		return x == ref.x && y == ref.y;
	}

	// friend 함수 선언
	friend Point AddPoint(const Point& p1, const Point& p2);
	friend Point operator+(const Point& p1, const Point& p2);

};

// 두 점을 더하는 함수
// → 매개변수: 더하고자 하는 두 점(Point)
// → 반환 값: 두 점을 더한 점(Point)
// 객체를 반환하므로 참조자로 설정한 다음 값을 바꾸지 못하게끔 상수로 선언한다.
Point AddPoint(const Point& p1, const Point& p2)
{
	// Point p3(p1.GetX() + p2.GetX(), p1.GetY() + p2.GetY());

	// Point p3(p1.x + p2.x, p1.y + p2.y);
	// return p3;

	// 임시 객체(temporary object)를 생성해서 반환
	// 반환 값이 객체인 경우 객체를 복사해서 반환되기 때문에 복사 생성자가 호출된다.
	return Point(p1.x + p2.x, p1.y + p2.y);

}

// 2. 전역 함수 기반의 연산자 오버로딩
Point operator+(const Point& p1, const Point& p2)
{
	// 임시 객체(temporary object)를 생성해서 반환
	return Point(p1.x + p2.x, p1.y + p2.y);

}

int main() {

	// 객체 생성
	Point p1(3, 5), p2(6, 2);

	p1.Print();
	p2.Print();

	// 전역 함수로 두 객체를 더한 값을 반환
	Point p4 = AddPoint(p1, p2);

	p4.Print();

	// 멤버 함수로 두 객체를 더한 값을 반환
	Point p5 = p1.Add(p2);

	p5.Print();

	Point p6 = p1 + p2;
	// Point p6 = p1.operator+(p2);
	// → operator는 p1의 멤버 함수를 기반으로 오버로딩 된 함수
	// Point p6 = operator+(p1, p2);
	// → 이때 operator는 전역 함수를 기반으로 오버로딩 된 함수

	p6.Print();

	Point p7 = p1 - p2;

	p7.Print();

	//---------------------------------------------------------
	// == 연산자 오버로딩
	if (p1 == p2)
	// if (p1.operator==(p2))
		cout << "Same points!" << endl;
	else
		cout << "Different points!" << endl;

	return 0;
}