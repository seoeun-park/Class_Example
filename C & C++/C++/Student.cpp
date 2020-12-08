// FILE: Student.cpp
// �� student Ŭ������ �ҽ� ����(��� �Լ��� ����)

#define _CRT_SECURE_NO_WARNINGS

// ��� ���� ����
// �� ǥ�� ���̺귯���� ��������� ��Ÿ�� ���� �����ȣ(<>)�� ������
//	 �����ڰ� �߰��� ��� ������ ū ����ǥ("")�� ���´� �̶� ���� Ȯ���ڱ��� �־�� �Ѵ�.
#include <iostream>
#include <cstring>
#include "Student.h"

using std::cout;
using std::endl;

// ��� �Լ��� Ŭ���� �ܺο��� ���� �Ҷ��� Ŭ������ �̸��� ���� ���� ������(::)�� ����ؼ�
// � Ŭ������ ��� �Լ����� �����ؾ� �Ѵ�.

// �Ű� ������ �⺻ ���� �Լ��� ����ο��� �ۼ��Ѵ�.
// �������� ��� �ʱ�ȭ ����Ʈ�� �Լ��� ���Ǻο��� �ۼ��Ѵ�.

// ������(constructor)
Student::Student(const char* str, int korean, int math, int english)
	: name{0}, korean(0), math(0), english(0), average(0.0), grade('F')
{
	// ��� ������ �ĺ��ڿ� ���� ������ �ĺ��ڰ� �浹�ϸ� ���� ������ �켱�Ѵ�.

	// �����ڸ� �̿��� ��� ����(���� ����x)�� �߸��� ���� ���� �ʵ��� �����Ѵ�.
	SetName(str);
	SetKorean(korean);
	SetMath(math);
	SetEnglish(english);
}

// �Ҹ���(destructor)
// �� ���� �Ҹ��ڰ� �ʿ� �����Ƿ� �⺻ �Ҹ��� ���

// ������(setter)
void Student::SetName(const char* str)
{
	// �Ű������� ���޵� ���� ����ε� ���ڿ����� Ȯ��
	if (!str) return;

	// ��� ���� name�� �Ű������� ���޵� ���ڿ��� ����
	strncpy(name, str, 81);
}
void Student::SetKorean(int score)
{
	// �� ������ ������ 0�� 100 ����
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
	// �� ������ ������ ����� ��� ���� ���
	average = (double)(korean + math + english) / 3;
}
void Student::SetGrade()
{
	// ����� ����ϱ� ���� ��� �������� ����ؾ� �Ѵ�.
	SetAverage();

	// ��� ������ �̿��� ��� ���
	if (average >= 90) grade = 'A';
	else if (average >= 80) grade = 'B';
	else if (average >= 70) grade = 'C';
	else if (average >= 60)	grade = 'D';
	else grade = 'F';
	
}

// ������(getter)
const char* Student::GetName() { return name; }
int Student::GetKorean() { return korean; }
int Student::GetMath() { return math; }
int Student::GetEnglish() { return english; }
double Student::GetAverage() { return average; }
char Student::GetGrade() { return grade; }

// ���
void Student::Print()
{
	// ����ϱ� ���� ��� ������ ����� ���� ����ؾ� �Ѵ�.
	SetGrade();

	// �̸��� ��� ����, ����� ���
	cout << "Name: " << name << endl;
	cout << "Average: " << average  << endl;
	cout << "Grade: " << grade << endl << endl;
}