public class Variable03 {
	public static void main(String[] args) {
		// ������ ������ Ÿ�� : byte(1), short(2), int(4), long(8)
		byte b = 100;		// 1byte : -128 ~ 127����
		System.out.println("���� b�� �� : " + b);
		
		short s = 10000;	// 2byte : -32,768 ~ 32,767
		System.out.println("���� s�� �� : " + s);
		
		int i = 1000000;	// 4byte : -2,147,483,648 ~ 2,147,483,647
		System.out.println("���� i�� �� : " + i);
		
		long l = 1234567890123456789L;	// 8byte : -9,223,372,036,854,780,000 ~ 9,223,372,036,854,779,999
		System.out.println("���� l�� �� : " + l);
		
	} //main()
} //class
