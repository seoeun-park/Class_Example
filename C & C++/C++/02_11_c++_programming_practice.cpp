#include <iostream>

using std::cout;
using std::cin;
using std::endl;
/*
// ���� �� Ǯ��
// �������� (1) : ����ڿ��� ���ڿ��� �Է¹޾� �� ���ڿ��� ������ ����ϴ�
//				  ���α׷��� �ۼ��϶�. �̶� ���ڿ��� �ִ� ���̴� 80�ڷ� �Ѵ�.
int main() {

	char str[81] = { 0 };
	char cnv[81] = { 0 };

	std::cout << "Enter a string: ";

	std::cin.getline(str, 80);

	int length = strlen(str);

	for (int i = 0; i < length; i++) {
		cnv[i] = str[length - i - 1];
	}

	std::cout << "cnv = " << cnv << std::endl;

	return 0;
}
*/

/*
int main() {

	// ���ڿ��� �����ϱ� ���� �迭 ����
	char str[81] = { 0 };

	// ����� �Է�
	std::cout << "Enter a string: ";
	std::cin.getline(str, 80);

	// ���ڿ��� ���� ���
	int length = strlen(str);

	std::cout << "str = " << str << std::endl;
	std::cout << "length = " << length << std::endl;
	std::cout << "rev = ";

	// �ݺ����� �̿��� ���ڿ��� ������ ���ڿ������� ù��° ���ڱ��� ���
	for (int i = length - 1; i >= 0; i--)
		std::cout << str[i];



	return 0;
}
*/

/*
// �������� (2) ����ڿ��� ���ڿ��� �Է� �޾�, �� ���ڿ����� ���ڰ� �� �� ��������
//				����ϰ�, ���� Ƚ����ŭ ���� ����ϴ� ���α׷��� �ۼ��϶�. �̶� ���ڿ���
//				�ִ� ���̴� 80�ڷ� �Ѵ�.
int main() {

	// ���ڿ��� �����ϱ� ���� �迭 ����
	char str[81];

	// ���ڿ����� �� ���ڰ� ���� Ƚ���� ������ �迭
	// �迭�� ũ��: ('z'- 'A') + 1= 58
	const int LENGTH = 58;
	// counter[0] = 'A'�� ���� Ƚ��
	// counter[25] = 'Z'�� ���� Ƚ��
	// counter[32] = 'a'�� ���� Ƚ��
	// counter[57] = 'z'�� ���� Ƚ��
	int counter[58] = { 0 };

	// ����� �Է�
	cout << "Enter an string: ";
	cin.getline(str, LENGTH);

	// for ������ �̿��� �� ���ڰ� �����ų� �迭�� ���� ���� ������ �ݺ����� ����
	for (int i = 0; str[i] != 0; i++)

		// str[i] ���Ұ� �빮�� ���� �ҹ������� Ȯ��
		if ((str[i] >= 'A' && str[i] <= 'Z') || (str[i] >= 'a' && str[i] <= 'z'))

			// str[i] ���ҿ� �ش��ϴ� �迭 counter�� ���Ҹ� ����
			counter[str[i] - 'A']++;

	// ���
	cout << "Number of alphabets" << endl;
	for (int i = 0; i < LENGTH; i++)
	{
		// ���ڰ� ������ �ʾҴٸ� �׳� �Ѿ��.
		if (counter[i] == 0) continue;
		// if (!counter[i]) continue;

		cout << (char)('A' + i) << " : ";

		// ���� Ƚ����ŭ * ���
		for (int j = 0; j < counter[i]; j++)
			cout << "*";

		// ����
		cout << endl;
	}


	return 0;
}
*/