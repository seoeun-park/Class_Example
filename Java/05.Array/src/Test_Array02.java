import java.util.Arrays;

public class Test_Array02 {
	public static void main(String[] args) {
		// �ʱ�ȭ�� �迭(arr)���� Ȧ���� ��(oddSum)�� ¦���� ��(evenSum)�� ���Ͽ� ���
		int[] arr = {1, 4, 5, 8, 3, 2, 6, 7, 9};	// �迭(arr)�� �����ϰ� ���ÿ� ���� �Ҵ� �� �ʱ�ȭ
		int oddSum = 0, evenSum = 0;		// ����� ����� ������ �ʱ�ȭ
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 0) {
				evenSum += arr[i];
			} else {
				oddSum += arr[i];
			}
		}
		
		System.out.println("Ȧ���� �� : " + oddSum);
		System.out.println("¦���� �� : " + evenSum);
		
		// �迭�� ���Ұ��� ����� �� for���� ���� �ʰ� ����ϴ� ���
		System.out.println("�迭(arr)�� ����(���)�� : " + Arrays.toString(arr));
		
		System.out.print("�迭(arr)�� ����(���)�� : [");
		for (int i = 0; i < arr.length; i++) {
			if(i == arr.length - 1) {
				System.out.print(arr[i] + "]");				
			} else {
				System.out.print(arr[i] + ", ");				
			}
		}//for
	}//main()
}//class
