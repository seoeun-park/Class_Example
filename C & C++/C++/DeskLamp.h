// FILE: DeskLamp.h

class DeskLamp
{
private:
	// ��� ����
	// static bool isOn;
	// �� ������� ���� ���� ��� ���� ������ ���� �������� ������ �� �� ���� ������
	//	  ���� ������ ���� �ʾƾ� �Ѵ�.
	bool isOn;

public:
	// ��� �Լ�
	DeskLamp(bool _isOn = false);
	DeskLamp& TurnOn();
	DeskLamp& TurnOff();
	bool GetStatus();
	void PrintStatus();
};
