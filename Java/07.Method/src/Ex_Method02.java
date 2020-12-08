public class Ex_Method02 {
	// getSum() 메소드에 10과 20을 매개변수로 보내는 호출문 작성
	// 단, 결과를 return 받아 출력하시오  ▶  getSum() 결과값  → main() 전달 
	public static void main(String[] args) {
		int a = 10, b = 20;		//getSum() 메서드로 보낼 매개변수를 초기화
		int sum = getSum(a, b);			//getSum() 메서드 호출문	 ▶  실인수
		System.out.println("첫 번째 인수 : " + a);
		System.out.println("두 번째 인수 : " + b);
		System.out.println("두 인수의 합 : " + sum);
	}//main()
	
	// 2개의 정수를 매개변수로 받아 합을(sum)을 구하여 리턴하는 메소드(getSum())를 정의
	public static int getSum(int a, int b) {		//getSum() 메소드를 정의  ▶  가인수
		int sum = a + b;
		return sum;
	}//getSum()
}//class
