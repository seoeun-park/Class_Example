public class Operator01 {
	public static void main(String[] args) {
		// ��� ������ : +, -, *, / �� ��Ģ����
		// ������ ������ : % �� ¦��/Ȧ��, ����� �Ǵܿ� ���
		
		int a = 10, b = 3;
		
		int addResult = a + b;		// ����
		int subResult = a - b;		// ����
		int mulResult = a * b;		// ����	
		int divResult = a / b;		// ������	
		int modResult = a % b;		// ������
		
		System.out.println("addResult = " + addResult);		// ��°� : 13
		System.out.println("subResult = " + subResult);		// ��°� : 7
		System.out.println("mulResult = " + mulResult);		// ��°� : 30
		System.out.println("divResult = " + divResult);		// ��°� : 3
		System.out.println("modResult = " + modResult);		// ��°� : 1
		
		int x = 3, y = 5;
		System.out.println("x + y = " + x + y);				// ��°� : x + y = 35
		System.out.println("x + y = " + (x + y));			// ��°� : x + y = 8
		System.out.println(x + y + " = x + y");				// ��°� : 8 = x + y
		//System.out.println("x - y = " + x - y);			// ������ ����
		System.out.println("x - y = " + (x - y));			// ��°� : x - y = -2 
		System.out.println(x - y + " = x - y");				// ��°� : -2 = x - y
		
	} //main()
} //class
