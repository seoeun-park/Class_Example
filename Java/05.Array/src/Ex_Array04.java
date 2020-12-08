public class Ex_Array04 {
	public static void main(String[] args) {
		// 비정방형(가변길이) 배열 : 행은 고정, 열이 가변길이
		int[][] arr = new int[2][];		// 2행의 길이를 갖는 비정방형 배열(arr) 선언 및 생성
		arr[0] = new int[2];		// 첫 번째 행의 열의 크기(길이)를 생성
		arr[1] = new int[3];		// 두 번째 행의 열의 크기(길이)를 생성
		
		for (int i = 0; i < arr.length; i++) {			//arr.length : 2
			for (int j = 0; j < arr[i].length; j++) {	//arr[i].length : 2, 3
				arr[i][j] = 10;
				System.out.print("arr[" + i + "][" + j + "]의 값 : " + arr[i][j] + "\t");
			}//for j
			System.out.println();
		}//for i
		
	}//main()
}//class
