public class ProductMain01 {
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
		System.out.println("num : " + p1.num);
		System.out.println("name : " + p1.name);
		System.out.println("===============");
		
		System.out.println("��ü p2�� ����");
		System.out.println("num : " + p2.num);
		System.out.println("name : " + p2.name);
		System.out.println("===============");
		
		System.out.println("��ü p3�� ����");
		System.out.println("num : " + p3.num);
		System.out.println("name : " + p3.name);
		System.out.println("===============");
		
	}//main()
}//class
