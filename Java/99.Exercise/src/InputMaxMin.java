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
			System.out.print((i + 1) + "��° ������ �Է��ϼ��� : ");
			value = Integer.parseInt(scanner.nextLine());
			arr[i] = value;
			max = arr[0];
			min = arr[0];
			max = (max > arr[i]) ? max : arr[i];
			min = (min < arr[i]) ? min : arr[i];
		}//for
		 */
		//==================================================== ����
		
		imn.display(arr, max, min);
		
	}//main()
	
	public int[] input() {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("�Է��� ������ ������ �Է��ϼ��� : ");
		int cnt = Integer.parseInt(scanner.nextLine());
		
		int[] arr = new int[cnt];
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "��° ������ �Է��ϼ��� : ");
			arr[i] = Integer.parseInt(scanner.nextLine());
		}//for1
		
		System.out.println("�Է��� �Ϸ��ϼ̽��ϴ�.");		
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

		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("�迭�� �ִ밪 : " + max);
		System.out.println("�迭�� �ּҰ� : " + min);
	}//display()
	
}//class
