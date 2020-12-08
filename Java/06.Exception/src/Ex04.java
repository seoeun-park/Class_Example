public class Ex04 {
	public static void main(String[] args) {
		// 1부터 100까지 누적합(sum)을 구하시오.
		// 단, 누적합이 777이상이면, 반복을 중지(break)하고 그때까지의 결과값을 출력
		int sum = 0, count = 0;
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
			count++;
			if (sum >= 777) {
				System.out.println("누적합이 777이상이 되었습니다.");
				break;
			}//if
		}//for
		
		System.out.println(sum);
		System.out.println(count);
		
		//-----------------------------------------------------------
		// 단, try-catch 블럭을 이용하여 예외처리 하시오. : throw
		sum = 0;
		count = 0;
		try {
			for (int i = 0; i <= 100; i++) {
				sum += i;
				count++;
				if(sum >= 777) {
					throw new Exception("누적합이 777 이상이 되었습니다.");
					// 예외를 강제로 발생시켜 catch 블럭으로 넘긴다.
				}//if
			}
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		System.out.println(sum);
		System.out.println(count);
		
	}//main()
}//class

// throw : 강제로 예외를 발생시킨다  → catch 블럭으로 예외처리를 넘긴다. 
// 실무에서 절대 쓰지 않음
