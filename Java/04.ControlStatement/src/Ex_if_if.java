public class Ex_if_if {
	public static void main(String[] args) {
		/*
		 �� ��ø if�� : if�� �ȿ� �ٸ� if���� �ִ� ����(��ȿ�� �˻�)
		 
		 if (���ǽ� A) {
		 	if (���ǽ� 1) {
		 		���ǽ� A�� ������ ���¿��� ���ǽ� 1�� ���� �� ����Ǵ� ����;
		 	} else if (���ǽ� 2) {
		 		���ǽ� A�� ������ ���¿��� ���ǽ� 2�� ���� �� ����Ǵ� ����;
		 	}
		 } else if (���ǽ� B) {
		 	���ǽ� B�� ���� �� ����Ǵ� ����;
		 }
		 
		 */
		
		int score = 87;
		
		if (score >= 0 && score <= 100) {
			if (score >= 90) {
				System.out.println("A����");
			} else if (score >= 80) {
				System.out.println("B����");
			} else if (score >= 70) {
				System.out.println("C����");
			} else if (score >= 60) {
				System.out.println("D����");
			} else {
				System.out.println("F����");
			} //if
		} else {
			System.out.println("������ �߸� �Է��ϼ̽��ϴ�.");
		}
	} //main()
} //class
