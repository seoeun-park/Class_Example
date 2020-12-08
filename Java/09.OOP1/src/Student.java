import java.text.DecimalFormat;

public class Student {
	// 멤버 변수
	String name;
	int kor, eng, mat, sum;
	float avg;
	
	// 멤버 메소드
	// 총점을 계산하는 멤버 메소드(getSum()) 정의
	public int getSum(int kor, int eng, int mat) {
		sum = kor + eng + mat;
		return sum;
	}
	
	// 평균을 계산하는 멤버 메소드(getAvg()) 정의
	public String getAvg(int kor, int eng, int mat) {
		avg = (float)sum / 3;
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(avg);
	}
	
	// 출력하는 메소드(display()) 정의
	public void display() {
		System.out.println("이름 : " + name);
		System.out.println("국어 점수 : " + kor);
		System.out.println("영어 점수 : " + eng);
		System.out.println("수학 점수 : " + mat);
		
		// display 메소드 안에서 멤버 메소드를 호출하여 총점과 평균을 계산
		System.out.println("총점 : " + getSum(kor, eng, mat));
		System.out.println("총점 : " + getAvg(kor, eng, mat));	
	}
}//class
