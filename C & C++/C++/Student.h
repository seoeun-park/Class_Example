// FILE: Student.h
// �� Student Ŭ������ ��� ���� (Ŭ���� ����)

class Student
{

private:
	// ��� ����
	char name[81];
	int korean, math, english;
	char grade;
	double average;

public:
	// ��� �Լ�
	// �� ��� ���ϰ� �ҽ� ���Ϸ� �и��� ���, Ŭ���� ���ǿ����� ��� �Լ����� ���� �����ϰ�
	//	  ��� �Լ��� ���Ǵ� �ҽ� ���Ͽ��� �ۼ��Ѵ�.

	// ������(constructor)
	// �� �����ڿ����� ��� ������ �ʱ�ȭ �� ��ü�� ������ �� �ִ� �غ������ ó���Ѵ�.
	// �� �����ڸ� ������ ���� �⺻ �������� ������ ������ ������(�ʱ�ȭ��Ű�� �� ���� ȣ��Ǵ� ������)
	//	  �� �߰��ؾ� �Ѵ�.
	// �� ��� ������ �ʱ�ȭ�� ��� �ʱ�ȭ ����Ʈ�� ���� ó���Ѵ�.
	// �� ��� �Լ��� ����� ���ǰ� �и��� ��쿡�� ��� �ʱ�ȭ ����Ʈ�� ��� �Լ� ���ǿ�����
	//	  �ۼ��Ѵ�.
	Student(const char* str = nullptr, int korean = 0, int math = 0, int english = 0);

	// �Ҹ���(destructor)
	// �� ���� �Ҹ��ڰ� �ʿ� �����Ƿ� �⺻ �Ҹ��� ���

	// ������(setter)
	void SetName(const char* str);
	void SetKorean(int n);
	void SetMath(int n);
	void SetEnglish(int n);

	// ��� ���� average�� grade�� �ܺο��� ���� �޾ƿ��� ���� �ƴ϶� ��꿡 ���� ��������.
	// ���� �Ű� ������ �ʿ� ����.
	void SetAverage();
	void SetGrade();

	// ������(getter)
	const char* GetName();
	int GetKorean();
	int GetMath();
	int GetEnglish();
	double GetAverage();
	char GetGrade();

	// ���
	void Print();

};
