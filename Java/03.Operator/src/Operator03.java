public class Operator03 {
	public static void main(String[] args) {
		// 비트연산자 : 개발자의 입장에서 비트를 직접 조작이 가능하다 ▶ 하드웨어 제어할 때
		// 하지만 JAVA에서는 거의 사용하지 않는다.
		// ① & (AND) : 모두 1일 때 → 1로 출력
		// ② | (OR) : 하나라도 1일 때 → 1로 출력
		// ③ ^ (XOR) : 서로 다를 때(같으면 0으로 출력) → 1로 출력
		int x = 3;		// 2진법 : 11
		int y = 2;		// 2진법 : 10
		
		System.out.println(x & y);		// 출력값 : 2(10)
		System.out.println(x | y);		// 출력값 : 3(11)
		System.out.println(x ^ y);		// 출력값 : 1(01)
		
	} //main()
} //class
