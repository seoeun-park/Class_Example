import java.util.Arrays;

public class Ex_Sum {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���Ұ��� ������(sum)�� ���Ͽ� ����Ͻÿ�.
		int[] arr = {3, 2, 4, 1, 5};		// ������ �迭(arr[])�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		int sum = 0;		// �������� ����� ����(sum)�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];			// �������� ��� : sum = sum + arr[i];
		}
		
		System.out.println("arr[] = " + Arrays.toString(arr));
		System.out.println("������ ������ : " + sum);
		
	}//main()
}//class
