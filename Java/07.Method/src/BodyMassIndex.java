import java.text.DecimalFormat;
import java.util.Scanner;

public class BodyMassIndex {
	public static void main(String[] args) {
		// 신장(height)과 체중(weight)을 입력(예: 175.5, 65.5)
		Scanner scanner = new Scanner(System.in);
		System.out.print("신장을 입력하세요(입력 예 : 175.5)   ▶  ");
		float height = Float.parseFloat(scanner.nextLine());
		System.out.print("체중을 입력하세요(입력 예 : 65.5)  ▶ ");
		float weight = Float.parseFloat(scanner.nextLine());
		scanner.close();
		
		// 결과를 출력
		System.out.println("입력하신 신장은 " + height + "cm 입니다.");
		System.out.println("입력하신 체중은 " + weight + "kg 입니다.");
		BodyMassIndex bmi = new BodyMassIndex();	// 객체 생성
		System.out.println("비만지수(카우프지수)는 " + bmi.bmiCalc(height, weight) + "입니다.");
		System.out.println("비만도 결과는 " + bmi.getResult(bmi.bmiCalc(height, weight)) + "입니다.");
		
	}//main()
	
	// 비만지수(카우포지수)를 계산하는 메소드(bmiCalc()) : 소수 둘째자리까지 표시
	public String bmiCalc(float height, float weight) {
		float hh = (height / 100) * (height / 100);		// 신장의 제곱
		float result = weight / hh;						// bmi 지수 계산
		DecimalFormat df = new DecimalFormat("0.00");
		
		return df.format(result);
	}//bmiCalc()
	
	// 비만지수를 기준으로 비만도 결과를 구하는 메소드(getResult())
	public String getResult(String bmi) {
		float index = Float.parseFloat(bmi);	//Wrapper Class : String → float
		String result = null;					// 최종 결과가 저장될 문자열 변수를 초기화
		
		if (index >= 40) {
			result = "고도비만";
		} else if (index >= 35) {
			result = "중등도 비만";
		} else if (index >= 30) {
			result = "경도도 비만";
		} else if (index >= 25) {
			result = "과체중";
		} else if (index >= 20) {
			result = "정상";
		} else {
			result = "저체중";
		}
		
		return result;
		
	}//getResult()
	
}//class
