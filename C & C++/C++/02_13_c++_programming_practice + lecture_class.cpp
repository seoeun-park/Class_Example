#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
// 연습문제: 속성(이름, 나이)과 기능(속성들의 값을 출력)을 가지는 사람(Person)을 클래스로 정의하라.
//			 → 구조체
struct person
{
	char name[81];
	int age;
};

void Print(struct person p) {

	cout << "name = " << p.name << endl << "age = " << p.age << endl;

}

int main() {

	struct person pos;

	strcpy(pos.name, "Michael Jackson");

	pos.age = 25;

	Print(pos);

	return 0;
}
*/

/*
//-----------------------------------------------------------------
// 연습문제 → 클래스
class Person {

// 접근 제어 지시자
private:

	// 멤버 변수(member variable)
	// → 특별한 경우가 아니라면 멤버 변수는 일반적으로 private 멤버로 설정
	char name[256];
	int age;

public:

	// 멤버 함수(member function)
	// → 멤버 함수는 특별한 경우가 아닌 이상 public 멤버로 설정

	// 설정자(setter)
	// → 멤버 변수는 private 멤버로 설정해서 외부에서 접근할 수 없도록 제한하고
	//	  멤버 변수의 값을 설정하기 위해 멤버 함수를 이용한다.
	// → 설정자를 사용하는 이유는 외부에서 멤버 변수에 잘못된 값을 지정하지 못하도록 할 수 있다.
	// → 설정자의 식별자는 보통 ("Set + 멤버변수")의 식별자로 작성한다. 
	void SetName(const char* str)
	{
		// → 매개변수를 상수로 선언하는 이유는 매개변수에 전달된 값을 함수 내에서 변경하지 
		//	  않겠다는 것을 나타내기 위해 매개변수를 상수로 선언한다.
		// → 문자열 상수를 전달 받는 매개변수는 반드시 const char* 자료형으로 선언해야 한다.
		strncpy(name, str, 256);
	}

	void SetAge (int n) 
	{
		// 설정자를 이용해 멤버 변수에 잘못된 값이 설정되는 것을 방지한다.
		age = (n < 0) ? 0 : n;
	}

	// 접근자(getter) 
	// →  멤버 변수의 값을 반환하는 멤버 함수
	// → 설정자의 식별자는 보통 ("Get + "멤버 변수의 식별자")로 작성한다.
	const char* GetName() { return name; }
	// → 멤버 함수의 반환 값이 주소인 경우 객체 외부에서 그 주소를 통해 멤버 변수의 값을
	//	  조작할 수있다. 따라서 이렇게 멤버 함수의 반환값이 주소인 경우에는 상수로 전달한다.

	int GetAge() { return age; }

	void Print ()
	{
		cout << "Name: " << name << endl;
		cout << "Age: " << age << endl << endl;
	}
};

int main() {

	// 객체(object): 자료형이 클래스인 변수
	Person pos;

	// 멤버 접근 연산자를 이용해 멤버 변수에 접근
	// pos.name은 배열이자 상수(주소)이고 문자열도 상수(주소)이므로 직접 대입할 수 없다.
	// 문자열을 배열에 대입할 때는 문자열을 배열에 복사해야 한다.
	// 그러나 멤버 변수를 private 멤버에 저장할 경우 
	// 멤버 접근 연산자를 이용해 멤버 변수에 접근할 수 없게 된다.
	// strncpy(pos.name, "Michael Jackson", 256);

	// 배열(array): 배열에 할당된 저장공간의 시작주소 
	// → 이 주소는 변경할 수 없다.
	// 문자열 상수(string constant): 문자열이 저장된 저장 공간의 시작 주소
	// → 이 주소와 이 주소에 저장된 값은 변경할 수 없다.
	pos.SetName("Michael Jackson");

	pos.SetAge(25);

	// 멤버 접근 연산자를 이용해 멤버 함수 호출
	pos.Print();

	cout << "Jackson's age is " << pos.GetAge() << endl;
	cout << "Jackson's name is " << pos.GetName() << endl << endl;

	return 0;
}
*/