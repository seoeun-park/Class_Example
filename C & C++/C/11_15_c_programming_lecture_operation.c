#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
/*
int main() {

	int num = 10;

	// 전위 연산
	// → 증감.감소 연산자가 피연산자 앞에 오는 경우
	// → 문장 내에서 증가.감소 연산자가 전위 연산으로 사용되는 경우
	//	  먼저 전위 연산을 수행하고 그 다음에 문장 내의 다른 기능들을 수행한다
	
	printf("num = %d\n", ++num);		// 2. num = 11
	// → ++num;
	// → printf("num = %d\n", num);

	//--------------------------------------------------------------------------
	// 후위 연산
	// → 증가.감소 연산자가 피연산자 뒤에 오는 경우
	// → 문장 내에서 증가.감소 연산자가 후위 연산으로 사용되는 경우
	//	  먼저 문장 내의 다른 기능들을 수행하고, 그 다음에 후위 연산을 수행한다

	printf("num = %d\n", num++);		// 3. num = 11
	// → printf("num = %d\n", num);
	// → num++;

	//--------------------------------------------------------------------------
	// 증가.감소 연산자가 다른 기능들과 함께 사용되는 경우에는 문장을 나눠서 생각하는게
	// 정신건강에 이롭다

	// 출력
	printf("num = %d\n", num);			// 4. num = 12

	return 0;
}
*/

/*
int main() {

	int x = 9;
	int y = 13;

	int sum1 = ++x + y--;
	// → ++x (x = x + 1);		// x = 10;
	// → int sum1 = x + y;		// sum1 = 23;
	// → y--					// y = 12;

	int sum2 = x-- + ++y;
	// → ++y;					// y = 13;
	// → int sum2 = x + y;		// sum2 = 23;
	// → x--;					// x = 9;

	printf("x = %d\n", x);
	printf("y = %d\n", y);
	printf("sum1 = %d\n", sum1);
	printf("sum2 = %d\n", sum2);

	return 0;
}
*/

// 연습문제: 밑변이 13이고 높이가 9인 삼각형의 넓이를 구하는 프로그램 작성
/*
int main() {

	int width = 13;
	int height = 9;

	// 산술 연산에서 주의할 점
	// 1. 연산 결과의 자료형은 피연산자의 자료형에 따라 결정된다.
	// 2. 피연산자의 자료형이 다르면 피연산자의 자료형을 맞춘 후에 연산한다.
	
	// 삼각형의 면적 계산
	// int area = (width * height) / 2;
	
	// 형 변환 연산자(cast operator): 피연산자의 자료형을 임시로 지정한 자료형으로 변환

	double area = (double)(width * height) / 2;
	// 혹은
	// double area = (width * height) / 2.0;
	// → int + 나누기 연산자 + double 조합에서는 자료형이 더 큰 값을 따르므로
	//	  int 자료형인 (width * height)가 double 자료형으로 확장된다.

	// 출력
	printf("area of triangle = %.1f\n", area);

	return 0;

*/

/*
int main() {

	// 사용자가 입력한 값을 저장할 변수
	int num;

	// 프람프트 메시지(prompt message) 출력
	printf("Enter an integer: ");

	// scanf 함수
	// → 표준 입력을 통해 입력된 값을 읽어오는 함수
	// → 읽어오고자 하는 값의 형태를 형식 문자열 안에 서식 지정자를 통해 설정
	//	  scanf 함수에 넣는 형식 문자열에는 서식지정자와 빈칸만 쓸 수 있다.
	// → 읽어온 값을 지정할 변수를 형식 문자열 다음에 지정
	//	  단, 이때 변수 앞에 반드시 참조 연산자(&)를 사용한다.
	scanf("%d", &num);
	// → 사용자가 표준 입력을 통해 입력한 값을 10진수 형태의 정수 값으로 읽어와서
	//	  변수 num에 대입하라!
	// → scanf 함수가 실행되면 사용자가 엔터 키를 입력할 때까지 사용자가 값을 입력하기를 기다린다.
	//	  scanf 함수는 사용자가 엔터 키를 입력하면 사용자가 입력한 값을 읽어온다.

	// 출력
	printf("num = %d\n", num);

	// scanf 함수를 통해 입력 받을 값의 자료형과 서식 지정자
	// char = %c
	// int = %d
	// float = %f
	// double = %.1f

	return 0;
}
*/



