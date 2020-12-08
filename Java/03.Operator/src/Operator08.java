public class Operator08 {
	public static void main(String[] args) {
		// 프로그램에서 사용되는 특수 기호문자(Escape Sequence) : 출력문에 많이 사용
		// cmd 창에서 실행해야 정확한 결과가 나온다!(d: 입력 → "cd 주소" 입력 → "java 파일명" 입력)
		// 역슬래시(\)를 먼저 입력하고 사용한다.
		// ☆ → 자주 쓰는 이스케이프 문자,		★ → 이클립스의 콘솔창과 cmd 창의 결과가 다른 이스케이프 문자
		System.out.println("1. Hello World");
		System.out.println("2. Hello" + "\t" + "World");	// \t : 탭 간격(8칸 띄워쓰기)  ☆
		System.out.println("3. Hello\tWorld");				// 문자열 출력문 안에 연결하여 사용가능
		System.out.println("4. Hello" + "\n" + "World");	// \n : 줄바꿈(개행 : new line) ☆
		System.out.println("5. Hello" + "\b" + "World");	// \b : 백스페이스(앞에 한 글자를 지움) ★
		System.out.println("6. Hello" + "\r" + "World");	// \r : Carriage Return(행의 처음으로 커서를 이동) ★
		// 6. Hello → 이때 r을 만나면서 행의 처음으로 이동되면서 개행
		// Worldllo → '6'대신 'W', '.'대신 'o'...'e'대신 'd'까지 갔다가 나머지 글자는 그대로 입력 
		
		System.out.println("7. Hello" + "\"" + "World");	// \" : 쌍따옴표를 표시 ☆
		System.out.println("8. Hello" + "\'" + "World");	// \' : 작은 따옴표를 표시 ☆
		System.out.println("9. Hello" + "\\" + "World");	// \\ : \(역슬래시, root) 표시 ☆
		// System.out.println("번호" + "이름" + "전화번호");
		System.out.println("번호" + "\t" + "이름" + "\t" + "전화번호");
		System.out.println("001" + "\t" + "홍길동" + "\t" + "010-1111-1111");
		System.out.println("002" + "\t" + "이이" + "\t" + "010-2222-2222");
		
	} //main()
} //class
