import java.util.Scanner;

public class SumMachine {
	// 시작 값(startNum)과 종료 값(endNum)을 입력받은 후 makeSum() 메소드 호출
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);

		while(true) {
			System.out.print("시작 값을 입력하세요 : ");
			int startNum = Integer.parseInt(scanner.nextLine());
			
			System.out.print("종료 값을 입력하세요 : ");
			int endNum = Integer.parseInt(scanner.nextLine());
			
			if (startNum > endNum) {
				System.out.println("시작 값은 작은 수, 종료 값은 큰 수로 입력하세요!");
				continue;
			}
			//makeSum(startNum, endNum);		//오류 : makeSum() 메소드에 static이 없다.
			SumMachine sm = new SumMachine();	// makeSum 메소드가 들어있는 클래스의 객체를 생성
			sm.makeSum(startNum, endNum);		// 생성된 객체 안에 있는 메소드를 호출
			break;
		}//while
		
		scanner.close();	
			
	}//main()
	
	// 시작 값과 종료 값까지 누적합(sum)을 구하고 출력하는 메소드(makeSum())를 정의
	public void makeSum(int x, int y) {			//static 제거
		int sum = 0;

		for (int i = x; i <= y; i++) {
			sum += i;
		}//for			

		System.out.println();
		System.out.println("시작 값 : " + x + ", 종료 값 : " + y);
		System.out.println("시작 값과 종료 값까지의 누적합 : " + sum);
	}//makeSum()
}//class
