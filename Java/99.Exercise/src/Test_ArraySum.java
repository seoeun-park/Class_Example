public class Test_ArraySum {
	public static void main(String[] args) {

		/*����) �־��� 2���� �迭�� �����ͺ��� ���ο� ���η� 1�� �� ū ������ �迭�� �����ؼ� 
		�迭�� ��� ���� ������ ��ҿ� �� ���� ���� ������ �����ϰ� ����ϴ� ���α׷��� �ϼ��Ͻÿ�.*/
		
		int[][] score = { {10, 20, 30}, {40, 50, 60}, {70, 80, 90}, 
						{100, 110, 120}, {130, 140, 150} };
		
		int[][] temp = new int[score.length + 1][score[0].length + 1];
		
		for (int i = 0; i < score.length; i++) {
			for (int j = 0; j < score[i].length; j++) {
				temp[i][j] = score[i][j];
				temp[i][score[0].length] += temp[i][j];
				temp[score.length][j] += temp[i][j];
				temp[score.length][score[0].length] += temp[i][j];
			}//for j
		}//for i
		
		for (int i = 0; i < temp.length; i++) {
			for (int j = 0; j < temp[i].length; j++) {
				System.out.print(temp[i][j] + "\t");
			}
			System.out.println();
		}
		
		//temp.length = 6;
		//temp[0].length = 4;
		//score.length = 5;
		//score[0].length = 3;
		
		//temp[0][3] : temp[0][0] + temp[0][1] + temp[0][2]
		//temp[1][3] : temp[1][0] + temp[1][1] + temp[1][2]
		//temp[2][3] : temp[2][0] + temp[2][1] + temp[2][2]
		//temp[3][3] : temp[3][0] + temp[3][1] + temp[3][2]
		//temp[4][3] : temp[4][0] + temp[4][1] + temp[5][2]
		
		//temp[5][0] : temp[0][0] + temp[1][0] + temp[2][0] + temp[3][0] + temp[4][0]
		//temp[5][1] : temp[0][1] + temp[1][1] + temp[2][1] + temp[3][1] + temp[4][1]
		//temp[5][2] : temp[0][2] + temp[1][2] + temp[2][2] + temp[3][2] + temp[4][2]
		
		//temp[5][3] : ����
		
		
	}//main()
}//class
/*
1�� 4
2�� 1
3�� 2
4�� 2 
5�� 2
6�� 2
7�� 4
8�� 3
9�� 2
10�� 3
11�� 4
12�� 2
13�� 4
14�� 4

1�� main
2�� Car car = new Car();
3�� 2
4�� �����ڳ� �޼ҵ�ȿ��� ����� ���ú����� �ʵ�� �̸�...
5�� �Ȱ��� �̸��� �޼ҵ带 �Ķ������ Ÿ���� �ٸ��� �ϰų�...
6�� 6
7�� 5
 */
