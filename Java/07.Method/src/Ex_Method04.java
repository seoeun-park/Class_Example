import java.util.Arrays;

public class Ex_Method04 {
	// ������ �迭(arr[])�� �Ű������� �����Ͽ�,
	// �迭�� ���� ���� ����(sum)�� ���Ͽ� ����ϴ� �޼ҵ�(arrSum())�� ȣ��
	public static void main(String[] args) {
		int[] arr = {10, 20, 30};		// �Ű������� ������ ������ �迭(arr[])�� ���� �� �ʱ�ȭ
		arrSum(arr);					// arrSum() �޼ҵ带 ȣ�� : ���μ�
	}//main()
	
	// ������ �迭(arr[])�� �Ű������� ���޹޾�,
	// �迭�� ���� ���� ����(sum)�� ���Ͽ� ����ϴ� �޼ҵ�(arrSum())�� ����
	public static void arrSum(int[] arr) {		// arrSum() �޼ҵ带 ���� : ���μ�
		int sum = 0;
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];				// sum = sum + arr[i];
		}
		System.out.println("�迭�� ���� �� : " + Arrays.toString(arr));
		System.out.println("�迭�� ���� ���� ���� : " + sum);
	}//arrSum()
}//class
