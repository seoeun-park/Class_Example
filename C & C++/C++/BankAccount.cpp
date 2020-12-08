// FILE : BankAccount.cpp
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
#include "BankAccount.h"

using std::cout;
using std::endl;

// 기본 복사 생성자
BankAccount::BankAccount(const BankAccount& copy)
	: owner(nullptr), accountNumber(copy.accountNumber), balance(copy.balance)		
	// 얕은 복사 → 모든 멤버 변수 다 해야 함
{
	// "깊은 복사"를 하기 위해 설정자를 통해서 owner 정보 복사
	SetOwner(copy.owner);
}

// 설정자
void BankAccount::SetOwner(const char* _owner)
{
	// 매개변수로 널 포인터가 넘어온 경우인지 확인
	if (!_owner) return;

	// 문자열의 길이 확인
	int length = strlen(_owner);

	// 문자열의 길이를 확인해서 제대로 된 문자열인지 확인
	if (length <= 0) return;

	// 이전에 할당받은 저장 공간이 있다면 해제
	if (owner) delete[] owner;

	// 문자열의 길이만큼 동적 메모리 할당
	owner = new char[length + 1];

	// 제대로 저장 공간을 할당 받았는지 확인
	if (!owner)
	{
		cout << "ERROR : Insufficient Memory!" << endl;

		// 함수 강제 종료
		exit(1);
	}
	// 문자열 복사
	strcpy(owner, _owner);

}

void BankAccount::SetAccountNumber(int _accountNumber)
{
	// 계좌번호도 검사한 후에 저장해야 하지만 여기에서는 그냥 저장
	accountNumber = _accountNumber;
}

// 생성자
BankAccount::BankAccount(const char* _owner, int _accountNumber, int _balance)
	: owner(nullptr), accountNumber(0), balance(0)
{
	SetOwner(_owner);
	SetAccountNumber(_accountNumber);
}

// 소멸자
BankAccount::~BankAccount()
{
	// 동적으로 할당받은 저장 공간이 있으면 반드시 소멸자에서 해제해야 한다.
	if (owner) delete[] owner;
}

// 접근자
const char* BankAccount::GetOwner() const { return owner; }
int BankAccount::GetAccountNumber() const { return accountNumber; }
int BankAccount::GetBalance() const { return balance; }

BankAccount& BankAccount::Deposit(int _balance)
{
	// 2. 입금과 출금의 금액이 음수의 값이 되지 않도록 설정해야 한다.
	if (_balance < 0)
	{
		cout << "[ERROR] Invalid amount!" << endl;
		return *this;
	}

	balance += _balance;

	// 자기 참조자 반환
	return *this;
}
BankAccount& BankAccount::Withdraw(int _balance)
{
	// 2. 입금과 출금의 금액이 음수의 값이 되지 않도록 설정해야 한다.
	if (_balance < 0)
	{
		cout << "[ERROR] Invalid amount!" << endl;
		return *this;
	}

	// 1. 잔고 이상의 금액이 출금되면 출금이 되지 못하도록 설정해야 한다.
	if (balance < _balance)
	{
		cout << "[ERROR] Insufficient Balance!" << endl;
		return *this;
	}

	balance -= _balance;

	// 자기 참조자 반환
	return *this;
}

// 출력
void BankAccount::PrintBalance()
{
	cout << "Balance: " << balance << endl;
}
void BankAccount::Print()
{
	cout << "Owner: " << owner << endl;
	cout << "AccountNumber: " << accountNumber << endl;
	cout << "Balance: " << balance << endl;
 }
