public class Operator05 {
	public static void main(String[] args) {
		// �������� : ���� ���� ������ �Ǵ� �� ���ǹ��� ���� ���
		// ������ ����� true, false ��ȯ
		// ����A && ����B : ����A�� ���̰� ����B�� ���� ��� �� true ���
		// ����A || ����B : ����A �Ǵ� ����B �߿��� �ϳ��� ���� ��� �� true ���
		// && : AND����(�־��� ������ ��� ����)   �� ~~�̸鼭, ~~�̰�
		// || : OR����(�ϳ��� ����)   �� ~~�̰ų�, ~~�Ǵ�
		System.out.println(10 > 5 && 20 > 5); 		// true && true �� true
		System.out.println(10 > 5 && 5 > 20); 		// true && false �� false
		System.out.println(5 > 10 && 20 > 5); 		// false && true �� false
		System.out.println(5 > 10 && 5 > 20); 		// false && false �� false
		// Dead Code �� ���� �ڵ��� ������ �ش� code�� �ؼ��ϱ� ������ �̹� ����� ���Դٴ� �ǹ��̴�.
		
		System.out.println("======");
		
		System.out.println(10 > 5 || 20 > 5); 		// true && true �� true
		System.out.println(10 > 5 || 5 > 20); 		// true && false �� true
		System.out.println(5 > 10 || 20 > 5); 		// false && true �� true
		System.out.println(5 > 10 || 5 > 20); 		// false && false �� false

	} //main()
} //class
