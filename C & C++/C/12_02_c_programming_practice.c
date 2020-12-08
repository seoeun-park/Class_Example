#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main() {

	// 연습문제(1) : 사용자가 숫자 0을 입력할 때까지 또는 최대 30개의 정수를
	//	입력할 때까지 정수를 입력 받아, 그 숫자들의 평균을 구하고 
	//	사용자가 입력한 숫자들 중에서평균 이상인 숫자들의 비율을 구하는 프로그램을 작성하라

	// 사용자가 입력할 값들을 저장할 배열
	int numbers[30] = { 0 };

	// 인덱스 변수
	int i;

	// 사용자가 입력한 값들의 개수
	int count_input = 0;

	// 평균보다 더 큰 값들의 개수
	int count_gt = 0;

	// 평균보다 더 큰 값들의 비율(%) 계산
	int ratio_gt;

	// 합계와 평균을 저장할 변수
	int sum = 0;
	double average;


	// 반복문을 이용해 사용자에게 최대 30개의 정수 입력
	// → 여기에서는 입력받는 값의 개수에 제한이 있기 대문에 do-while구문보다는
	//	for 구문을 사용하는 것이 더 좋다
	for (i = 0; i < 30; i++)
	{
		// 사용자 입력
		printf("Enter an integer: ");

		scanf("%d", &numbers[i]);
		// 사용자가 입력한 값을 배열 numbers의 i번째 원소에 저장
		// 배열의 원소일때는 참조 연산자를 앞에 붙여야 한다

		// 사용자가 값을 30개 입력하기 전이라도 0을 입력하면 반복문 종료
		if (numbers[i] == 0) break;

		// 합계 계산
		sum += numbers[i];

		// 사용자가 입력한 값들의 개수 증가
		count_input++;
	}


	// 평균 계산
	// → 위 반복문이 종료되는 시점, 즉 사용자가 입력하는 값을 모두 읽어온 다음에는
	//	인덱스 변수 i의 값은 사용자가 입력한 값의 개수가 된다.
	average = (double)sum / i;
	// → average = (double)sum / count_input;

	// 반복문을 이용해 평균보다 더 큰 값들의 개수 계산
	// 0인 수를 셀 필요가 없으므로 조건문으로 달아야 한다.
	for (i = 0; i < 30 && numbers[i] != 0; i++)
		if (numbers[i] >= average) count_gt++;

	ratio_gt = (int)((double)count_gt / count_input * 100);


	// 출력
	printf("\n");
	printf("The average: %.2f\n", average);
	printf("Percentage of numbers above average: %.d%%\n", ratio_gt);
	// 문자열 %를 출력할때 %를 두번 입력해야 한다

	return 0;
}
*/

//-----------------------------------------------------------------------------------
/*
int main() {

	// 연습문제(2) : 사용자에게 문자열을 입력 받아, 그 문자열을 뒤집어 출력하는 프로그램
	//	을 작성하라, 이때 문자열의 최대 길이는 80자로 한다.

	// 사용자가 입력한 문자열을 저장할 배열 선언
	// 상요자가 입력하는 문자열의 길이가 최대 80자라고 가정
	char str[81] = { 0 };

	// 사용자가 입력한 문자열을 거꾸로 뒤집어서 저장할 배열 선언

	char rev[81] = { 0 };

	// 문자열의 길이를 저장할 변수
	int length = 0;

	// 인덱스 변수
	int i;

	// 사용자 입력
	printf("Enter a string: ");
	scanf("%[^\n]s", str);

	// 문자열의 길이 계산
	for (length = 0; str[length] != 0; length++);

	// 출력
	printf("\n");
	printf("str = \"%s\"\n", str);
	printf("rev = \"");

	// 배열 str에 저장된 문자열에서 마지막 문자에서부터 첫 번째 문자까지 역순으로 출력
	for (i = length - 1; i >= 0; i--)
	// 1. 출력만
		printf("%c", str[i]);

	printf("\"\n");
	// 마지막 " 문자열을 나타낸다

	// 배열 str에 저장된 문자열을 거꾸로 뒤집어서 다른 배열에 저장
	for (i = 0; i < length; i++)
		rev[i] = str[length - 1 - i];

	// 2. 새로운 배열에 저장하여 출력
	// %s 서식 지정자 : 문자열(string)을 출력, 널 문자(null character, '\0')
	//	를 만날 때까지 문자들을 차례대로 출력
	printf("rev = \"%s\"\n", rev);


	return 0;
}
*/

//------------------------------------------------------------------------------------
/*
int main() {
	
	// 연습문제(3) : 사용자에게 문자열을 입력 받아, 그 문자열에서 대문자는 소문자로,
	//	소문자는 대문자로 출력하는 프로그램을 작성하라

	// 사용자가 입력한 문자열을 저장할 배열
	char str[81];

	// 인덱스 변수
	int i;

	// 대문자와 소문자의 ASCII 코드의 차이
	int delta = 'a' - 'A';
	// → 32
	// → 소문자와 대문자의 ASCII 코드의 차이는 32로 일정하다
	// → ('a' - 'A') = ('b' - 'B') = ... = ('z' - 'Z') = 32
	// → 'a' = 'A' + 32
	// → 'A' = 'a' - 32

	printf("Enter a string: ");
	scanf("%[^\n]s", str);

	// 출력
	printf("\n");
	printf("str = \"%s\"\n", str);
	printf("cnv = \"");

	// 반복문을 이용해서 배열 str에 저장된 문자열에 포함된 문자들을 확인
	for (i = 0; str[i] != 0; i++)
	{
		// 배열 str의 i번째 원소가 대문자인 경우
		if (str[i] >= 'A' && str[i] <= 'Z')
			// 소문자로 출력
			printf("%c", str[i] + delta);
		else if (str[i] >= 'a' && str[i] <= 'z')
			// 대문자로 출력
			printf("%c", str[i] - delta);
		// 배열의 str의 i번째 원소가 대문자도 아니고 소문자도 아닌 경우
		else
			// 그대로 출력
			printf("%c", str[i]);
	}

	printf("\"\n");
	// 마지막 " 문자열



	return 0;
}
*/
