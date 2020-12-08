#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
// student 클래스가 정의되어 있는 헤더 파일 포함
#include "Student.h"

using std::cout;
using std::cin;
using std::endl;

// 소스 파일:C++ 소스 코드가 작성되는 파일(*.cpp)
// 헤더 파일: 클래스 또는 구조체의 정의, 함수의 선언 등이 포함되는 파일(*.h)

// 클래스
// → 1. 헤더 파일: 클래스의 정의(멤버 함수의 선언 포함)(Student.h)
//	 2. 소스 파일: 크래스 멤버 함수의 정의(Student.cpp)
//	 3. 메인 함수가 포함된 소스 파일


int main() {


	Student kim("김철수", 88, 76, 64);
	Student park("박영희", 92, 88, 94);
	Student hong("홍길동", 96, 64, 48);

	// c출력
	kim.Print();
	park.Print();
	hong.Print();



	return 0;


}