public class Ex_break {
	// break : �ݺ����� Ż���ϴ� ��ɾ�
	public static void main(String[] args) {
		int i = 1;
		
		while(true) {		// ���ѷ���
			if (i == 10) {
				System.out.println("i�� ���� 10�̹Ƿ� �ݺ����� �����մϴ�.");
				break;
			}//if
			System.out.println("i�� �� : " + i);
			i++;
		}//while
	} //main()
} //class
