// FILE : BankAccount.cpp
#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
#include "BankAccount.h"

using std::cout;
using std::endl;

// �⺻ ���� ������
BankAccount::BankAccount(const BankAccount& copy)
	: owner(nullptr), accountNumber(copy.accountNumber), balance(copy.balance)		
	// ���� ���� �� ��� ��� ���� �� �ؾ� ��
{
	// "���� ����"�� �ϱ� ���� �����ڸ� ���ؼ� owner ���� ����
	SetOwner(copy.owner);
}

// ������
void BankAccount::SetOwner(const char* _owner)
{
	// �Ű������� �� �����Ͱ� �Ѿ�� ������� Ȯ��
	if (!_owner) return;

	// ���ڿ��� ���� Ȯ��
	int length = strlen(_owner);

	// ���ڿ��� ���̸� Ȯ���ؼ� ����� �� ���ڿ����� Ȯ��
	if (length <= 0) return;

	// ������ �Ҵ���� ���� ������ �ִٸ� ����
	if (owner) delete[] owner;

	// ���ڿ��� ���̸�ŭ ���� �޸� �Ҵ�
	owner = new char[length + 1];

	// ����� ���� ������ �Ҵ� �޾Ҵ��� Ȯ��
	if (!owner)
	{
		cout << "ERROR : Insufficient Memory!" << endl;

		// �Լ� ���� ����
		exit(1);
	}
	// ���ڿ� ����
	strcpy(owner, _owner);

}

void BankAccount::SetAccountNumber(int _accountNumber)
{
	// ���¹�ȣ�� �˻��� �Ŀ� �����ؾ� ������ ���⿡���� �׳� ����
	accountNumber = _accountNumber;
}

// ������
BankAccount::BankAccount(const char* _owner, int _accountNumber, int _balance)
	: owner(nullptr), accountNumber(0), balance(0)
{
	SetOwner(_owner);
	SetAccountNumber(_accountNumber);
}

// �Ҹ���
BankAccount::~BankAccount()
{
	// �������� �Ҵ���� ���� ������ ������ �ݵ�� �Ҹ��ڿ��� �����ؾ� �Ѵ�.
	if (owner) delete[] owner;
}

// ������
const char* BankAccount::GetOwner() const { return owner; }
int BankAccount::GetAccountNumber() const { return accountNumber; }
int BankAccount::GetBalance() const { return balance; }

BankAccount& BankAccount::Deposit(int _balance)
{
	// 2. �Աݰ� ����� �ݾ��� ������ ���� ���� �ʵ��� �����ؾ� �Ѵ�.
	if (_balance < 0)
	{
		cout << "[ERROR] Invalid amount!" << endl;
		return *this;
	}

	balance += _balance;

	// �ڱ� ������ ��ȯ
	return *this;
}
BankAccount& BankAccount::Withdraw(int _balance)
{
	// 2. �Աݰ� ����� �ݾ��� ������ ���� ���� �ʵ��� �����ؾ� �Ѵ�.
	if (_balance < 0)
	{
		cout << "[ERROR] Invalid amount!" << endl;
		return *this;
	}

	// 1. �ܰ� �̻��� �ݾ��� ��ݵǸ� ����� ���� ���ϵ��� �����ؾ� �Ѵ�.
	if (balance < _balance)
	{
		cout << "[ERROR] Insufficient Balance!" << endl;
		return *this;
	}

	balance -= _balance;

	// �ڱ� ������ ��ȯ
	return *this;
}

// ���
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
