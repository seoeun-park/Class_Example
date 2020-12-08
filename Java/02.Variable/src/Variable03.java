public class Variable03 {
	public static void main(String[] args) {
		// 정수형 데이터 타입 : byte(1), short(2), int(4), long(8)
		byte b = 100;		// 1byte : -128 ~ 127까지
		System.out.println("변수 b의 값 : " + b);
		
		short s = 10000;	// 2byte : -32,768 ~ 32,767
		System.out.println("변수 s의 값 : " + s);
		
		int i = 1000000;	// 4byte : -2,147,483,648 ~ 2,147,483,647
		System.out.println("변수 i의 값 : " + i);
		
		long l = 1234567890123456789L;	// 8byte : -9,223,372,036,854,780,000 ~ 9,223,372,036,854,779,999
		System.out.println("변수 l의 값 : " + l);
		
	} //main()
} //class
