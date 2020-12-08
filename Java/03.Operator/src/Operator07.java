public class Operator07 {
	public static void main(String[] args) {
		int a = 10;
		String result1 = a == 10 ? "맞다" : "틀리다";
		String result2 = a != 10 ? "맞다" : "틀리다";
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(a == 10 ? "맞다" : "틀리다");
		
		System.out.println("=======");
		
		int b = 10;
		if(b == 10) {
			System.out.println("맞다");
		}
		else {
			System.out.println("틀리다");
		}
		
		
	} //main()
} //class

/*
 * 삼항 연산자
 * - 3개의 항으로 구성된다
 * - 간단한 조건식을 작성할 경우
 * - 조건식 ? 조건식이 참일 때 나오는 값 : 조건식이 거짓일 때 나오는 값;
 * - if-else 구문에서 조건식과 if 구문 안에 들어가는 값이 간단할 경우 삼항 연산자를 활용한다
 */
