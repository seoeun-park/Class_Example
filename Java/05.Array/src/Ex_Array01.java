public class Ex_Array01 {
	public static void main(String[] args) {
		// ������ ������ �迭(arr)�� �����ϰ�
		// ������ �迭�� ũ��(����)�� 3���� �����ϰ�
		// ��� ��ҿ� 10�� �Ҵ��ϰ� ����Ͻÿ�.
		
		int[] arr;			// ������ �迭 arr�� ���� (or int arr[];)
		arr = new int[3];			// �迭�� ���� : �迭�� ũ��(����)�� ����
		//int[] arr = new int[3];			// �迭�� ���� �� ����
		
		arr[0] = 10;			// �迭(arr)�� 0����(index)�� 10�� �Ҵ�
		arr[1] = 10;			// �迭(arr)�� 1����(index)�� 10�� �Ҵ�
		arr[2] = 10;			// �迭(arr)�� 2����(index)�� 10�� �Ҵ�
		
		System.out.println("arr[0] = " + arr[0]);			// �迭(arr)�� 0����(index)�� ���� ���
		System.out.println("arr[1] = " + arr[1]);			// �迭(arr)�� 1����(index)�� ���� ���
		System.out.println("arr[2] = " + arr[2]);			// �迭(arr)�� 2����(index)�� ���� ���
		
		System.out.println(arr);			// �迭(arr)�� �����ϴ� �޸��� �ؽ��ڵ� ���� ���(16����)
			
	}//main()
}//class
