#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
// 간단한 클래스 Sample
class Sample
{
private:
	// 멤버 변수
	int data;

public:
	// 멤버 함수

	// 생성자(constructor)
	Sample() :data(0) { }

	// 변환 생성자(conversion constructor)
	// → 다른 값의 자료형을 클래스 자료형의 값으로형 변환할 때 호출되는 생성자
	Sample(int n) : data(n) { }

	// 변환 생성자: double 자료형의 값을 sample 자료형의 값으로 형 변환할 때 호출되는 생성자
	// Sample(double n) : data(n) { }

	// 변환 함수(conversion function)
	// → sample 자료형의 값을 다른 자료형의 값으로 변환할 때 호출되는 멤버 함수
	// → 변환 함수는 sample 자료형의 형 변환 연산자(cast operator)를 정의하는 것이다.
	operator int()
	{
		// 연산자 함수의 반환 값이 연산 결과가 된다.
		return data;
	}

	operator double()
	{
		return (double)data;
	}

	// 설정자(setter)
	void SetData(int n) { data = n; }

	// 접근자(getter)
	int GetData() { return data; }

	// 출력
	void Print() { cout << "data = " << data << endl; }


};

// Sample 클래스의 객체를 매개변수로 전달 받아 출력한 후 객체를 반환
// Sample& PrintSample(const Sample& obj)
// Sample obj = obj;(obj 자체가 아닌 임시 객체가 생성되어 값이 복사된 후 초기화)
// 즉 매개 변수가 객체일 경우 새로운 객체가 아닌 참조자를 전달한다.
//{
	// const를 붙이는 이유?
	// 새로운 저장 공간을 통해 객체가 생성되어 값을 전달하는 것이 아니라 똑같은 저장 공간에 있는 값을 
	// 참조자를 통해 전달하는 것이므로 값을 이런식으로(obj.SetData(20))마음대로 바꾸지 못하게 하기 위해서

	//obj.Print();

	//return obj;

//}

int main() {

	// 객체 생성
	Sample obj(10);

	// PrintSample 함수를 통해 객체 obj를 출력
	//obj = PrintSample(obj);

	// 출력
	obj.Print();

	// 객체 obj에 20을 대입
	obj = 20;
	// → obj = (Sample)20;
	// → obj = Sample(20);		→ 임시 객체가 생성된 후 값을 대입
	// 임시 객체 생성 후 생성자가 호출되는데 int형 값이 전달되므로 변환 생성자(Sample(int n) : data(n) { })가 호출된다.

	// 임시 객체 (temporary object)
	// → 클래스가 자료형인 값으로 변환되거나, 함수에서나 매개변수에 클래스가 자료형인 매개변수의 값을 전달하거나,
	//	  함수에서 객체를 반환하는 상황에서는 임시로 객체가 생성된다. 
	//	  이러한 객체를 임시 객체라고 한다.
	// → 임시 객체는 참조자로 참조하는 상황이 아니라면 문장이 끝나는 순간 소멸한다.

	// double value = 10;
	// → double value = (double)10;

	// 출력
	obj.Print();

	// 객체 obj에 3.14를 대입
	obj = 3.14;
	// → obj = (Sample)3.14;
	// → obj = Sample(3.14);
	// → obj = Sample(3);		→ 임시객체 생성 → 생성자의 매개변수가 int 자료형이기 때문에 형 변환이 일어난다.


	// 출력
	obj.Print();

	// 객체 obj를 int 자료형의 변수에 대입
	int value = obj;
	// → int value = (int)obj;
	// → 위 문장에서는 sample 자료형의 값 obj를 int 자료형의 값으로 형 변환하려고 시도하지만
	//	  바꿀수 없기 때문에 오류가 발생한다.
	//	  이 문제를 해결하기위해서는 sample 자료형에서 int 자료형으로 형 변환할 수 있는 방법을
	//	  제공해야 한다 이를 변환 함수(conversion function) 라고 한다.
	
	// 출력
	cout << "value = " << value << endl;


	return 0;
}
*/

/*
// 간단한 클래스 Sample
class Sample
{
private:
	// 멤버 변수
	int data;

	// 상수 멤버 변수(constant member variable)
	// → const 키워드를 붙여서 선언한 멤버 변수
	// → 상수이기 때문에 변수가 선언될 때 초기화 시켜줘야 하기 때문에 반드시 생성자의 멤버 초기화 리스트에서 
	//	  초기화시켜야 한다.
	const int MAX;

public:
	// 멤버 함수
	Sample(int n = 0) : data(0), MAX(256) { SetData(n); }
	
	// 특별한 경우가 아니라면, 설정자와 접근자는 모든 멤버 변수들에 대해 정의해놓아야 한다.
	void SetData(int n) 
	{ 
		data = (n > MAX) ? MAX : n;
	}

	// 상수 멤버 함수(constant member function)
	// → const 키워드를 붙여서 선언한 멤버 함수
	// → 상수 멤버 함수에서는 멤버 변수의 값을 바꿀 수 없다.
	// → 상수 객체에서는 상수 멤버 함수만 호출할 수 있다.
	//	  따라서 멤버 변수의 값을 변경하는 멤버 함수가 아니라면, 상수 멤버 함수로 선언하는 게 좋다.
	//	  (여기에서는 설정자가 멤버 변수의 값을 변경하는 멤버 함수이므로 상수 멤버 함수로 선언하면 x)
	// → const 선언 여부는 함수 오버로딩(function overloading)의 조건이 된다.
	int GetData() const { return data; }
	void Print() const { cout << "data = " << data << endl; }
	void Print() { cout << "data = " << data << endl; }		// 함수 오버로딩

	// friend 함수
	// → 클래스 외부의 함수에서 이 클래스의 private 멤버에 접근할 수 있도록 권한을 부여
	friend void PrintSample(const Sample& ref);

	// friend 클래스
	// → 다른 클래스의 멤버 함수에서 이 클래스의 private 멤버에 접근할 수 있도록 권한을 부여
	friend class ContSample;

	// friend 선언의 문제점
	// → friend 선언은 객체 지향의 대표적인 특징인 "정보 은닉"을 무너뜨린다.
	//	  그래서 그로 인해 다른 문제들을 야기하게 된다.
	// → friend 선언은 꼭 필요한 경우에만 소극적으로 사용해야 한다.
	// → friend를 사용하기 이전에 설정자와 접근자를 활용해야 한다.
};

// 클래스 외부의 함수이자 클래스 private 멤버에 접근하는 함수
void PrintSample(const Sample& ref)
{
	//ref.Print();

	cout << "ref.data = " << ref.data << endl;
	cout << "ref.data = " << ref.GetData << endl;
}

// Sample 자료형의 멤버 변수를 갖는 ContSample 클래스
class ContSample
{
private:
	Sample obj;

public:
	ContSample(int n) : obj(n) {}

	// void SetObj(int n) { obj.data = n; }
	void SetObj(int n) { obj.SetData = n; }

	// int GetObj() { return obj; }
	int GetObj() { return obj.GetData; }

	// void Print() { cout << "obj.data = " << obj.data << endl; }
	void Print() { cout << "obj.data = " << obj.GetData << endl; }
};

int main() {

	// 상수 객체(constant object)
	// → 상수 객체는 선언된 이후 값을 바꿀 수 없고, 상수 멤버 함수만 호출할 수 있다.
	const Sample obj;

	// obj.SetData(20);
	// 컴파일 오류

	obj.Print();		// void Print() const 호출
	
	// 객체 생성
	Sample obj2(20);

	// 출력
	obj2.Print();		// void Print() 호출

	// 
	PrintSample(obj2);	// void Print() const 호출


	return 0;
}
*/