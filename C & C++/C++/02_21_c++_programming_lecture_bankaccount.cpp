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

	// 1. 잔고 이상의 금액이 출금되면 출금이 되지 못하도록 설정해야 한다.
	myAccount.Withdraw(8000).PrintBalance();

	// 2. 입금과 출금의 금액이 음수의 값이 되지 않도록 설정해야 한다.
	myAccount.Withdraw(-3000).PrintBalance();


	return 0;
}