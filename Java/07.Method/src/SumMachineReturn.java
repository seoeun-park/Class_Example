import java.util.Scanner;

public class SumMachineReturn {
	// 시작 값(startNum)과 종료 값(endNum)을 입력받은 후
	// makeSum() 메소드 호출하고 결과값(sum)을 return 받아 출력
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
			//System.out.println("시작 값과 종료 값까지의 누적합 : " + makeSum(startNum, endNum));
			
			SumMachineReturn smr = new SumMachineReturn(); 	// makeSum 메소드가 있는 클래스를 생성
			System.out.println("시작 값과 종료 값까지의 누적합 : " + smr.makeSum(startNum, endNum));
			break;
		}//while
		
		scanner.close();	

	}//main()
	
	// 시작 값과 종료 값까지 누적합(sum)을 구하고 결과를 return 메소드(makeSum())를 정의
	private int makeSum(int startNum, int endNum) {
		int sum = 0;

		for (int i = startNum; i <= endNum; i++) {
			sum += i;
		}//for
		return sum;
	}//makeSum()
}//class
