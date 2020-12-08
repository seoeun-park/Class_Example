public class Variable01 {
	public static void main(String[] args) {
		// 정수 2개를 저장할 변수를 선언하시오(변수명은 a, b)
		int a;			// 정수형 변수 a를 선언
		int b;			// 정수형 변수 b를 선언
		// 경고줄이 그어진 이유는? 변수를 선언했는데 아직 저장공간을 활용하지 않았기 때문에
		// int a, b;		// 같은 자료형의 변수를 나열(comma(,)로 구분)
		
		// 변수 a에 10, 변수 b에 20을 할당(대입) 하시오.
		a = 10;			// 변수 a에 값(10)을 할당 대입
		b = 20;			// 변수 b에 값(20)을 할당 대입
		
		// 정수형 변수 c와 d를 선언하고, c에 30, d에 40을 할당하시오(초기화).
		int c = 30;		// 선언과 동시에 값을 할당 ▶ 초기화
		int d = 40;		// 선언과 동시에 값을 할당 ▶ 초기화
		
		// int c = 30, d = 40		// 같은 자료형의 변수를 초기화하고 나열
		
		// 각각의 변수에 저장된 데이터를 출력하시오
		System.out.println("변수 a의 값 : " + a);
		System.out.println("변수 b의 값 : " + b);
		System.out.println("변수 c의 값 : " + c);
		System.out.println("변수 d의 값 : " + d);
		
	} //main()
} //class
