import java.util.Scanner;

public class Ex_scanner {
	public static void main(String[] args) {
		// 키보드로부터 점수(score)를 입력받은 후, ▶ 입력(scanner)
		// 학점을 출력하는 프로그램  ▶  학점(if)
		// 입력 받기 위해서는 Scanner 객체 생성 : new Scanner(System.in);
		// 이때 Scanner()는 생성자 메서드이다.
		// ex) String str1 = new String("Hello World!");
		// 		-> String str1 = "Hello World!";
		
		Scanner scanner = new Scanner(System.in);	// 객체 생성은 한번만!
		
		while(true) {
			// 이러한 while 구문은 무한루프이므로 반드시 break를 걸어야 한다.
			System.out.print("점수를 입력하세요 : ");		// 블럭킹 상태 : 입력을 대기하고 있는 상태
			int score = scanner.nextInt();
			System.out.println("입력하신 점수는 " + score + "점 입니다.");
			
			
			if (score >= 0 && score <= 100) {
				if(score >= 90) {
					System.out.println("당신의 학점은 A학점 입니다.");
				} else if(score >= 80) {
					System.out.println("당신의 학점은 B학점 입니다.");
				} else if (score >= 70) {
					System.out.println("당신의 학점은 C학점 입니다.");
				} else if (score >= 60) {
					System.out.println("당신의 학점은 D학점 입니다.");
				} else {
					System.out.println("당신의 학점은 F학점 입니다.");
				} //else-if
				break;
			} else {
				System.out.println("점수를 잘못 입력하셨습니다.");
				continue; 			// 다시 구문 첫머리로
			} //if
		}//while
		// close를 while 구문이 끝난 다음에 작성하는 이유?
		// → close를 while 구문 안에 작성하게 된다면 점수를 잘못 입력했을 때 continue 명령어로 
		//	 구문 첫머리로 갈때 생성자가 없어져서 컴파일 오류가 발생한다.
		scanner.close();
	} //main()
} //class
