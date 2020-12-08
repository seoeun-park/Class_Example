#include <iostream>

using std::cout;
using std::cin;
using std::endl;
/*
// 내가 한 풀이
// 연습문제 (1) : 사용자에게 문자열을 입력받아 그 문자열을 뒤집어 출력하는
//				  프로그램을 작성하라. 이때 문자열의 최대 길이는 80자로 한다.
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

	// 문자열을 저장하기 위해 배열 선언
	char str[81] = { 0 };

	// 사용자 입력
	std::cout << "Enter a string: ";
	std::cin.getline(str, 80);

	// 문자열의 길이 계산
	int length = strlen(str);

	std::cout << "str = " << str << std::endl;
	std::cout << "length = " << length << std::endl;
	std::cout << "rev = ";

	// 반복문을 이용해 문자열의 마지막 문자에서부터 첫번째 문자까지 출력
	for (int i = length - 1; i >= 0; i--)
		std::cout << str[i];



	return 0;
}
*/

/*
// 연습문제 (2) 사용자에게 문자열을 입력 받아, 그 문자열에서 문자가 몇 변 나오는지
//				계산하고, 나온 횟수만큼 별을 출력하는 프로그램을 작성하라. 이때 문자열의
//				최대 길이는 80자로 한다.
int main() {

	// 문자열을 저장하기 위한 배열 선언
	char str[81];

	// 문자열에서 각 문자가 나온 횟수를 저장할 배열
	// 배열의 크기: ('z'- 'A') + 1= 58
	const int LENGTH = 58;
	// counter[0] = 'A'가 나온 횟수
	// counter[25] = 'Z'가 나온 횟수
	// counter[32] = 'a'가 나온 횟수
	// counter[57] = 'z'가 나온 횟수
	int counter[58] = { 0 };

	// 사용자 입력
	cout << "Enter an string: ";
	cin.getline(str, LENGTH);

	// for 구문을 이용해 널 문자가 나오거나 배열의 끝을 만날 때까지 반복문을 수행
	for (int i = 0; str[i] != 0; i++)

		// str[i] 원소가 대문자 도는 소문자인지 확인
		if ((str[i] >= 'A' && str[i] <= 'Z') || (str[i] >= 'a' && str[i] <= 'z'))

			// str[i] 원소에 해당하는 배열 counter의 원소를 증가
			counter[str[i] - 'A']++;

	// 출력
	cout << "Number of alphabets" << endl;
	for (int i = 0; i < LENGTH; i++)
	{
		// 문자가 나오진 않았다면 그냥 넘어간다.
		if (counter[i] == 0) continue;
		// if (!counter[i]) continue;

		cout << (char)('A' + i) << " : ";

		// 나온 횟수만큼 * 출력
		for (int j = 0; j < counter[i]; j++)
			cout << "*";

		// 개행
		cout << endl;
	}


	return 0;
}
*/