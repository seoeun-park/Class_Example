public class Question03Main {
	public static void main(String[] args) {
		// 객체를 생성하지 않고 static 메소드를 호출하는 방법
		// static 메소드가 담겨있는 클래스 명.메소드 이름(인수)
		System.out.println("[출력결과]");
		System.out.println("덧셈 : 5 + 3 = " + Question03.add(5, 3));
		System.out.println("뺄셈 : 9 - 7 = " + Question03.sub(9, 7));
		System.out.println("곱셈 : 8 * 4 = " + Question03.mul(8, 4));
		System.out.println("나눗셈 : 12 / 6 = " + Question03.div(12, 6));
	}//main()
}//class
