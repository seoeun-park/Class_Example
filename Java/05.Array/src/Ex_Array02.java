public class Ex_Array02 {
	public static void main(String[] args) {
		// 정수 3개를 저장할 배열(arr)을 선언하고
		// 동시에 모든 요소에 10을 할당하시오. ▶ 배열의 초기화
		// int[] arr;	arr = {10, 20, 30};		→ 오류
		// 초기화할 때는 new라는 키워드가 빠지면서 나열된 요소의 개수가 배열의 크기가 된다.
		int[] arr = {10, 10, 10};		// 배열을 선언하고 바로 값을 할당 : 초기화
		
		System.out.println("배열(arr)의 크기 : " + arr.length);
		
		// 배열(arr)의 모든 요소의 합(sum)을 구하여 출력하시오.
		//int sum = arr[0] + arr[1] + arr[2];
		int sum = 0;
		
		for(int i = 0; i < arr.length; i++) {
			sum += arr[i];		// sum = sum + arr[i];
		}
		
		System.out.println("배열(arr)의 총합 : " + sum);
		
	}//main()
}//class
/*
 1) 배열(Array) : 객체로 취급 ▶ 참조형(Reference) 자료구조
 - 동일한 기억공간을 메모리에 연속적으로 생성하는 구조 : 리스트(선형) 구조
 - 같은 타입을 갖는 변수들의 집합
 - 배열은 사용자 정의 자료형이자 참조형 변수이고 사용자 정의 자료형 중에 배열 타입
 
 	① 배열의 선언 : int[] arr;
 	② 배열의 생성 : arr = new int[10]; 
 	③ 배열의 선언과 생성 : int[] arr = new int[10];

 - 배열을 선언하고 생성한 후, 나중에 내용물(원소값)을 채우는 방식 : Ex_Array01
 - 배열을 선언하는 동시에 배열의 내용물(원소값)을 채우는 방식 : Ex_Array02
 
 - 배열의 접근은 반드시 요소번호(인덱스)로 접근하며, index는 0부터 시작
 - 배열의 크기는 배열 생성 시에 결정되며, 나중에 바꿀 수 없다.
 - 배열의 크기(길이) : 배열명.length
 - 배열의 마지막 원소의 index 번호 : 배열명.length - 1
*/

/*
	1. 예외(Exception)
	 - 실행 중 발생하는 에러는 컴파일러가 알 수 없다.
	 - 실행 중 에러 발생 시 예외를 발생시켜 예외 처리함
	 - 예외를 처리하지 않으면 예외가 발생한 프로그램은 강제 종료
	 
	 ① 실행 예외(미확인 예외) - 프로그램을 실행시켜야만 오류를 확인할 수 있는 경우
	 ② 일반 예외(확인 예외) - 코딩 중 즉각적으로 오류를 확인할 수 있는 경우
	 
	 1) 예외 처리문
	 - try-catch-finally문 사용
	 - finally는 생략 가능

			try {
				예외가 발생할 가능성이 있는 실행문(try 블록)
			} 
			catch (처리할 예외 타입 선언) {
				예외 처리문(catch 블록)
			}
			finally { 				// finally는 생략 가능
				예외 발생 여부와 상관없이 무조건 실행되는 문장(finally 블록)
			}

	 2) 자주 발생하는 예외
	 
		 ArithmeticException	: 정수를 0으로 나눌 때 발생
		 NullPointerException	: Null 레퍼런스 참조할 때 발생
		 ClassCastException		: 변환할 수 없는 타입으로 객체를 변환할 때 발생
		 OutOfMemoryException	: 메모리가 부족한 경우(자바에서는 거의 일어나지 않는 예외)
		 ArrayIndexOutOfBoundsException	: 배열의 범위를 벗어난 접근 시 발생
		 IllegalArgumentException		: 잘못된 인자 전달 시 발생
		 IOException			: 입출력 동작 실패 또는 인터럽트 시 발생
		 NumberFormatException	: 문자열이 나타내는 숫자와 일치하지 않는 타입의 숫자로 변환 시 발생

 */
