// ���� ����(���, ����)�� �����ϴ� Class �� Method ����
public class BookDAO {
	// ��� �޼ҵ�
	public void display(BookDTO[] book) {
		//System.out.println(Arrays.toString(book));	// ��ü �迭 ���� BookDTO ��ü�� �����ϴ� �ؽ��ڵ� ��
		for (int i = 0; i < book.length; i++) {
			System.out.println("���� : " + book[i].getTitle());
			System.out.println("���� : " + book[i].getPrice());
			System.out.println("���ǻ� : " + book[i].getCom());
			System.out.println("���� : " + book[i].getAuth());
			System.out.println("==============");
		}
	}//display()
}//class
