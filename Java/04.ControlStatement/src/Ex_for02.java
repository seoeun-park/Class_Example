public class Ex_for02 {
	public static void main(String[] args) {
		// 1부터 10까지의 누적합(sum)을 구하시오.
		
		int sum = 0;		// 누적합(결과)이 저장될 변수
							// for구문 바깥에서도 활용할 변수이기 때문에 전역 변수로 선언
		
		for (int i = 0; i <= 10; i++) {		// 1부터 10까지 1씩 증가
			sum += i;		// sum = sum + i;
			System.out.println("i = " + i + ", sum = " + sum);
		} //for
		
		System.out.println("총 누적합 = " + sum);
		
	} //main()
} //class
