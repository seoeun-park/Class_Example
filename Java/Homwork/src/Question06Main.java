public class Question06Main {
	public static void main(String[] args) {
		String str = "12345";
		int sum = 0;
		int length = 5;
		
		// ���� '1'���� '5'������ ASCII �ڵ� : 49 ~ 53
		// ���� '0'�� ASCII �ڵ� : 48
		
		for(int i = 0; i < length; i++) {
			sum += (str.charAt(i) - '0');
		}//for
		
		System.out.println("sum = " + sum);
		
	}//main()
}//class
