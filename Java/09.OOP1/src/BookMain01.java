public class BookMain01 {
	public static void main(String[] args) {
		// JAVA, 24000, �Ѻ��̵��, �ſ��
		// View, 28000, ���̵��, ������
		// DB, 5000, �ѿ�, ȫ�浿
		Book b1 = new Book();	// b1 : �ν��Ͻ�(instance) ����, ���۷���(reference) ����
		b1.title = "JAVA";
		b1.price = 24000;
		b1.com = "�Ѻ��̵��";
		b1.auth = "�ſ��";
		b1.display();
		
		Book b2 = new Book();
		b2.title = "View";
		b2.price = 28000;
		b2.com = "���̵��";
		b2.auth = "������";
		b2.display();
		
		Book b3 = new Book();
		b3.title = "DB";
		b3.price = 5000;
		b3.com = "�ѿ�";
		b3.auth = "ȫ�浿";
		b3.display();

	}//main()
}//class
