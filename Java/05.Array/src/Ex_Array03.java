public class Ex_Array03 {
	public static void main(String[] args) {
		// 2�� 3���� ������ 2���� �迭(arr)�� ���� �� �����ϰ�
		// ��� ��ҿ� 10�� �Ҵ��ϰ� ����Ͻÿ�.
		
		int[][] arr;				// 2���� �迭 ����
		arr = new int[2][3];		// 2���� �迭 ����
		//int [][] arr = new int[2][3]
		
		/*
		arr[0][0] = 10;
		arr[0][1] = 10;
		arr[0][2] = 10;
		arr[1][0] = 10;
		arr[1][1] = 10;
		arr[1][2] = 10;
		*/
		
		for (int i = 0; i < arr.length; i++) {			//arr.length : 2
			for (int j = 0; j < arr[i].length; j++) {	//arr[i].length : 3
				arr[i][j] = 10;
				System.out.print("arr[" + i + "][" + j + "]�� �� : " + arr[i][j] + "\t");
			}//for j
			System.out.println();
		}//for i
		
	}//main()
}//class

/*
2) 2���� �迭(Array)

	�� �迭�� ���� : int[][] arr;
	�� �迭�� ���� : arr = new int[2][5]; 
	�� �迭�� ����� ���� : int[][] arr = new int[2][5];
	�� 2���� �迭�� length
	 - i.length �� 2���� �迭�� ���� �����μ� 2
	 - i[n].length�� n��° ���� ���� ����
	 - i[0].length �� 0��° ���� ���� �����μ� 5
	 - i[1].length �� 1��° ���� ���� �����μ� ���� 5
	�� ������ �迭�� �������� �迭
	 - ������ �迭�� �� ���� ���� ������ ���� �迭
	 - �����溴 �迭�� �� ���� ���� ������ �ٸ� �迭
	�� �������� �迭�� ����
	 - int arr[][]; // 2���� �迭�� ���۷��� ����
	 - arr = new int [4][]; // �� ���� ���۷��� �迭 ����
	 - arr[0] = new int [1]; // ù ��° ���� 1�� ���� �迭 ����
	 - arr[1] = new int [2]; // �� ��° ���� 2�� ���� �迭 ����
	 - arr[2] = new int [3]; // �� ��° ���� 3�� ���� �迭 ����
	 - arr[3] = new int [4]; // �� ��° ���� 4�� ���� �迭 ����
*/
