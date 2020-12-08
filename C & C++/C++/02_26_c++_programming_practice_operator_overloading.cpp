#include <iostream>

using std::cout;
using std::endl;

class Point
{
private:
	int x, y;

public:
	Point(int x = 0, int y = 0) : x(x), y(y) {}
	void SetX(int n) { x = n; }
	void SetY(int n) { y = n; }
	int GetX() const { return x; }
	int GetY() const { return y; }
	void Print() const { cout << "point = [" << x << ", " << y << "]" << endl; }

	//----------------------------------------------------------------------------
	// 멤버 함수 기반의 연산자 오버로딩(operator overloading)

	// * 연산자 오버로딩
	// @brief	매개변수로 전달된 정수만큼 곱해서 새로운 좌표 생성
	// @param	곱할 정수(int)
	// @return	Point 클래스의 객체

	Point operator*(int num)
	{
		return Point(x * num, y * num);
	}

	/**
	 → ==연산자 오버로딩
	 → @brief	두 좌표가 같은 지 확인
	 → @param	확인할 Point 클래스의 객체
	 → @return	두 좌표가 같은 지의 여부(bool)
	*/

	bool operator==(const Point& ref)
	{
		return x == ref.x && y == ref.y;
	}

	friend Point operator*(int num, const Point& ref);

};

//----------------------------------------------------------------------------
// 전역 함수 기반의 연산자 오버로딩

// 연산자 함수
// → 매개변수: 연산자의 피연산자
// → 반환 값: 연산자의 연산 결과

// * 연산자 오버로딩
// @brief	매개변수로 전달된 객체에 매개변수로 전달된 정수만큼 곱해서 새로운 좌표 생성
// @param	1. 곱할 정수(int)
//			2. Point 클래스의 객체
// @return	Point 클래스의 객체

Point operator*(int num, const Point& ref)
{
	// return Point(num * ref.GetX(), num * ref.GetY());
	return Point(num * ref.x, num * ref.y);
}

//----------------------------------------------------------------------------
// main 함수
int main() {

	Point p1(2, 3);

	Point p2 = p1 * 3;
	// → Point p2 = p1.operator*(3);	→ 멤버 함수 기반의 오버로딩
	// → Point p2 = operator*(p1, 3);	→ 전역 함수 기반의 오버로딩

	// 연산자 오버로딩을 할때는 교환 법칙이 성립할 수 있도록 해야 한다.
	Point p3 = 3 * p1;
	// → Point p3 = 3.operator*(p1); → 성립될 수 없으므로 전역 함수 오버로딩을 해야 한다.
	// → Point p3 = operator(3, p1);

	p1.Print();
	p2.Print();
	p3.Print();

	if (p2 == p3)
	// → if (p2.operator==(p3))
	// → if (operator==(p2, p3))
		cout << "Same points!" << endl;
	else
		cout << "Different points!" << endl;

	return 0;
}