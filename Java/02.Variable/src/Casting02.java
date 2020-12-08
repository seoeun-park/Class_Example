public class Casting02 {
	public static void main(String[] args) {
		// 아래의 명령은 몇번의 형변환이 발생하는가? 2번
		double sum = 3.5F + 12;
		// ① 3.5F + 12.0F : int → float
		// ② double sum = 15.5F : float → double
		System.out.println("변수 sum의 값 : " + sum);		// 출력값 : 15.5 → double
		
		char upper = 'A';
		char lower = 'a';
		System.out.println("변수 upper의 값 : " + upper);					// 출력값 : A(65)
		System.out.println("변수 lower의 값 : " + lower);					// 출력값 : a(97)
		System.out.println("upper + lower : " + upper + lower);			// 출력값 : Aa
		System.out.println("(upper + lower) : " + (upper + lower));		// 출력값 : 162
		// 연산자 우선순위로 인해 ()가 먼저 연산된 다음 + 연산자로 연산하기 때문에 자동으로 UpCasting
		
		// 대문자(upper)를 소문자로 바꾸어서 출력하시오.
		System.out.println("(char)(upper + 32) = " + (char)(upper + 32)); // 출력값 : a
		
		
	} // main()
} // class
