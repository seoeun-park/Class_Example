public class CalculatorMain {
	public static void main(String[] args) {
		Calculator cal = new Calculator();		// ��ü ����
		
		System.out.println("���� : 5 + 3 = " + cal.add(5, 3));
		System.out.println("���� : 9 - 7 = " + cal.sub(9, 7));
		System.out.println("���� : 8 * 4 = " + cal.mul(8, 4));
		System.out.println("������ : 12 / 6 = " + cal.div(12, 6));
		
	}//main()
}//class

