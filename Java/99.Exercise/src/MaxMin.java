import java.util.Arrays;
import java.util.Scanner;

public class MaxMin {
	public static void main(String[] args) {
		/*
		  ����) ���� ���� �迭(arr[])�� ������ �� �迭�� �ִ밪(max)�� �ּҰ�(min)�� ���Ͽ� 
		  		����ϴ� ���α׷��� �ۼ��Ͻÿ�.
		  �� : 50, 100, -70, 20, 25, 80, 255, 42, -100, 72
		 */
		int[] arr = {50, 100, -70, 20, 25, 80, 255, 42, -100, 72};
		
		int max = arr[0];
		int min = arr[0];
		
		for (int i = 0; i < arr.length; i++) {
			max = (max > arr[i]) ? max : arr[i];
			min = (min < arr[i]) ? min : arr[i];
		}//for
		
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("�迭�� �ִ밪 : " + max);
		System.out.println("�迭�� �ּҰ� : " + min);			
	}//main()
}//class
