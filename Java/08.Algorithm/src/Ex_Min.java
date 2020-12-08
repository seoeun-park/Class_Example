import java.util.Arrays;

public class Ex_Min {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���Ұ��� �ּҰ�(min)�� ���Ͽ� ����Ͻÿ�.
		int[] arr = {3, 2, 4, 1, 5};		// ������ �迭(arr[])�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		
		int min = arr[0];		// �ּҰ��� ����� ����(min)�� �ʱ�ȭ  ��  �迭�� ù ��° index�� �Ҵ�
		
		for (int i = 0; i < arr.length; i++) {
			min = (min < arr[i]) ? min : arr[i];
		}
		
		//================================================
		
		/*
		for (int i = 0; i < arr.length; i++) {
			if (min > arr[i]) {			// ������ �ּҰ�(min)�� ������ �迭 ���Ұ��� ��
				min = arr[i];			// �迭 ���Ұ�(arr[i])�� �� ������, �ִ밪�� ����(arr[i] ������ ���Ҵ�)
			}//if
		}//for
		*/
		
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("������ �ּҰ� : " + min);
		
		//================================================
		Arrays.sort(arr);			// �迭(arr[])�� ������������ ���� : ���� �Ŀ��� ���Ұ��� ������ ����
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("������ �ּҰ� : " + arr[0]);
		
	}//main()
}//class