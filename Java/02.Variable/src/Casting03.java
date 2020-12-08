public class Casting03 {
	public static void main(String[] args) {
		// String Ŭ������ �̿��Ͽ� ���� 10(su1)�� ���� 20(su2)�� ���ϱ� ����
		String su1 = "10";		// ���� 10
		String su2 = "20";		// ���� 20
		System.out.println(su1 + su2);			// ��°� : 1020  �� Concatenation(����, ����)
		
		int num1 = Integer.parseInt(su1);		// ���� num1�� ���� 10�� ����
		int num2 = Integer.parseInt(su2);		// ���� num2�� ���� 20�� ����
		System.out.println(num1 + num2);		// ��°� : 30  �� String �� int : Wrapper Class
		System.out.println(Integer.parseInt(su1) + Integer.parseInt(su2));
		
		String su3 = "12.3";
		String su4 = "45.6";
		System.out.println(su3 + su4);			// ��°� : 12.345.6
		
		double num3 = Double.parseDouble(su3);	
		double num4 = Double.parseDouble(su4);
		System.out.println(num3 + num4);		// ��°� : 57.900000000000006
		System.out.println(Double.parseDouble(su3) + Double.parseDouble(su4));
		
		
	} // main()
} // class
