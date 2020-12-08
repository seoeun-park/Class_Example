#define _CRT_SECURE_NO_WARNINGS

// 표준 입출력과 관련된 기능을 담고있는 헤더 파일
// C++ 프로그램에서는 표준 라이브러리의 헤더 파일을 포함할때 뒤에 파일 확장자를 붙이지 않는다.
#include <iostream>

// C언어의 표준 라이브러리에 있던 헤더 파일을 포함하고자 할 때에는 앞에"c"를붙인다.
#include <cstdio>

// 모든 C++ 프로그램에서는 반드시 main 함수가 있어야 한다.
// C++ 프로그램은 main함수에서 시작해서 main 함수로 끝난다.
/*
int main() {
	
	printf("Hello World!\n");

	// 표준 출력(std::cout)에 출력
	// → 표준 출력은 일반적으로 모니터에 해당한다.
	// → C++ 프로그램에서는 std 네임 스페이스(이름 공간)의 cout 객체를 이용해 표준 출력에 출력
	//    이미 출력하고자 하는 값은 스트림 삽입 연산자(<<) 다음에 지정한다.
	// → 스트림 삽입 연산자를 연계해서 사용한다.
	// → C++ 프로그램에서는 개행을 출력할때 endl(end of the line)명령을 사용한다.
	std::cout << "Hello World!" << std::endl;
	std::cout << "Hello" << "World!\n" << std::endl;

	// 지역변수(local variable)의 선언
	// → 블록 내에서 선언한 변수를 말하며 선언된 블록 내부에서만 유효하다.
	// → 변수가 선언된 블록이 끝나면 지역 변수는 자동으로 소멸한다.
	// → C++ 프로그램에서는 함수의 어느 곳에서나 선언할수있다.
	// → 하지만 가급적 변수는 함수의 도입부에 모아서 선언하는 것이 좋다.
	int num = 10;

	// 변수 num 출력
	printf("num = %d\n", num);

	// cout객체를 이용해 출력할 때는 출력할 값을 스트림 삽입 연산자(<<) 다음에 지정한다.
	std::cout << "num = " << num << std::endl;

	// 문자열을 배열에 복사
	char str[81] = "Nice to meet you!";
	// char str[81] = { 'N', 'i', 'c',  ... '\0'  };

	printf("str = %s\n", str);
	std::cout << "str = " << str << std::endl;

	//----------------------------------------------------------------------
	// 프람프트(prompt) 출력
	printf("Enter an integer: ");

	// 표준입력(stdin)으로 사용자 입력
	scanf("%d", &num);

	// 출력
	printf("num = %d\n", num);

	// std 네임 스페이스에서의 cin 객체와 스트림 출력 연산자(>>)를 이용해 사용자 출력
	// → cin 객체를 통해 입력 받은 값은 스트림 출력 연산자 다음에 지정한 변수에 대입된다.
	// → 이때 입력 받은 값의 자료형을 지정하지 않아도 변수의 자료형에 맞게 입력된다.
	// → 입력 값이 여러개인 경우 스트림 출력 연산자로 구분
	std::cin >> num;

	std::cout << "num = " << num << std::endl;
	
	
	//-------------------------------------------------------
	char str[81] = { 0 };

	// 표준 입력에서 문자열 입력
	printf("Enter an integer: ");
	scanf("%[^\n]s", str);

	printf("str = %s\n", str);
	
	// cin 객체를 이용해 문자열 입력
	std::cout << "Enter an string: ";

	// cin 객체를 통해 문자열을 읽어올 때 공백문자 (빈칸,탭,개행문자)를 입력하면 구분자로 
	// 취급하기 때문에 공백 문자 앞까지만 읽어오게 된다.
	//std::cin >> str;

	// cin 객체의 getlin 멤버 함수를 이용해 빈칸을 포함하는 문자열을 읽어온다.
	// → 첫 번째 매개변수는 문자열을 저장할 배열,두 번째 매개변수는 입력 받은 문자열의 최대 길이
	std::cin.getline(str, 80);

	std::cout << "str = " << str << std::endl;

	//-------------------------------------------------------------------------
	int n1, n2;

	// 프람프트 출력
	std::cout << "Enter two integer ";

	//cin 객체를 이용해 2개 이상의 값을 입력
	std::cin >> n1 >> n2;

	//출력
	std::cout << "n1 = " << n1 << "n2 = " << n2 << std::endl;


	// 함수의 반환 값은 운영체제(OS)에 전달된다. 이 값은 에러 코드(error code)라고 한다.
	return 0;
}
*/

/*
// 연습문제 (1) 사용자에게 두 수를 입력받아 두 수중 큰 값과 작은 값을 
//              뺀 값을 출력하는 프로그램을 작성하라.
int main() {

	int x, y;

	std::cout << "Enter an integer: ";

	// cin 객체를 통해 사용자 입력
	std::cin >> x >> y;

	// 1. 조건문을 이용해 사용자가 입력한 두 값중에 큰 값을 확인
	if (x > y) {
		std::cout << "max - min = " << (x - y) << std::endl;
	}
	else {
		std::cout << "max - min = " << (y - x) << std::endl;
	}
	
	// 2.조건 연산자를 이용해 사용자가 입력한 두 값중에 큰 값을 확인
	std::cout << "max - min = " << ((x > y) ? (x - y) : (y - x)) << std::endl;
	// 연산자 우선순위때문에 괄호를 묶어줘야 한다.


	return 0;
}
*/

/*
// 연습문제 (2) 사용자에게 2부터 9까지의 정수를 입력받아 
//              입력받은 수의 구구단을 출력하는 프로그램을 작성하라.
int main() {

	// 변수 선언
	int num;

	// 사용자 입력
	std::cout << "Enter an integer between 2 and 9: ";

	std::cin >> num;

	// 개행 출력
	std::cout << std::endl;

	// 반복문을 이용해 사용자가 입력한 값에 해당하는 구구단 출력
	for (int i = 1; i <= 9; i++) {

		std::cout << num << " * " << i << " = " << (num * i) << std::endl;
	}

	return 0;
}
*/