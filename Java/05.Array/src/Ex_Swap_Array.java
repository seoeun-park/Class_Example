import java.util.Arrays;

public class Ex_Swap_Array {
	public static void main(String[] args) {
		// 배열(arr1)을 초기화 후 출력
		int[] arr1 = {1, 2, 3, 4, 5, 6, 7, 8, 9};
		
		// 출력 방법 1
		System.out.println("arr1 배열의 값 : " + Arrays.toString(arr1));
		
		// 출력 방법 2
		System.out.print("arr1 배열의 값 : [");
		for (int i = 0; i < arr1.length; i++) {
			if (i != arr1.length - 1) {
				System.out.print(arr1[i] + ", ");				
			} else {
				System.out.print(arr1[i] + "]");				
			}
		}//for
		
		System.out.println("\n==============================");
		
		// 배열(arr1)에 저장된 데이터를 역순으로 출력하는 방법 1
		System.out.print("arr1 배열의 값(역순) : [");
		for (int i = arr1.length - 1; i >= 0; i--) {
			if (i != 0) {
				System.out.print(arr1[i] + ", ");				
			} else {
				System.out.print(arr1[i] + "]");				
			}
		}//for
		
		System.out.println("\n==============================");
		
		// 배열(arr1)에 저장된 데이터를 역순으로 출력하는 방법 2
		int[] arr2 = new int[arr1.length];		// 임시 배열(arr2)을 선언 및 생성
		
		/*		
 		arr2[0] = arr1[4];
		arr2[1] = arr1[3];
		arr2[2] = arr1[2];
		arr2[3] = arr1[1];
		arr2[4] = arr1[0];
		*/
		
		int index = arr1.length - 1;
		
		for (int i = 0; i < arr1.length; i++) {
			arr2[index - i] = arr1[i];
		}
		System.out.println("arr2 배열의 값 : " + Arrays.toString(arr2));
		
	}//main()
}//class
