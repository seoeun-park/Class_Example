#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
#include "DeskLamp.h"

using std::cout;
using std::cin;
using std::endl;

int main() {

	// 객체 생성
	DeskLamp myLamp;

	// 책상 조명등을 켠 다음, 상태 출력
	myLamp.TurnOn().PrintStatus();

	// 책상 조명등을 끈 다음, 상태 출력
	myLamp.TurnOff().PrintStatus();

	return 0;
}
