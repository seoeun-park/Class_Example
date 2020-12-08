// FILE: Student.cpp
// → student 클래스의 소스 파일(멤버 함수의 정의)

#define _CRT_SECURE_NO_WARNINGS

// 헤더 파일 포함
// → 표준 라이브러리의 헤더파일을 나타낼 때는 꺽쇠괄호(<>)로 묶지만
//	 개발자가 추가한 헤더 파일은 큰 따옴표("")로 묶는다 이때 파일 확장자까지 넣어야 한다.
#include <iostream>
#include <cstring>
#include "Student.h"

using std::cout;
using std::endl;

// 멤버 함수를 클래스 외부에서 정의 할때는 클래스의 이름과 범위 지정 연산자(::)를 사용해서
// 어떤 클래스의 멤버 함수인지 지정해야 한다.

// 매개 변수의 기본 값은 함수의 선언부에만 작성한다.
// 생성자의 멤버 초기화 리스트는 함수의 정의부에만 작성한다.

// 생성자(constructor)
Student::Student(const char* str, int korean, int math, int english)
	: name{0}, korean(0), math(0), english(0), average(0.0), grade('F')
{
	// 멤버 변수의 식별자와 지역 변수의 식별자가 충돌하면 지역 변수가 우선한다.

	// 설정자를 이용해 멤버 변수(지역 변수x)에 잘못된 값이 들어가지 않도록 방지한다.
	SetName(str);
	SetKorean(korean);
	SetMath(math);
	SetEnglish(english);
}

// 소멸자(destructor)
// → 따로 소멸자가 필요 없으므로 기본 소멸자 사용

// 설정자(setter)
void Student::SetName(const char* str)
{
	// 매개변수에 전달된 값이 제대로된 문자열인지 확인
	if (!str) return;

	// 멤버 변수 name에 매개변수에 전달된 문자열을 복사
	strncpy(name, str, 81);
}
void Student::SetKorean(int score)
{
	// 각 과목의 점수는 0과 100 사이
	if (score >= 0 && score <= 100)
		korean = score;
}
void Student::SetMath(int score)
{
	if (score >= 0 && score <= 100)
		math = score;
}
void Student::SetEnglish(int score)
{
	if (score >= 0 && score <= 100)
		english = score;
}
void Student::SetAverage()
{
	// 각 과목의 점수르 계산해 평균 점수 계산
	average = (double)(korean + math + english) / 3;
}
void Student::SetGrade()
{
	// 등급을 계산하기 전에 평균 점수부터 계산해야 한다.
	SetAverage();

	// 평균 졈수를 이용해 등급 계산
	if (average >= 90) grade = 'A';
	else if (average >= 80) grade = 'B';
	else if (average >= 70) grade = 'C';
	else if (average >= 60)	grade = 'D';
	else grade = 'F';
	
}

// 접근자(getter)
const char* Student::GetName() { return name; }
int Student::GetKorean() { return korean; }
int Student::GetMath() { return math; }
int Student::GetEnglish() { return english; }
double Student::GetAverage() { return average; }
char Student::GetGrade() { return grade; }

// 출력
void Student::Print()
{
	// 출력하기 전에 평균 점수와 등급을 먼저 계산해야 한다.
	SetGrade();

	// 이름과 평균 점수, 등급을 출력
	cout << "Name: " << name << endl;
	cout << "Average: " << average  << endl;
	cout << "Grade: " << grade << endl << endl;
}