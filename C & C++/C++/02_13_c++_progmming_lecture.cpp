#include <iostream>

using std::cout;
using std::endl;
using std::cin;
/*
int main() {

	// new 연산자: 동적으로 메모리를 할당하는 연산자
	// → new 연산자의 피연산자는 자료형이다.
	// → new 연산자의 연산 결과는 할당 받은 저장공간의 시작 주소(pointer)이다.
	// → 만약 저장 공간을 할당 받지 못하면 연산 결과는 nullptr이다.

	// C 언어에서는 NULL 매크로 상수를 사용하지만 C++ 언어에서는 nullptr 키워드를 사용한다.

	int* ptr = new int;
	// → 프로그램이 실행되는 도중 int 자료형의 크기만큼 저장공간을 할당해서
	//	  시작 주소를 int 자료형 포인터 ptr에 대입한다.

	// 포인터 연산자를 이용해 할당 받은 저장 공간에 값을 대입
	*ptr = 10;

	cout << "*ptr = " << *ptr << endl;

	// 동적으로 할당받은 메모리는 반드시 해제해야 한다.
	delete ptr;

	//------------------------------------------------------------------
	char* str = new char[81];
	// → new 연산자를 연산자를 이용해 char 자료형의 81칸만큼의 저장공간을 할당받아
	//	  시작 주소를 char 자료형 포인터에 대입
	// → 이렇게 할당 받은 저장 공간은 char 자료형의 배열과 같기 때문에 문자열를 저장할 수 있다.

	// 사용자 입력
	cout << "Enter a string: ";
	cin.getline(str, 80);

	// 출력
	cout << "str = " << str << endl << endl;

	// 동적으로 할당 받은 저장 공간은 자동으로 해지되지 않는다.
	// 따라서 반드시 프로그램내에서 해제해야 한다.
	// 여러 칸의 저장공간을 할당 받았을 때에는 delete[] 연산자를 이용해서 해제한다. 
	delete[] str;

	// 상수 선언
	// → C 언어에서는 매크로 상수를 주로 사용하지만, C++ 언어에서는 상수를 사용한다.
	// → 매크로 상수나 상수의 식별자는 대문자로 작성하는게 관례이다.
	const int LENGTH = 10;

	ptr = new int[LENGTH];
	// new 연산자를 이용해 int 자료형의 값을 10개 저장할 수 있는 저장공간을 할당받는다.
	// 이때 포인터 ptr에는 할당 받은 저장공간의 시작 주소가 대입된다.
	// 따라서 포인터 ptr이 가리키는 저장공간은 크기가 10인 int 자료형 배열과 같다.

	// 반복문을 이용해 포인터 ptr에 할당 받은 저장공간을 배열처럼 활용
	for (int i = 0; i < LENGTH; i++)
		ptr[i] = i + 1;
		// *(ptr + i) = i + 1;
	
	for (int i = 0; i < LENGTH; i++)
		cout << "ptr[" << i << "] = " << ptr[i] << endl;

	// 동적으로 할당받은 저장공간은 반드시 해제해야 한다.
	delete[] ptr;


	return 0;

}
*/

/*
int main() {
	
	// 변수 선언
	int num = 10;

	// 참조자(reference) 선언
	// → 참조자를 선언할때는 참조 연산자(&)를 붙인다.
	// → 참조자는 선언하면서 반드시 초기화해야 한다.
	int& ref = num;

	// 출력
	cout << "num = " << num << ", ref = " << ref << endl;

	// 참조자를 통해 변수 num의 저장공간에 접근
	ref = 20;

	// 출력
	cout << "num = " << num << ", ref = " << ref << endl;

	// 참조 연산자(&): 변수의 저장공간의 주소를 구하는 연산자
	cout << "num = " << num << ", &ref = " << &ref << endl;


	return 0;
}
*/

/*
// 포인터를 이용한 참조에 의한 호출(call by reference)
// → 매개변수에 포인터를 사용해서 함수 외부에서 서언된 변수의 주소를 전달받아
//    함수에서 함수 외부에서 선언된 변수에 접근
void swap(int* p1, int* p2) {
// int* p1 = &x
// int* p2 = &y 

	int tmp = *p1;
	*p1 = *p2;
	*p2 = tmp;
}

// 함수 오버로딩(function overloading)
// 매개변수의 자료형 또는 개수가 다르면 같은 이름의 함수가 존재할 수 있다.

// 참조자를 이용한 참조에 의한 호출(call by reference)
// → 매개변수에 참조자를 사용해서 참조자로 함수 외부에서 선언된 변수를 참조해서
//	  함수에서 함수 외부에서 선언된 변수에 접근

void swap(int& r1, int& r2) {
// int& r1 = x;
// int& r2 = y;

	int tmp = r1;
	r1 = r2;
	r2 = tmp;
}
int main() {

	// 변수 선언
	int x = 10, y = 20;

	// 출력
	cout << "x = " << x << ", y = " << y << endl;

	// 1. 포인터를 이용한 참조에 의한 호출
	// → swap 함수를 이용해 두 변수에 저장된 값을 교환
	// → 참조 연산자를 이용해 변수 x와 y에 할당된 저장공간의 주소를 구해 함수에 전달
	swap(&x, &y);

	// 출력
	cout << "x = " << x << ", y = " << y << endl;

	// 2. 참조자를 이용한 참조에 의한 호출
	// →  swap 함수를 이용해 두 변수에 저장된 값을 교환
	swap(x, y);

	// 출력
	cout << "x = " << x << ", y = " << y << endl;


	return 0;
}
*/

/*
// 구조체(struncture)
// → 특정 대상을 표현하는 값들을 묶어서 새로운 자료형으로 정의
struct point {

	// 멤버 변수(member variable): 구조체 변수에서 실제 값을 저장하는 변수
	int x;
	int y;
};

void print_point(struct point p) {

	// 멤버 접근 연산자(.) : 구조체 변수의 멤버 변수에 접근하는 연산자
	// 첫 번째 피연산자는 구조체 변수, 두번째 피연산자는 멤버 변수
	cout << "pos = [ " << p.x << ", " << p.y << " ]" << endl;
}

int main() {

	// 구조체 변수(struct variable)
	struct point pos = { 3, 5 };

	// 멤버 접근 연산자(.) : 구조체 변수의 메버 변수에 접근하는 연산자
	// 첫 번째 피연산자는 구조체 벼수 두번째 피연산자는 멤버 변수
	cout << "pos = [ " << pos.x << ", " << pos.y << " ]" << endl;

	// print_point 함수를 이용해 구조체 변수 pos를 출력
	print_point(pos);

	return 0;
}
*/

/*
// 클래스(class)
// → 특정 대상을 표현하는 값들과 그런 값들을 다루는 기능들을 묶어서 새로운 자료형을 정의
class Point 
{
	// 접근제어 지시자
public:

	// 멤버 변수(memeber variable)
	int x;
	int y;
	
	// 멤버 함수(member function)
	void Print() 
	{
		// 멤버 함수에서 멤버 변수에 접근할때는 함수 내에서 서어된 지역 변수처럼 접근할 수 있다.
		cout << "pos = [ " << x << ", " << y << " ]" << endl;
	}
};

int main() {

	// 객체 (object) : 자료형이 클래스인 변수
	// → C++ 에서는 클래스의 이름이 자료형이 된다.
	Point pos;

	// 멤버 접근 연산자(.)를 이용해 객체의 멤버에 접근
	pos.x = 3;
	pos.y = 5;

	// 멤버 접근 연산자(.)를 이용해 객체의 멤버에 접근
	pos.Print();

	return 0;
}
*/