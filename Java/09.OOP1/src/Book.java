public class Book {
	// ��� ���� : ����(title), ����(price), ���ǻ�(com), ����(auth) �� DTO Class
	String title, com, auth;
	int price;
	
	// ��� �޼ҵ� : display() �� DAO Class
	public void display() {
		System.out.println("���� : " + title);
		System.out.println("���� : " + price);
		System.out.println("���ǻ� : " + com);
		System.out.println("���� : " + auth);
		System.out.println();
	}
}
