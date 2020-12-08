// FILE: BankAccount.h

class BankAccount
{
private:
	// ��� ����
	char* owner;			// ������
	int accountNumber;			// ���¹�ȣ
	int balance;				// �ܰ�

	// ���� �����ڿ� �����ڸ� ���� ������ private ����� ������ ��� �ܺο��� �� �����ڸ� 
	// ���� ��ü�� �������� ���Ѵ�.
	// ���� ������
	BankAccount(const BankAccount& copy);

	// ������
	void SetOwner(const char* _owner);
	void SetAccountNumber(int _accountNumber);
	// void SetBalance(int _balance);	�� ���Ȼ��� ������ ���� �ܰ��� ������ �ʱ�ȭ��Ű��
	//									   �����ڴ� �ۼ����� �ʴ� ���� ����.

//----------------------------------------------------------------------------------------
public:
	// ������
	BankAccount(const char* _owner = nullptr, int _accountNumber = 0, int _balance = 0);

	// �Ҹ���
	~BankAccount();

	// ������
	const char* GetOwner() const;
	int GetAccountNumber() const;
	int GetBalance() const;

	BankAccount& Deposit(int _balance);
	BankAccount& Withdraw(int _balance);

	// ���
	void PrintBalance();
	void Print();
};
