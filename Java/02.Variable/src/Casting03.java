public class Casting03 {
	public static void main(String[] args) {
		// String 클래스를 이용하여 문자 10(su1)과 문자 20(su2)을 더하기 연산
		String su1 = "10";		// 문자 10
		String su2 = "20";		// 문자 20
		System.out.println(su1 + su2);			// 출력값 : 1020  ▶ Concatenation(연결, 결합)
		
		int num1 = Integer.parseInt(su1);		// 변수 num1에 정수 10이 저장
		int num2 = Integer.parseInt(su2);		// 변수 num2에 정수 20이 저장
		System.out.println(num1 + num2);		// 출력값 : 30  ▶ String → int : Wrapper Class
		System.out.println(Integer.parseInt(su1) + Integer.parseInt(su2));
		
		String su3 = "12.3";
		String su4 = "45.6";
		System.out.println(su3 + su4);			// 출력값 : 12.345.6
		
		double num3 = Double.parseDouble(su3);	
		double num4 = Double.parseDouble(su4);
		System.out.println(num3 + num4);		// 출력값 : 57.900000000000006
		System.out.println(Double.parseDouble(su3) + Double.parseDouble(su4));
		
		
	} // main()
} // class
