public class Ex_Method03 {
	public static void main(String[] args) {
		getSum(10, 20);			//getSum(int, int) �޼ҵ� ȣ��
		System.out.println("=================");
		getSum(10, 20, 30);		//getSum(int, int, int) �޼ҵ� ȣ��
		System.out.println("=================");
		getSum(10.5, 20.3);		//getSum(double, double) �޼ҵ� ȣ��
		System.out.println("=================");
		getSum(10, 10.5);		//getSum(int, double) �޼ҵ� ȣ��
		// �� ù��° �μ��� double �ڷ������� UpCasting �ȴ�.
		
	}//main()
	
	public static void getSum(int x, int y) {
		System.out.println("ù ��° �μ� : " + x);
		System.out.println("�� ��° �μ� : " + y);
		System.out.println("�� �μ��� �� : " + (x + y));
		System.out.println("int, int");
	}//getSum()
	
	public static void getSum(int x, int y, int z) {
		System.out.println("ù ��° �μ� : " + x);
		System.out.println("�� ��° �μ� : " + y);
		System.out.println("�� ��° �μ� : " + z);
		System.out.println("�� �μ��� �� : " + (x + y + z));	
		System.out.println("int, int, int");
	}//getSum()
	
	public static void getSum(double x, double y) {
		System.out.println("ù ��° �μ� : " + x);
		System.out.println("�� ��° �μ� : " + y);
		System.out.println("�� �μ��� �� : " + (x + y));
		System.out.println("double, double");
	}//getSum()
}//class
