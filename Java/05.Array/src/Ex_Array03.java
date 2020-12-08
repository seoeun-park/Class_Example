public class Ex_Array03 {
	public static void main(String[] args) {
		// 2행 3열의 정수형 2차원 배열(arr)을 선언 및 생성하고
		// 모든 요소에 10을 할당하고 출력하시오.
		
		int[][] arr;				// 2차원 배열 선언
		arr = new int[2][3];		// 2차원 배열 생성
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
				System.out.print("arr[" + i + "][" + j + "]의 값 : " + arr[i][j] + "\t");
			}//for j
			System.out.println();
		}//for i
		
	}//main()
}//class

/*
2) 2차원 배열(Array)

	① 배열의 선언 : int[][] arr;
	② 배열의 생성 : arr = new int[2][5]; 
	③ 배열의 선언과 생성 : int[][] arr = new int[2][5];
	④ 2차원 배열의 length
	 - i.length → 2차원 배열의 행의 개수로서 2
	 - i[n].length는 n번째 행의 열의 개수
	 - i[0].length → 0번째 행의 열의 개수로서 5
	 - i[1].length → 1번째 행의 열의 개수로서 역시 5
	⑤ 정방형 배열과 비정방형 배열
	 - 정방형 배열은 각 행의 열의 개수가 같은 배열
	 - 비정방병 배열은 각 행의 열의 개수가 다른 배열
	⑥ 비정방형 배열의 생성
	 - int arr[][]; // 2차원 배열의 레퍼런스 선언
	 - arr = new int [4][]; // 각 행의 레퍼런스 배열 생성
	 - arr[0] = new int [1]; // 첫 번째 행의 1개 정수 배열 생성
	 - arr[1] = new int [2]; // 두 번째 행의 2개 정수 배열 생성
	 - arr[2] = new int [3]; // 세 번째 행의 3개 정수 배열 생성
	 - arr[3] = new int [4]; // 네 번째 행의 4개 정수 배열 생성
*/
