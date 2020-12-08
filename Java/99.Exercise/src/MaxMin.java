import java.util.Arrays;
import java.util.Scanner;

public class MaxMin {
	public static void main(String[] args) {
		/*
		  문제) 다음 수로 배열(arr[])을 생성한 후 배열의 최대값(max)과 최소값(min)을 구하여 
		  		출력하는 프로그램을 작성하시오.
		  수 : 50, 100, -70, 20, 25, 80, 255, 42, -100, 72
		 */
		int[] arr = {50, 100, -70, 20, 25, 80, 255, 42, -100, 72};
		
		int max = arr[0];
		int min = arr[0];
		
		for (int i = 0; i < arr.length; i++) {
			max = (max > arr[i]) ? max : arr[i];
			min = (min < arr[i]) ? min : arr[i];
		}//for
		
		System.out.println("배열의 원소값 : " + Arrays.toString(arr));
		System.out.println("배열의 최대값 : " + max);
		System.out.println("배열의 최소값 : " + min);			
	}//main()
}//class
