import com.hanul.book.BookDAO;
import com.hanul.book.BookDTO;	// ��Ű���� �ٸ� ��

public class BookMain {
	public static void main(String[] args) {
		// å 3���� ������ ������ ��ü�迭(book[])�� ���� �� �����ϰ� �ʱ�ȭ
		BookDTO[] book = new BookDTO[3];
		
		book[0] = new BookDTO("JAVA", "�ſ��", "�Ѻ�", 24000, 21);
		book[1] = new BookDTO("View", "������", "���", 20000, 23);
		book[2] = new BookDTO("DB", "ȫ�浿", "�ѿ�", 5000, 25);
		
		// ���ݰ��(getPrice()), ���(display()) �޼ҵ� ȣ�� �� BookDAO.java
		// BookDAO ��ü ���� �� ��ü�迭(book[])�� �Ű������� ��������.
		BookDAO dao = new BookDAO(book);
		dao.getPrice();
		dao.display();
				
	}//main()
}//class
