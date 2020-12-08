import java.util.Arrays;

public class Test_Array02 {
	public static void main(String[] args) {
		// 초기화된 배열(arr)에서 홀수의 합(oddSum)과 짝수의 합(evenSum)을 구하여 출력
		int[] arr = {1, 4, 5, 8, 3, 2, 6, 7, 9};	// 배열(arr)을 선언하고 동시에 값을 할당 ▶ 초기화
		int oddSum = 0, evenSum = 0;		// 결과가 저장될 변수를 초기화
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 0) {
				evenSum += arr[i];
			} else {
				oddSum += arr[i];
			}
		}
		
		System.out.println("홀수의 합 : " + oddSum);
		System.out.println("짝수의 합 : " + evenSum);
		
		// 배열의 원소값을 출력할 때 for문을 쓰지 않고 출력하는 방법
		System.out.println("배열(arr)의 원소(요소)값 : " + Arrays.toString(arr));
		
		System.out.print("배열(arr)의 원소(요소)값 : [");
		for (int i = 0; i < arr.length; i++) {
			if(i == arr.length - 1) {
				System.out.print(arr[i] + "]");				
			} else {
				System.out.print(arr[i] + ", ");				
			}
		}//for
	}//main()
}//class
