import java.util.Arrays;

public class Ex_Min {
	public static void main(String[] args) {
		// 정수형 배열(arr[])의 원소값의 최소값(min)을 구하여 출력하시오.
		int[] arr = {3, 2, 4, 1, 5};		// 정수형 배열(arr[])을 선언하고 값을 할당 : 초기화
		
		int min = arr[0];		// 최소값이 저장될 변수(min)를 초기화  ▶  배열의 첫 번째 index로 할당
		
		for (int i = 0; i < arr.length; i++) {
			min = (min < arr[i]) ? min : arr[i];
		}
		
		//================================================
		
		/*
		for (int i = 0; i < arr.length; i++) {
			if (min > arr[i]) {			// 현재의 최소값(min)과 각각의 배열 원소값을 비교
				min = arr[i];			// 배열 원소값(arr[i])이 더 작으면, 최대값을 변경(arr[i] 값으로 재할당)
			}//if
		}//for
		*/
		
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("원소의 최소값 : " + min);
		
		//================================================
		Arrays.sort(arr);			// 배열(arr[])을 오름차순으로 정렬 : 정렬 후에는 원소값의 순서가 변경
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("원소의 최소값 : " + arr[0]);
		
	}//main()
}//class