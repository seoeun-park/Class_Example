#include <stdio.h>

// 주석 표기
// 1. line comment
/* 2. block comment */

//main 함수: C 프로그램의 시작형(entry point)
// 모든 c 프로그램에는 반드시 main 함수가 존재해야 한다
// c 프로그램은 main 함수에서 시작해서 main 함수에서 끝난다


int main() {

	// 화면에 Hello World! 출력

	// printf 함수 : 지정한 값을 화면에 출력해주는 함수

	// printf 함수의 정보는 stdio.h 파일에 담겨있다
	// 따라서 프로그램에 printf 함수를 사용하기 위해서는 이 정보를 갖고 있는
	// 헤더 파일 stdio.h 파일을 우리가 작성하는 소스 파일로 불러와야 한다 
	// stdio.h는 STaDard Input/Output 표준 입출력과 관련된 기능들에 대한 정보를 담고 있는 파일이다

	// 헤더 파일(Header File) : c언어에서 제공해주는 기능들에 대한 정보를 담고 있는 파일
	// 파일 확장자명이 .h
	// 헤더 파일을 소스 파일에 불러오기 위해 #include 전처리기를 이용한다
	// #include <stido.h> 반드시 소스 파일의 가장 상단에 작성한다

	printf("Hello World!");
	// 문장(Statement)
	// → c 프로그램은 문장으로 구성된다
	// → c 프로그램에서 컴퓨터에게 지시하는 명령의 최소 단위
	// → c 프로그램에서 모든 문장은 반드시 세미콜론(;)으로 끝나야 한다(규칙)

	return 0;
}
