public class Test_Array01 {
	public static void main(String[] args) {
		// ���� 3���� ������ �迭(arr1)�� ���� �� �����ϰ�
		// ��� ��ҿ� 10�� �Ҵ��ϰ� ����Ͻÿ�.
		int[] arr1 = new int[3];		// �迭(arr1)�� ���� �� ����
		
		for (int i = 0; i < arr1.length; i++) {
			arr1[i] = 10;				// �迭 arr1[i] ����(index)�� 10�� �Ҵ�
			System.out.println("arr1[" + i + "]�� �� : " + arr1[i]);
		}//for
		
		System.out.println("=========================");
		
		// ���� 3���� ������ �迭(arr2)�� ���� �� �����ϰ�
		// ������ ��ҿ� 10, 20, 30�� �Ҵ��ϰ� ����Ͻÿ�
		int[] arr2 = new int [3];
		
		for (int i = 0; i < arr2.length; i++) {
			arr2[i] = 10 * (i + 1);
			System.out.println("arr2[" + i + "]�� �� : " + arr2[i]);
		}//for
		
	}//main()
}//class
