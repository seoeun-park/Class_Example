public class Test_ArraySum {
	public static void main(String[] args) {

		/*문제) 주어진 2차원 배열의 데이터보다 가로와 세로로 1이 더 큰 정방형 배열을 생성해서 
		배열의 행과 열의 마지막 요소에 각 열과 행의 총합을 저장하고 출력하는 프로그램을 완성하시오.*/
		
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
		
		//temp[5][3] : 총합
		
		
	}//main()
}//class
/*
1번 4
2번 1
3번 2
4번 2 
5번 2
6번 2
7번 4
8번 3
9번 2
10번 3
11번 4
12번 2
13번 4
14번 4

1번 main
2번 Car car = new Car();
3번 2
4번 생성자나 메소드안에서 선언된 로컬변수가 필드와 이름...
5번 똑같은 이름의 메소드를 파라미터의 타입을 다르게 하거나...
6번 6
7번 5
 */
