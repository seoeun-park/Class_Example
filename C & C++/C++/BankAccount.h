// FILE: BankAccount.h

class BankAccount
{
private:
	// 멤버 변수
	char* owner;			// 소유자
	int accountNumber;			// 계좌번호
	int balance;				// 잔고

	// 복사 생성자와 설정자를 보안 문제로 private 멤버로 설정할 경우 외부에서 이 생성자를 
	// 통해 객체를 생성하지 못한다.
	// 복사 생성자
	BankAccount(const BankAccount& copy);

	// 설정자
	void SetOwner(const char* _owner);
	void SetAccountNumber(int _accountNumber);
	// void SetBalance(int _balance);	→ 보안상의 문제로 은행 잔고의 변수를 초기화시키는
	//									   설정자는 작성하지 않는 것이 좋다.

//----------------------------------------------------------------------------------------
public:
	// 생성자
	BankAccount(const char* _owner = nullptr, int _accountNumber = 0, int _balance = 0);

	// 소멸자
	~BankAccount();

	// 접근자
	const char* GetOwner() const;
	int GetAccountNumber() const;
	int GetBalance() const;

	BankAccount& Deposit(int _balance);
	BankAccount& Withdraw(int _balance);

	// 출력
	void PrintBalance();
	void Print();
};
