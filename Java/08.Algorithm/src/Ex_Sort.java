import java.util.Arrays;

public class Ex_Sort {
	public static void main(String[] args) {
		// 정수형 배열(arr[])의 원소값을 오름차순으로 정렬하여 출력 : ascSort()
		// 정수형 배열(arr[])의 원소값을 내림차순으로 정렬하여 출력 : descSort()
		int[] arr = {3, 2, 4, 1, 5};
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("오름차순 정렬 : " + Arrays.toString(ascSort(arr)));
		System.out.println("내림차순 정렬 : " + Arrays.toString(descSort(arr)));
	}//main()
	
	// 오름차순으로 정렬하고 결과를 리턴하는 메소드를 정의 : 선택정렬(값의 크기를 비교하면서 맞바꿈)
	public static int[] ascSort(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] > arr[j]) {		// 오름차순
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}//if
			}//for j
		}//for i
		return arr;
	}//ascSort()
	
	// 내림차순으로 정렬하고 결과를 리턴하는 메소드를 정의 : 선택정렬(값의 크기를 비교하면서 맞바꿈)
	public static int[] descSort(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] < arr[j]) {		// 내림차순
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}//if
			}//for j
		}//for i
		return arr;
	}//descSort()
}//class
