#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
#include "DeskLamp.h"

using std::cout;
using std::cin;
using std::endl;

int main() {

	// ��ü ����
	DeskLamp myLamp;

	// å�� ������� �� ����, ���� ���
	myLamp.TurnOn().PrintStatus();

	// å�� ������� �� ����, ���� ���
	myLamp.TurnOff().PrintStatus();

	return 0;
}
