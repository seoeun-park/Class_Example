import java.util.Arrays;

public class Ex_Method04 {
	// 정수형 배열(arr[])을 매개변수로 전달하여,
	// 배열의 원소 값의 총합(sum)을 구하여 출력하는 메소드(arrSum())를 호출
	public static void main(String[] args) {
		int[] arr = {10, 20, 30};		// 매개변수로 전달할 정수형 배열(arr[])을 선언 및 초기화
		arrSum(arr);					// arrSum() 메소드를 호출 : 실인수
	}//main()
	
	// 정수형 배열(arr[])을 매개변수로 전달받아,
	// 배열의 원소 값의 총합(sum)을 구하여 출력하는 메소드(arrSum())를 정의
	public static void arrSum(int[] arr) {		// arrSum() 메소드를 정의 : 가인수
		int sum = 0;
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];				// sum = sum + arr[i];
		}
		System.out.println("배열의 원소 값 : " + Arrays.toString(arr));
		System.out.println("배열의 원소 값의 총합 : " + sum);
	}//arrSum()
}//class
