#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <cstring>
#include "BankAccount.h"

using std::cout;
using std::cin;
using std::endl;

int main() {

	BankAccount myAccount("Michael Jackson", 13275);

	myAccount.Print();
	cout << endl;

	myAccount.Deposit(10000).PrintBalance();
	myAccount.Withdraw(5000).PrintBalance();

	// 1. �ܰ� �̻��� �ݾ��� ��ݵǸ� ����� ���� ���ϵ��� �����ؾ� �Ѵ�.
	myAccount.Withdraw(8000).PrintBalance();

	// 2. �Աݰ� ����� �ݾ��� ������ ���� ���� �ʵ��� �����ؾ� �Ѵ�.
	myAccount.Withdraw(-3000).PrintBalance();


	return 0;
}