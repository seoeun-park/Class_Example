public class Variable05 {
	public static void main(String[] args) {
		// 문자 데이터 타입 : char(2byte) ▶ 하나의 글자만 저장 : UniCode(유니코드)
		
		// 문자 코드
		// - BCD(2진화 10진 코드) : 6bit → 64문자
		// - ASCII(미국 표준 코드) : 7bit → 128문자
		// - EBCDIC(확장형 BCD) : 8bit → 256문자
		// ★ UniCode : 2Byte(18bit) → 전 세계의 모든 문자
		
		// char 자료형을 가진 변수에 값을 할당할 때는 작은 따옴표를 사용한다.
		char a = 'A';
		char b = '가';
		char c = '★';
		
		System.out.println("변수 a의 값 : " + a);
		System.out.println("변수 b의 값 : " + b);
		System.out.println("변수 c의 값 : " + c);
		
		// String : 사용자 정의 자료형(참조형 자료형)의 클래스 타입(JAVA에서 기본적으로 제공해주는 자료형)
		// 문자, 문자열을 저장할 수 있는 클래스
		// 값을 할당할 때는 쌍따옴표를 사용한다.
		String str1 = "ABCD";
		String str2 = "가나다라";
		System.out.println("변수 str1의 값 : " + str1);
		System.out.println("변수 str2의 값 : " + str2);
		
	} //main()
} //class
