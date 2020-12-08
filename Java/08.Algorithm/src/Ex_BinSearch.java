import java.util.Scanner;

public class Ex_BinSearch {
	// 이전검색(Binary Search) : low(하한값), middle(중간값), high(상한값) 값을 사용
	// 찾고자 하는 데이터를 중앙에 위치한 중간값과 비교하는 방법
	// 데이터 목록은 반드시 오름차순으로 정렬되어있어야 한다(전제조건).
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50 ,60, 70, 80, 90, 100};	//데이터 목록이 저장된 배열(오름차순)
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("찾는 수를 입력하세요 : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		Ex_BinSearch search = new Ex_BinSearch();
		int index = search.binSearch(arr, searchData);		// binSearch() 메소드 호출
		
		if (index == -1) {
			System.out.println("찾는 수는 " + searchData + "이며, 검색에 실패했습니다!");
		} else {
			System.out.println("찾는 수는 " + searchData + "이며, " + index + "번째에 있습니다.");
		}
	}//main()

	
	// binSearch() : 이진 검색
	private int binSearch(int[] arr, int searchData) {
		int index = -1;
		int low = 0, middle = 0, high = arr.length - 1;
		// arr.length = 10
		
		// 반복문이 몇번 돌아갈 지 모르므로 while 구문으로 작성하는 것이 좋다.
		while(low <= high) {
			middle = (low + high) / 2;			// 중간값이 저장된 배열의 index
			if (arr[middle] == searchData) {	// 성공 : 검색 완료
				index = middle + 1;
				break;
			} else if (arr[middle] < searchData) {	// low 포인터 변경
				low = middle + 1;		// 중간값을 기준으로 배열의 왼쪽 목록을 제외
			} else {		// arr[middle] > searchData : high 포인터 변경
				high = middle - 1;		// 중간값을 기준으로 배열의 오른쪽 목록을 제외
			}//if
		}//while
		
		return index;
		
	}//binSearch()
	
}//class
