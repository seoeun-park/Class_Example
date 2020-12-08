public class Operator04 {
	public static void main(String[] args) {
		// 비교(관계)연산자 ▶ 조건문에 많이 사용
		// 연산의 결과는 true, false 반환
		// >, >=, <, <= : 수학의 연산과 같은 비교(대소관계)연산자
		// a = b : 수학에서는 같다라는 의미지만 프로그램에서는 할당(대입) 연산자
		// a == b : 프로그램에서 같다라는 의미를 비교(동등관계)하는 연산자
		// a != b : 프로그램에서 같지 않다라는 의미를 비교(동등관계)하는 연산자
		int a = 10, b = 5;
		System.out.println(a > b);		// 출력값 : true
		System.out.println(a >= b);		// 출력값 : true
		System.out.println(a < b);		// 출력값 : false
		System.out.println(a <= b);		// 출력값 : false
		System.out.println(a == b);		// 출력값 : false
		System.out.println(a != b);		// 출력값 : true
		
		
		
	} //main()
} //class
