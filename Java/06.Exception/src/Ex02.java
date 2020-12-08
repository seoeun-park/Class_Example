public class Ex02 {
	public static void main(String[] args) {
		// 가스불을 켠다  → 요리 시작  → 요리 끝  → 가스불을 잠근다  → 종료
		try {
			System.out.println("가스불을 켠다");
			System.out.println("요리 시작");
			//int a = 10 / 0; 				// 예외 발생 : ArithmeticException
			System.out.println("요리 끝");
			//System.out.println("가스불을 잠근다");
			//System.out.println("종료");
		} catch (Exception e) {
			System.out.println("예외 발생");
			//System.out.println("가스불을 잠근다");
			//System.out.println("종료");
		} finally {
			// try 블록과 catch 블록 내에 중복된 코드는 finally 블록에 작성하는 것이 좋다.
			System.out.println("가스불을 잠근다");
			System.out.println("종료");
		}
	}//main()
}//class
