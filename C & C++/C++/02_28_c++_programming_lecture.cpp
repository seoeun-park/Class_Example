#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
using std::string;

/*
// 두 정수를 더하는 함수
int Add(int n1, int n2) {

	return n1 + n2;
}

// 함수 오버로딩(function overloading)
// → 매개변수의 개수나 매개변수의 자료형이 다르면 같은 식별자를 가지는 함수가 존재할 수 있다.

// 두 실수를 더하는 함수
double Add(double n1, double n2) {

	return n1 + n2;
}

// 두 문자를 더하는 함수
char Add(char n1, char n2) {

	return n1 + n2;
}

int main() {

	cout << "Add(3, 5) = " << Add(3, 5) << endl;
	cout << "Add(2.1, 3.8) = " << Add(2.1, 3.8) << endl;
	cout << "Add('1', '2') = " << Add('1', '2') << endl;

	return 0;
}
*/

/*
// 함수 템플릿(function template)
// → 다양한 자료형의 함수를 만들기 위한 도구
// → 함수의 기능은 정해져 있지만 자료형이 결정되지 않은 형태이므로 다양한 자료형의 
//	  함수를 만들 수있다.
// → template 키워드를 사용해 템플릿을 정의한다.
//	  template 키워드가 나오면 그 다음 블록이 끝날 때까지 템플릿이 된다.
// → template 키워드 다음에는 템플릿 안에서 사용할 자료형의 이름을 지정하는 "템플릿 매개변수"
//	  가 나온다.
template <typename T>
T Add(T n1, T n2) {

	cout << "template function : ";
	return n1 + n2;
}

// 두 정수를 더하는 함수
int Add(int n1, int n2) {

	cout << "ordinary function : ";
	return n1 + n2;
}

// 템플릿 함수(template function)
// → 함수 템플릿으로 만들어진 함수
// → 템플릿 함수는 처음 그 함수를 호출했을 때 컴파일러에 의해 만들어진다.
// → 템플릿 함수를 호출할 때는 함수 템플릿에 지정했던 함수의 식별자 다음에 "템플릿 인자"
//	  를 설정한다. 이때 템플릿 인자는 함수 템플릿의 템플릿 매개변수에 전달될 자료형이다.

//template <>
//int Add<int>(int n1, int n2) {

	//return n1 + n2;
//}

// 둘 이상의 템플릿 매개변수를 가지는 템플릿
// → 템플릿 매개변수가 2개 이상인 경우에는 쉼표로 구분해서 나열한다
// → 이때 typename 키워드는 class 키워드로 대신할 수있다.
template <typename T, class U>
void PrintData(double num)
{
	cout << (T)num << ", " << (U)num << endl;
}

int main() {

	cout << "Add(3, 5) = " << Add(3, 5) << endl;
	// cout << "Add(3, 5) = " << Add<int>(3, 5) << endl;
	// → 템플릿 함수를 호출하면서 템플릿 인자를 지정하지 않으면 인자의 자료형을 확인해서
	//	  템플릿 함수의 자료형을 결정한다.
	// → 만약 같은 식별자를 갖고 있는 일반 함수와 템플릿 함수가 선언되어 잇으면
	//	  함수를 호출할 때 템플릿 인자를 설정하지 않는경우 일반 함수가 호출된다.
	// → 함수 템플릿을 정의한 상황에서 같은 식별자를 가지는 일반 함수를 선언하는 것은 바람직하지 못하다.

	cout << "Add(2.1, 3.8) = " << Add<double>(2.1, 3.8) << endl;
	cout << "Add('1', '2') = " << Add<char>('1', '2') << endl;
	// → 컴파일 단계에서 함수 템플릿을 이용해 템플릿 매개변수 T를 대신해서 템플릿 인자로 주어진
	//	 double, char 자료형의 템플릿 함수를 생성한다.

	PrintData<char, int>(65);
	// → 템플릿 매개변수가 둘 이상인 템플릿 함수를 호출할 때는 템플릿 인자를 생략할 수 없다.


	return 0;
}
*/

/*
// 연습문제:  아래와 같은 프로그램에서사용할 수 있도록 매개변수로 받은 두 값을
//			  비교해 큰 값을 반환하는 Max 함수의 함수 템플릿을 정의하라.

template <typename T>
T Max(T data1, T data2)
{
	return data1 > data2 ? data1 : data2;
}

// 자료형이 const char* 인 경우에는 위에서 정의한 함수 템플릿으로는 제대로 동작하지 않는다
//const char* Max(const char* data1, const char* data2)
//{
	//return data1 > data2 ? data1 : data2;
//}

template <>
const char* Max(const char* data1, const char* data2)
{
	// strcmp 함수 : 문자열을 비교하는 함수
	// → 문자열을 비교할 때는 사전에 나오는 순서가 나중인 값이 더 큰 값이다.

	// #include <cstring>
	// int strcmp(const char* str1, const char* str2);
	// int strncmp(const char*str1, const char* str2, size_t length);
	//@return 1. positive- str1이 str2보다 큰 경우
	//		  2. negative - str2가 str1보다 큰 경우
	//		  3. 0		  - str1과 str2가 같은 경우
	return strcmp(data1, data2) > 0 ? data1 : data2;
	// return data1 > data2 ? data1 : data2;
}

// 함수 템플릿의 특수화(specialization)
// → 지정한 자료형의 겨우 함수 템플릿을 사용하지않고 별도로 정의한 템플릿을 사용하도록 하는 방법

int main() {

	cout << Max(10, 20) << endl;
	cout << Max('a', 'Z') << endl;
	cout << Max<const char*>("Hello", "Hi") << endl;

	return 0;
}
*/

///*
// 연습문제(2) 인자로 전달되는 두 변수에 저장된 값을 서로 교환하는 swap 함수를 템플릿으로 정의하라.
//				그리고 다음 Point 클래스의 객체를 대상으로 값의 교환이 이뤄짐을 확인할 수 있도록
//				main 함수를 작성하라.
class Point
{
private:
	int x, y;
public:
	Point(int x = 0, int y = 0): x(x), y(y) {}
	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }

	friend std::ostream& operator<<(std::ostream& os, const Point& ref);

};

// 두 값을 전달 받아 교환하는 함수 swap 함수의 함수 템플릿
template <typename T>
void swap(T& p1, T& p2)
{
	T tmp = p1;
	p1 = p2;
	p2 = tmp;
}

// 스트림 삽입 연산자(<<) 오버로딩
std::ostream& operator<<(std::ostream& os, const Point& ref)
{
	os << "[" << ref.x << ", " << ref.y << "]";
	return os;
}

int main() {

	Point p1(1, 3), p2(7, 2);

	cout << "p1 = " << p1 << ", p2 = " << p2 << endl;
	swap(p1, p2);
	// swap<Point>(p1, p2);

	std::swap(p1, p2);
	cout << "p1 = " << p1 << ", p2 = " << p2 << endl;

	return 0;
}
//*/