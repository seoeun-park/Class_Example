#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>

using std::cout;
using std::cin;
using std::endl;
/*
class Student 
{

private:

	char name[81];
	int korean, math, english;
	char grade;
	double average;

public:

	// 설정자
	void SetName(const char* str)
	{
		strncpy(name, str, 81);
	}

	void SetKorean(int kor) 
	{
		korean = (kor >= 0 && kor <= 100) ? kor : 0;
	}

	void SetMath (int mat) 
	{
		math = (mat >= 0 && mat <= 100) ? mat : 0;
	}

	void SetEnglish (int eng) 
	{
		english = (eng >= 0 && eng <= 100) ? eng : 0;
	}

	void SetAverage (int x, int y, int z)
	{
		x = korean;
		y = math;
		z = english;
		average = (double)(x + y + z) / 3;
	}

	void SetGrade (double ave)
	{
		average = ave;

		if (ave >= 90) {
			grade = 'A';
			//grade = gra;
		}
		else if (ave >= 80) {
			grade = 'B';
			//grade = gra;
		}
		else if (ave >= 70) {
			grade = 'C';
			//grade = gra;
		}
		else if (ave >= 60) {
			grade = 'D';
			//grade = gra;
		}
		else {
			grade = 'F';
			//grade = gra;
		}
	}

	// 접근자
	const char* GetName () { return name; }
	int GetKorean () { return korean; }
	int GetMath () { return math; }
	int GetEnglish () { return english; }
	char GetGrade() { return grade; }
	double GetAverage() { return average; }

	void Print() {
		cout << "이름: " << name << " 국어: " << korean << " 수학: " 
		<< math << " 영어: " << english << endl;

		cout << "평균 점수: " << average << " 학점: " << grade << endl;
	}

};

int main() {

	Student pos1, pos2, pos3;

	pos1.SetName("김철수");
	pos2.SetName("박영희");
	pos3.SetName("홍길동");

	pos1.SetKorean(88);
	pos2.SetKorean(92);
	pos3.SetKorean(96);
				  
	pos1.SetMath(76);
	pos2.SetMath(88);
	pos3.SetMath(64);

	pos1.SetEnglish(64);
	pos2.SetEnglish(94);
	pos3.SetEnglish(48);

	pos1.SetAverage(88, 92, 96);
	pos2.SetAverage(76, 88, 64);
	pos3.SetAverage(64, 94, 48);	
	
	double average_k = pos1.GetAverage();
	double average_p = pos2.GetAverage();
	double average_h = pos3.GetAverage();

	pos1.SetGrade(average_k);
	pos2.SetGrade(average_p);
	pos3.SetGrade(average_h);


	pos1.Print();	
	pos2.Print();
	pos3.Print();


}
*/