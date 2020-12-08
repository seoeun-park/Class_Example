public class Ex_if {
	public static void main(String[] args) {
		/*
		   ★ 단순 if문 : 조건을 판단하여 참일 경우에만 실행
		 
		 if(조건식) {
		 	실행문;
		 }
		 
		   ※ 실행문이 하나이면 {}(블럭킹)을 생략해도 된다(권장 x).
		   →  if(조건식) 실행문
		 */
		
		int a = 10;
		
		if(a % 2 == 0) {		// a를 2로 나눈 나머지 값이 0과 같다 : 짝수
			System.out.println("입력값은 " + a + "입니다.");
			System.out.println(a + "는 짝수입니다.");
		} //if
		
		int b = 9;
		if(b % 2 != 0) {		// b를 2로 나눈 나머지 값이 0과 같지 않다 : 홀수
			System.out.println("입력값은 " + b + "입니다.\n" + b + "는 홀수입니다.");
		} //if
		
		// if 단일문을 삼항 연산자로  표현할 경우
		int c = 7;
		System.out.println(c % 2 == 0 ? "짝수" : "");
		
	} //main()
} //class
