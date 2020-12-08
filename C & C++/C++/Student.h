// FILE: Student.h
// → Student 클래스의 헤더 파일 (클래스 정의)

class Student
{

private:
	// 멤버 변수
	char name[81];
	int korean, math, english;
	char grade;
	double average;

public:
	// 멤버 함수
	// → 헤더 파일과 소스 파일로 분리한 경우, 클래스 정의에서는 멤버 함수들의 선언만 포함하고
	//	  멤버 함수의 정의는 소스 파일에서 작성한다.

	// 생성자(constructor)
	// → 생성자에서는 멤버 변수의 초기화 등 객체가 동작할 수 있는 준비과정을 처리한다.
	// → 생성자를 정의할 때는 기본 생성자의 역할을 수행할 생성자(초기화시키는 값 없이 호출되는 생성자)
	//	  를 추가해야 한다.
	// → 멤버 변수의 초기화는 멤버 초기화 리스트를 통해 처리한다.
	// → 멤버 함수의 선언과 정의가 분리된 경우에는 멤버 초기화 리스트는 멤버 함수 정의에서만
	//	  작성한다.
	Student(const char* str = nullptr, int korean = 0, int math = 0, int english = 0);

	// 소멸자(destructor)
	// → 따로 소멸자가 필요 없으므로 기본 소멸자 사용

	// 설정자(setter)
	void SetName(const char* str);
	void SetKorean(int n);
	void SetMath(int n);
	void SetEnglish(int n);

	// 멤버 변수 average와 grade는 외부에서 값을 받아오는 것이 아니라 계산에 의해 구해진다.
	// 따라서 매개 변수가 필요 없다.
	void SetAverage();
	void SetGrade();

	// 접근자(getter)
	const char* GetName();
	int GetKorean();
	int GetMath();
	int GetEnglish();
	double GetAverage();
	char GetGrade();

	// 출력
	void Print();

};
