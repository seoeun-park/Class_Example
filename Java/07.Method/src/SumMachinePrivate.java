import java.util.Scanner;

public class SumMachinePrivate {
	// 시작 값(startNum)과 종료 값(endNum)을 입력받은 후
	// makeSum() 메소드 호출하고 결과값(sum)을 출력
	// makeSum() 메소드는 SumMachine.java, SumMachineReturn.java 클래스 활용
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
			
			System.out.println();
			System.out.println("시작 값 : " + startNum + ", 종료 값 : " + endNum);
			
			SumMachine sm = new SumMachine(); 	// SumMachine 클래스를 생성
			sm.makeSum(startNum, endNum);		// makeSum() 메소드 호출
			// public → makeSum() : 접근제어자가 public 선언  ▶  외부에서도 사용 가능
			
			SumMachineReturn smr = new SumMachineReturn();	// SumMacineReturn 객체 생성
			//smr.makeSum(startNum, endNum);		// makeSum() 메소드 호출
			// private → makeSum() : 접근제어자가 private 선언  ▶  내부에서도 사용 가능(정보은닉)
			
			break;
		}//while
		scanner.close();
	}//main()
}//class
