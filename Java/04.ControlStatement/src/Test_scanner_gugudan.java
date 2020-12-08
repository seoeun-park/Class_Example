import java.util.Scanner;

public class Test_scanner_gugudan {
	public static void main(String[] args) {
		// 사용자로부터 출력하고 싶은 구구단의 단수를 입력(danNumber) ▶ Scanner
		// 입력받은 단수의 구구단을 출력한다  ▶  반복문 (for)
		// 단, 입력받은 단수의 범위는 2단부터 9단까지이며  ▶ if, break 
		// 그 외의 단수가 입력되면 오류메시지를 출력하고 재입력을 받는다. ▶ while, continue
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.print("출력하고 싶은 단수를 입력하세요 : ");
			int danNumber = Integer.parseInt(scanner.nextLine());
			
			if(danNumber < 2 || danNumber > 9) {
				System.out.println("단수를 잘못 입력하셨습니다!");
				System.out.println("2 ~ 9 사이의 단수를 입력하세요!");
				System.out.println();
				continue;
			} else {
				System.out.println(danNumber + "단을 출력합니다.");
				
				for (int i = 1; i <= 9; i++) {
					System.out.println(danNumber + " x " + i + " = " + (danNumber * i));
				} //for
				break;
			} //if
		} //while
		
		scanner.close();
		
	}//main()
}//class
