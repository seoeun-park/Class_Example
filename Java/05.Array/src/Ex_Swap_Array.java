import java.util.Arrays;

public class Ex_Swap_Array {
	public static void main(String[] args) {
		// �迭(arr1)�� �ʱ�ȭ �� ���
		int[] arr1 = {1, 2, 3, 4, 5, 6, 7, 8, 9};
		
		// ��� ��� 1
		System.out.println("arr1 �迭�� �� : " + Arrays.toString(arr1));
		
		// ��� ��� 2
		System.out.print("arr1 �迭�� �� : [");
		for (int i = 0; i < arr1.length; i++) {
			if (i != arr1.length - 1) {
				System.out.print(arr1[i] + ", ");				
			} else {
				System.out.print(arr1[i] + "]");				
			}
		}//for
		
		System.out.println("\n==============================");
		
		// �迭(arr1)�� ����� �����͸� �������� ����ϴ� ��� 1
		System.out.print("arr1 �迭�� ��(����) : [");
		for (int i = arr1.length - 1; i >= 0; i--) {
			if (i != 0) {
				System.out.print(arr1[i] + ", ");				
			} else {
				System.out.print(arr1[i] + "]");				
			}
		}//for
		
		System.out.println("\n==============================");
		
		// �迭(arr1)�� ����� �����͸� �������� ����ϴ� ��� 2
		int[] arr2 = new int[arr1.length];		// �ӽ� �迭(arr2)�� ���� �� ����
		
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
		System.out.println("arr2 �迭�� �� : " + Arrays.toString(arr2));
		
	}//main()
}//class
