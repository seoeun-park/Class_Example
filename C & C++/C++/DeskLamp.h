// FILE: DeskLamp.h

class DeskLamp
{
private:
	// 멤버 변수
	// static bool isOn;
	// → 조명등이 여러 개일 경우 정적 변수를 쓰면 개별적인 조작을 할 수 없기 때문에
	//	  정적 변수를 쓰지 않아야 한다.
	bool isOn;

public:
	// 멤버 함수
	DeskLamp(bool _isOn = false);
	DeskLamp& TurnOn();
	DeskLamp& TurnOff();
	bool GetStatus();
	void PrintStatus();
};
