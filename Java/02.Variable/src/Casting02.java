public class Casting02 {
	public static void main(String[] args) {
		// �Ʒ��� ����� ����� ����ȯ�� �߻��ϴ°�? 2��
		double sum = 3.5F + 12;
		// �� 3.5F + 12.0F : int �� float
		// �� double sum = 15.5F : float �� double
		System.out.println("���� sum�� �� : " + sum);		// ��°� : 15.5 �� double
		
		char upper = 'A';
		char lower = 'a';
		System.out.println("���� upper�� �� : " + upper);					// ��°� : A(65)
		System.out.println("���� lower�� �� : " + lower);					// ��°� : a(97)
		System.out.println("upper + lower : " + upper + lower);			// ��°� : Aa
		System.out.println("(upper + lower) : " + (upper + lower));		// ��°� : 162
		// ������ �켱������ ���� ()�� ���� ����� ���� + �����ڷ� �����ϱ� ������ �ڵ����� UpCasting
		
		// �빮��(upper)�� �ҹ��ڷ� �ٲپ ����Ͻÿ�.
		System.out.println("(char)(upper + 32) = " + (char)(upper + 32)); // ��°� : a
		
		
	} // main()
} // class
