public class Question05Main {
	public static void main(String[] args) {
		int sum = 0;
		for(int i = 1; i <= 20; i ++) {
			if(i % 2 == 0 || i % 3 == 0) {
				continue;
			} else {
				sum += i;				
			}//if
		}//for
		
		System.out.println("sum : " + sum);
		
	}//main()
}//class