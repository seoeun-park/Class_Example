import java.util.Arrays;

public class Ex_Max {
	public static void main(String[] args) {
		// 정수형 배열(arr[])의 원소값의 최댓값(max)을 구하여 출력하시오.
		int[] arr = {3, 2, 4, 1, 5};		// 정수형 배열(arr[])을 선언하고 값을 할당 : 초기화
		
		int max = arr[0];		// 최댓값이 저장될 변수(max)를 초기화  ▶  배열의 첫 번째 index로 할당
		/*
		for (int i = 0; i < arr.length; i++) {
			if (max < arr[i]) {			// 현재의 최대값(max)과 각각의 배열 원소값을 비교
				max = arr[i];			// 배열 원소값(arr[i])이 더 크면, 최대값을 변경(arr[i] 값으로 재할당)
			}//if
		}//for
		 */
		
		//================================================
		
		for (int i = 0; i < arr.length; i++) {
			max = (max > arr[i]) ? max : arr[i];
		}
		
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("원소의 최대값 : " + max);
		
		//================================================
		Arrays.sort(arr);			// 배열(arr[])을 오름차순으로 정렬 : 정렬 후에는 원소값의 순서가 변경
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("원소의 최대값 : " + arr[arr.length - 1]);
		
	}//main()
}//class
