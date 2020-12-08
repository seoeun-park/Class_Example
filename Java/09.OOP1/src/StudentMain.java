public class StudentMain {
	public static void main(String[] args) {
		//Student Class 객체를 생성하고 값(이름, 국어, 영어, 수학)을 할당  ▶ 멤버 변수
		// 총점계산(getSum()), 평균계산(getAvg()), 결과를 출력(display()) ▶ 멤버 메소드
		Student s1 = new Student();
		s1.name = "홍길동";
		s1.kor = 95;
		s1.eng = 65;
		s1.mat = 100;
		s1.display();
		
		Student s2 = new Student();
		s2.name = "박문수";
		s2.kor = 65;
		s2.eng = 95;
		s2.mat = 91;
		s2.display();
	}//main()
}//class
