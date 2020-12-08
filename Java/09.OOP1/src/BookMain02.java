public class BookMain02 {
	public static void main(String[] args) {
		// ���� ����(BookDTO_java)�� ������ ��ü �迭(book[])
		BookDTO[] book;			// ��ü �迭 ����
		
		// 3���� ���� ������ ����� ��ü �迭(book[])�� ����
		book = new BookDTO[3];
		// BookDTO[] book1 = new BookDTO[3];	// ��ü �迭�� ���� �� ����
		
		// 1) BookDTO.java�� �ʱ�ȭ�� ������ �޼ҵ带 �̿��Ͽ� ���������� ����(��)�� �Է�
		book[0] = new BookDTO("JAVA", 24000, "�Ѻ��̵��", "�ſ��");
		book[1] = new BookDTO("View", 28000, "���̵��", "������");
		
		// 2) �⺻(default) ������ �޼ҵ带 �̿��Ͽ� ���� �Է�
		BookDTO dto = new BookDTO();
		dto.setTitle("DB");
		dto.setPrice(5000);
		dto.setCom("�ѿ�");
		dto.setAuth("�ѿ�");
		book[2] = dto;
		
		// ��������(book[])�� ������ ��� : BookDAO.java �� display() �޼ҵ� ȣ��
		BookDAO dao = new BookDAO();		// �⺻ ������ �޼ҵ� : ���� ������ �ʾƵ� �ڵ����� ����
		dao.display(book);
		
	}//main()
}//class
