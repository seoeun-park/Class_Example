public class Ex_do_while {
	public static void main(String[] args) {
		/*
		 �� do-while : ��ó�� �� ������
		 	�� ������ ó������ �����̴��� ���๮�� �ּ� 1���� ����ȴ�.
		 	
		 �ʱⰪ;
		 
		 do {
		 	���๮;
		 	������;
		 } while(���ǽ�);
		 
		 */
		
		// 1���� 10������ ������(doWhileSum)�� ���Ͻÿ� : do-while
		int doWhileSum = 0;
		int	i = 0;
		
		do {
			doWhileSum += i;
			i++;
		} while(i <= 10);
		
		System.out.println("do-while�� ������ : " + doWhileSum);
	} //main()
} //class
