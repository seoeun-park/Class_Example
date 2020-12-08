import java.util.Scanner;

public class Ex_BinSearch {
	// �����˻�(Binary Search) : low(���Ѱ�), middle(�߰���), high(���Ѱ�) ���� ���
	// ã���� �ϴ� �����͸� �߾ӿ� ��ġ�� �߰����� ���ϴ� ���
	// ������ ����� �ݵ�� ������������ ���ĵǾ��־�� �Ѵ�(��������).
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50 ,60, 70, 80, 90, 100};	//������ ����� ����� �迭(��������)
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("ã�� ���� �Է��ϼ��� : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		Ex_BinSearch search = new Ex_BinSearch();
		int index = search.binSearch(arr, searchData);		// binSearch() �޼ҵ� ȣ��
		
		if (index == -1) {
			System.out.println("ã�� ���� " + searchData + "�̸�, �˻��� �����߽��ϴ�!");
		} else {
			System.out.println("ã�� ���� " + searchData + "�̸�, " + index + "��°�� �ֽ��ϴ�.");
		}
	}//main()

	
	// binSearch() : ���� �˻�
	private int binSearch(int[] arr, int searchData) {
		int index = -1;
		int low = 0, middle = 0, high = arr.length - 1;
		// arr.length = 10
		
		// �ݺ����� ��� ���ư� �� �𸣹Ƿ� while �������� �ۼ��ϴ� ���� ����.
		while(low <= high) {
			middle = (low + high) / 2;			// �߰����� ����� �迭�� index
			if (arr[middle] == searchData) {	// ���� : �˻� �Ϸ�
				index = middle + 1;
				break;
			} else if (arr[middle] < searchData) {	// low ������ ����
				low = middle + 1;		// �߰����� �������� �迭�� ���� ����� ����
			} else {		// arr[middle] > searchData : high ������ ����
				high = middle - 1;		// �߰����� �������� �迭�� ������ ����� ����
			}//if
		}//while
		
		return index;
		
	}//binSearch()
	
}//class
