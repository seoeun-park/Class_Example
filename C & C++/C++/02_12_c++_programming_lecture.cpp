#include <iostream>
#include <cstdio>


// using 명령을 이용해 cout, cin, endl 식별자를 std 네임스페이스에서 찾도록 한다.
using std::cout;
using std::cin;
using std::endl;

// using 명령을 이용해 std 네임스페이스를 전역적으로 선언
// → std 네임스페이스에서 선언된 모든 식별자에 대해 네이스페이스 지정을 생략할 수 있다.
// → 식별자의 충돌을 막기 위해 네임스페이스를사용하는데 using namespace 명령을 사용하게 되면
//	  이러한 의도를 의미없게 만든다. 따라서 가능한 사용하지 않는 것이 좋다.
using namespace std;

/*
// 함수를 호출하는 방식
// 1.값에 의한 호출(call-by-value) : 함수를 호출하면서 값을 전달
// 2.참조에 의한 호출(call-by-reference) : 함수를 호출하면서 주소를 전달

// 1. 값에 의한 호출
void swap(char a, char b) {
// char a와 char b는 지역 변수이므로 swap 함수 내에서만 쓰일 수 있고 swap 함수 바깥
// 에서는 쓰일 수 없다.

	int tmp = a;
	// 포인터 a가 가리키는 저장공간에 저장된 값을 변수 tmp에 대입

	a = b;
	// 포인터 b가 가리키는 저장공간에 저장된 값을 포인텀거 가리키는 저장공간에 대입

	b = tmp;
	// 변수 tmp의 값을 포인터 b가 가리키는 저장공간에 대입

	cout << "a = " << a << ", b = " << b << endl;
	

}
*/

/*
// 2. 참조에 의한 호출 : 두 변수에 저장된 값을 교환하는 함수 swap 
// → 주소를 전달 받아 함수 외부에서 선언된 저장 공간에 접근할 수 있다.

// 함수 오버로딩(function overloading)
// → 매개변수의 자료형이나 개수가 다르면 같은 이름을 가진 함수라도 호출할 수 있다.
void swap(int* x, int* y) {
// int *a = &n1
// int *b = &n2

	// 포인터 연산자(*): 주소에 저장된 값에 접근하는 연산자

	char tmp = *x;
	// 포인터 x가 가리키는 저장공간에 저장된 값을 변수 tmp에 대입

	*x = *y;
	// 포인터 y가 가리키는 저장공간에 저장된 값을 포인터가 x가 가리키는 저장공간에 대입

	*y = tmp;
	// 변수 tmp의 값을 포인터 y가 가리키는 저장공간에 대입

}
void swap(char* a, char* b) {
// char* a = &c1
// char* b = &c2

	int tmp = *a;
	// 포인터 a가 가리키는 저장공간에 저장된 값을 변수 tmp에 대입

	*a = *b;
	// 포인터 b가 가리키는 저장공간에 저장된 값을 포인터 a가 가리키는 저장공간에 대입

	*b = tmp;
	// 변수 tmp의 값을 포인터 b가 가리키는 저장공간에 대입

}
int main() {

	// 변수 선언
	char c1 = 'A', c2 = 'B';
	 
	// 참조 연산자(&): 저장 공간의 주소를 구하는 연산자
	swap(&c1, &c2);
	// → swap( 'A', 'B');
	
	// 출력
	cout << "c1 = " << c1 << ", c2 = " << c2 << endl;

	// 또 다른 변수 선언
	int n1 = 10, n2 = 20;

	// 참조 연산자를 이용해 값을 치환
	swap(&n1, &n2);

	cout << "n1 = " << n1 << ", n2 = " << n2 << endl;



	return 0;
}
*/

/*
// 매크로 함수
// 지정한 표현식으로 치환된 다음에 컴파일 된다.
#define SQUARE(x)	x * x
#define SQUARE(x)	((x) * (x))

// 인라인 함수(inline function)
// → C 언어의 매크로 함수를 대체하기 위해 사용
// → 인라인 함수의 컴파일 된 명령어 코드가 인라인 함수를 호출하는 자리에 복사
// → 즉, 함수가 호출이 되지 않고 함수가 호출된 자리에 기계어 코드가 그대로 들어간다.
inline int square(int x) {

	return x * x;
}

int main () {

	cout << "SQUARE(3) = " << SQUARE(3) << endl;
	cout << "SQUARE(3 + 2) = " << SQUARE(3 + 2) << endl;
	// → cout << "SQUARE(3 + 2) = " << 3 + 2 * 3 + 2 << endl;
	// → cout << "SQUARE(3 + 2) = " << (3 + 2) * (3 + 2) << endl;

	cout << "63 / SQUARE(3) = " << 63 / SQUARE(3) << endl;
	// → cout << "63 / SQUARE(3) = " << 63 / (3) * (3) << endl;
	// → cout << "63 / SQUARE(3) = " << 63 / ((3) * (3)) << endl;

	cout << "square(3) = " << square(3) << endl;


	return 0;
}
*/

/*
int main() {

	cout << "sizeof(bool) = " << sizeof(bool) << endl;

	cout << "true = " << true << endl;			// 1
	cout << "false = " << false << endl;		// 0

	// boolalpha 조정자를 이용해 true는 "true"로, false는 "false"로 출력
	cout << std::boolalpha;

	cout << "true = " << true << endl;			// true
	cout << "false = " << false << endl;		// false


	return 0;
}
*/