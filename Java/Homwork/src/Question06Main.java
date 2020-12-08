public class Question06Main {
	public static void main(String[] args) {
		String str = "12345";
		int sum = 0;
		int length = 5;
		
		// 문자 '1'부터 '5'까지의 ASCII 코드 : 49 ~ 53
		// 문자 '0'의 ASCII 코드 : 48
		
		for(int i = 0; i < length; i++) {
			sum += (str.charAt(i) - '0');
		}//for
		
		System.out.println("sum = " + sum);
		
	}//main()
}//class
