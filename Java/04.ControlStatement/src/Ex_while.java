public class Ex_while {
	public static void main(String[] args) {
		/*
		   ��  while : �ݺ�Ƚ���� �� ��� ���(������ �� ��ó��)
		   
		   �ʱⰪ;
		   
		 while (���ǽ�) {
		   	���ǽ��� ���� �� ����Ǵ� ����(���๮);
		   	������;
		 }
		 		 
		*/
		
		// 1���� 10������ ������(forSum)�� ���Ͻÿ� : for
		
		int forSum = 0;
		for (int i = 1; i <= 10; i++) {
			forSum += i;
		}
		System.out.println("for ������ : " + forSum);
		
		// 1���� 10������ ������(whileSum)�� ���Ͻÿ� : while
		
		int whileSum = 0;
		int i = 1;
		while(i <= 10) {
			whileSum += i;
			i++;
		}
		System.out.println("while ������ : " + whileSum);
	
	} //main()
} //class
