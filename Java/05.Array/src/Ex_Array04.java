public class Ex_Array04 {
	public static void main(String[] args) {
		// ��������(��������) �迭 : ���� ����, ���� ��������
		int[][] arr = new int[2][];		// 2���� ���̸� ���� �������� �迭(arr) ���� �� ����
		arr[0] = new int[2];		// ù ��° ���� ���� ũ��(����)�� ����
		arr[1] = new int[3];		// �� ��° ���� ���� ũ��(����)�� ����
		
		for (int i = 0; i < arr.length; i++) {			//arr.length : 2
			for (int j = 0; j < arr[i].length; j++) {	//arr[i].length : 2, 3
				arr[i][j] = 10;
				System.out.print("arr[" + i + "][" + j + "]�� �� : " + arr[i][j] + "\t");
			}//for j
			System.out.println();
		}//for i
		
	}//main()
}//class
