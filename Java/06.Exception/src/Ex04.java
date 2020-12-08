public class Ex04 {
	public static void main(String[] args) {
		// 1���� 100���� ������(sum)�� ���Ͻÿ�.
		// ��, �������� 777�̻��̸�, �ݺ��� ����(break)�ϰ� �׶������� ������� ���
		int sum = 0, count = 0;
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
			count++;
			if (sum >= 777) {
				System.out.println("�������� 777�̻��� �Ǿ����ϴ�.");
				break;
			}//if
		}//for
		
		System.out.println(sum);
		System.out.println(count);
		
		//-----------------------------------------------------------
		// ��, try-catch ���� �̿��Ͽ� ����ó�� �Ͻÿ�. : throw
		sum = 0;
		count = 0;
		try {
			for (int i = 0; i <= 100; i++) {
				sum += i;
				count++;
				if(sum >= 777) {
					throw new Exception("�������� 777 �̻��� �Ǿ����ϴ�.");
					// ���ܸ� ������ �߻����� catch ������ �ѱ��.
				}//if
			}
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		System.out.println(sum);
		System.out.println(count);
		
	}//main()
}//class

// throw : ������ ���ܸ� �߻���Ų��  �� catch ������ ����ó���� �ѱ��. 
// �ǹ����� ���� ���� ����
