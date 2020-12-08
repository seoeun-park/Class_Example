import java.util.Arrays;

public class Ex_Max {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���Ұ��� �ִ�(max)�� ���Ͽ� ����Ͻÿ�.
		int[] arr = {3, 2, 4, 1, 5};		// ������ �迭(arr[])�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		
		int max = arr[0];		// �ִ��� ����� ����(max)�� �ʱ�ȭ  ��  �迭�� ù ��° index�� �Ҵ�
		/*
		for (int i = 0; i < arr.length; i++) {
			if (max < arr[i]) {			// ������ �ִ밪(max)�� ������ �迭 ���Ұ��� ��
				max = arr[i];			// �迭 ���Ұ�(arr[i])�� �� ũ��, �ִ밪�� ����(arr[i] ������ ���Ҵ�)
			}//if
		}//for
		 */
		
		//================================================
		
		for (int i = 0; i < arr.length; i++) {
			max = (max > arr[i]) ? max : arr[i];
		}
		
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("������ �ִ밪 : " + max);
		
		//================================================
		Arrays.sort(arr);			// �迭(arr[])�� ������������ ���� : ���� �Ŀ��� ���Ұ��� ������ ����
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("������ �ִ밪 : " + arr[arr.length - 1]);
		
	}//main()
}//class
