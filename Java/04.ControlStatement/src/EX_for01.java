public class EX_for01 {
	public static void main(String[] args) {
		// 0부터 10까지 출력하시오.
		// System.out.println(0);
		// System.out.println(1);
		// System.out.println(2);
		//...
		// System.out.println(10);
		
		/*
		 ★ 반복문(순환문, Loop문) : for, while, do-while
		 
		 for(초깃값(시작값); 조건식(최종값); 반복후 작업(증감값)) {
		 	실행문(반복할 문장);
		 }
		 
		 */
		
		// "반복문을 이용하여" 0부터 10까지 출력하시오.(0부터 10까지 1씩 증가(반복))
		for (int i = 0; i <= 10; i++) {
			System.out.println(i);			// i값을 출력
		} //for
		
		System.out.println("---------------------------------");
		
		// "반복문을 이용하여" 10부터 0까지 출력하시오(10부터 0까지 1씩 감소(반복)).
		for (int i = 10; i >= 0; i--) {
			System.out.println(i);			// i값을 출력
		} //for
		
		// ※ 여기서 i라는 변수는 for의 조건문 안에 선언되어 있으므로 for 블록 내에서만 유효하는 지역변수이다.
		;
		System.out.println("---------------------------------");
		
		// 0부터 10까지의 정수 중에서 짝수만 출력하시오 : for(반복)
		for (int i = 0; i <= 10; i+=2) {	// i = i + 2;
			System.out.println(i);
		} //for
		
		System.out.println("---------------------------------");
		
		// 0부터 10까지의 정수 중에서 짝수만 출력하시오 : for(반복), if(조건판단)
		for (int i = 0; i <= 10; i++) {
			if (i % 2 == 0) {
				System.out.println(i);		// i값을 출력
			} //if
		} //for
		
		System.out.println("---------------------------------");
		
		for (int i = 0; i <= 10 && i % 2 == 0; i++) {
			System.out.println(i);
		}
	
	} //main()
} //class
