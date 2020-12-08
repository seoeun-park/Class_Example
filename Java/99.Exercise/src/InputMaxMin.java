import java.util.Arrays;
import java.util.Scanner;

public class InputMaxMin {
	public static void main(String[] args) {
		InputMaxMin imn = new InputMaxMin();
		int[] arr = imn.input();
		int max = imn.getMax(arr);
		int min = imn.getMin(arr);
		
		/*
		int max = 0;
		int min = 0;
		int value = 0;
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "번째 정수를 입력하세요 : ");
			value = Integer.parseInt(scanner.nextLine());
			arr[i] = value;
			max = arr[0];
			min = arr[0];
			max = (max > arr[i]) ? max : arr[i];
			min = (min < arr[i]) ? min : arr[i];
		}//for
		 */
		//==================================================== 오류
		
		imn.display(arr, max, min);
		
	}//main()
	
	public int[] input() {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("입력할 정수의 개수를 입력하세요 : ");
		int cnt = Integer.parseInt(scanner.nextLine());
		
		int[] arr = new int[cnt];
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "번째 정수를 입력하세요 : ");
			arr[i] = Integer.parseInt(scanner.nextLine());
		}//for1
		
		System.out.println("입력을 완료하셨습니다.");		
		scanner.close();
		
		return arr;
	}//input()
	
	public int getMax(int[] arr) {
		int max = arr[0];
		
		for (int i = 0; i < arr.length; i++) {
			max = (max > arr[i]) ? max : arr[i];
		}
		
		return max;
	}//getMax()
	
	public int getMin(int[] arr) {
		int min = arr[0];
		
		for (int i = 0; i < arr.length; i++) {
			min = (min < arr[i]) ? min : arr[i];
		}
		
		return min;
	}//getMin()
	
	public void display(int[] arr, int max, int min) {

		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("배열의 최대값 : " + max);
		System.out.println("배열의 최소값 : " + min);
	}//display()
	
}//class
