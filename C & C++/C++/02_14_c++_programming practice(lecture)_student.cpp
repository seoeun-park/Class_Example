#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
// student Ŭ������ ���ǵǾ� �ִ� ��� ���� ����
#include "Student.h"

using std::cout;
using std::cin;
using std::endl;

// �ҽ� ����:C++ �ҽ� �ڵ尡 �ۼ��Ǵ� ����(*.cpp)
// ��� ����: Ŭ���� �Ǵ� ����ü�� ����, �Լ��� ���� ���� ���ԵǴ� ����(*.h)

// Ŭ����
// �� 1. ��� ����: Ŭ������ ����(��� �Լ��� ���� ����)(Student.h)
//	 2. �ҽ� ����: ũ���� ��� �Լ��� ����(Student.cpp)
//	 3. ���� �Լ��� ���Ե� �ҽ� ����


int main() {


	Student kim("��ö��", 88, 76, 64);
	Student park("�ڿ���", 92, 88, 94);
	Student hong("ȫ�浿", 96, 64, 48);

	// c���
	kim.Print();
	park.Print();
	hong.Print();



	return 0;


}