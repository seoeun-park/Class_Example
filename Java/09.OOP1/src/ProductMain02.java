public class ProductMain02 {
	public static void main(String[] args) {
		Product p1 = new Product();		// Product Class�� �̿��Ͽ� ��ü p1�� ����
		p1.num = 1;				// p1(�ν��Ͻ� ����)�� ������� num�� 1�� �Ҵ�
		p1.name = "��ǻ��";		// p1(or ���۷��� ����)�� ������� name�� ��ǻ�͸� �Ҵ�
		
		Product p2 = new Product();
		p2.num = 2;
		p2.name = "��Ʈ��";
		
		Product p3 = new Product();
		p3.num = 3;
		p3.name = "������";
		
		System.out.println("��ü p1�� ����");
		p1.display();
		System.out.println("===============");
		
		System.out.println("��ü p2�� ����");
		p2.display();
		System.out.println("===============");
		
		System.out.println("��ü p3�� ����");
		p3.display();
		System.out.println("===============");
	}//main()
}//class
