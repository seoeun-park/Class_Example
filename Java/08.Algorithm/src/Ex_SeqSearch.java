import java.util.Scanner;

public class Ex_SeqSearch {
	// �����˻�(Sequence Search) : ������ ��Ͽ��� ó������ ������ �˻� �� ������ ����� �ҷ��� ���
	public static void main(String[] args) {
		int[] arr = {30, 90, 10, 40, 60, 70, 50, 20, 100, 80}; 		// ������ ����� ����� �迭
		Scanner scanner = new Scanner(System.in);
		System.out.print("ã�� ���� �Է��ϼ��� : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		Ex_SeqSearch search = new Ex_SeqSearch();		// ��ü ����
		int index = search.seqSearch(arr, searchData);	// seqSearch() �޼ҵ� ȣ��
		
		if (index == -1) {
			System.out.println("ã�� ���� " + searchData + "�̸�, �˻��� �����߽��ϴ�!");
		} else {
			System.out.println("ã�� ���� " + searchData + "�̸�, " + index + "��°�� �ֽ��ϴ�.");
		}
	}//main()

	// seqSearch() : �����˻�
	private int seqSearch(int[] arr, int searchData) {
		int index = -1;		// ���α׷����� -1�� ����(��)�� �ǹ���
		for (int i = 0; i < arr.length; i++) {
			if (arr[i] == searchData) {		// ã�� �����Ͱ� �ִ�.
				index = i + 1;				// ã�� �������� ��ġ ���� ���Ѵ�.
				break;
			}//if
		}//for
		return index;
	}//seqSearch()
}//class
