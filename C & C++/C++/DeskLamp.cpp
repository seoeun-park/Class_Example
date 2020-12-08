// FILE: DeskLamp.cpp

#include <iostream>
#include "DeskLamp.h"

using std::cout;
using std::endl;

	DeskLamp::DeskLamp(bool _isOn)
		: isOn(false)	{ }

	DeskLamp& DeskLamp::TurnOn()
	{
		// if (!isOn)	
			isOn = true;

		return *this;
	}
	DeskLamp& DeskLamp::TurnOff()
	{
		//if (isOn)	
			isOn = false;

		return *this;
	}

	bool DeskLamp::GetStatus() { return isOn; }

	void DeskLamp::PrintStatus()
	{
		cout << "State of your lamp is " << (isOn ? "on" : "off") << endl;
	}

	// static 변수 초기화
	// bool DeskLamp::isOn = false;
