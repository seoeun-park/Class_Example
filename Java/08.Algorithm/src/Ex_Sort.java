import java.util.Arrays;

public class Ex_Sort {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���Ұ��� ������������ �����Ͽ� ��� : ascSort()
		// ������ �迭(arr[])�� ���Ұ��� ������������ �����Ͽ� ��� : descSort()
		int[] arr = {3, 2, 4, 1, 5};
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("�������� ���� : " + Arrays.toString(ascSort(arr)));
		System.out.println("�������� ���� : " + Arrays.toString(descSort(arr)));
	}//main()
	
	// ������������ �����ϰ� ����� �����ϴ� �޼ҵ带 ���� : ��������(���� ũ�⸦ ���ϸ鼭 �¹ٲ�)
	public static int[] ascSort(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] > arr[j]) {		// ��������
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}//if
			}//for j
		}//for i
		return arr;
	}//ascSort()
	
	// ������������ �����ϰ� ����� �����ϴ� �޼ҵ带 ���� : ��������(���� ũ�⸦ ���ϸ鼭 �¹ٲ�)
	public static int[] descSort(int[] arr) {
		for (int i = 0; i < arr.length; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				if (arr[i] < arr[j]) {		// ��������
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}//if
			}//for j
		}//for i
		return arr;
	}//descSort()
}//class
