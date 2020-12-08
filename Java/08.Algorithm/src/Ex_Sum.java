import java.util.Arrays;

public class Ex_Sum {
	public static void main(String[] args) {
		// 정수형 배열(arr[])의 원소값의 누적합(sum)을 구하여 출력하시오.
		int[] arr = {3, 2, 4, 1, 5};		// 정수형 배열(arr[])을 선언하고 값을 할당 : 초기화
		int sum = 0;		// 누적합이 저장될 변수(sum)을 선언하고 값을 할당 : 초기화
		
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];			// 누적합을 계산 : sum = sum + arr[i];
		}
		
		System.out.println("arr[] = " + Arrays.toString(arr));
		System.out.println("원소의 누적합 : " + sum);
		
	}//main()
}//class
