public class Ex_if_if {
	public static void main(String[] args) {
		/*
		 ★ 중첩 if문 : if문 안에 다른 if문이 있는 문장(유효성 검사)
		 
		 if (조건식 A) {
		 	if (조건식 1) {
		 		조건식 A를 만족한 상태에서 조건식 1이 참일 때 실행되는 문장;
		 	} else if (조건식 2) {
		 		조건식 A를 만족한 상태에서 조건식 2가 참일 때 실행되는 문장;
		 	}
		 } else if (조건식 B) {
		 	조건식 B가 참일 때 실행되는 문장;
		 }
		 
		 */
		
		int score = 87;
		
		if (score >= 0 && score <= 100) {
			if (score >= 90) {
				System.out.println("A학점");
			} else if (score >= 80) {
				System.out.println("B학점");
			} else if (score >= 70) {
				System.out.println("C학점");
			} else if (score >= 60) {
				System.out.println("D학점");
			} else {
				System.out.println("F학점");
			} //if
		} else {
			System.out.println("점수를 잘못 입력하셨습니다.");
		}
	} //main()
} //class
