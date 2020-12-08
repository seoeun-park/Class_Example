// ��������(�������, �ʵ�)�� �����ϴ� Class
// ���� �ٸ� Ÿ���� �����͸� �ϳ��� ���� ���� ����
public class BookDTO {
	// �� �������(�ʵ�)�� ���� �� ���� ����(ĸ��ȭ) : private
	private String title;	// ����
	private int price;		// ����
	private String com;		// ���ǻ�	
	private String auth;	// ����
	
	//------------------------------------------------------
	// �� �⺻ ������ �޼ҵ�(Default Constructor Method) : ��ü�� ������ �� ȣ��
	// �⺻ ��Ģ : Ŭ������ �̸��� �޼ҵ��� �̸��� �����ؾ��Ѵ�, ����Ÿ���� �������� �ʴ´�.
	// 			���޵Ǵ� �Ű������� ������(body{})�� ���� : �� ���� �� �������� : JVM �ڵ�����
	public BookDTO() {}
	
	//------------------------------------------------------
	// �� ����� ��������� ���� �Ҵ��ϱ� ���� , ���޵Ǵ� �Ű������� �ʱ�ȭ�ϴ� ������ �޼ҵ� ����
	// �����ϴ� ��� : 
	// 		Eclipse ��� �޴��ٿ� Source �� �� Generate Constructor using field... 
	// 		���콺 ������ ��ư �� Source ��ư �� Generate Constructor using field...
	public BookDTO(String title, int price, String com, String auth) {
		// �ڹٴ� ��� Ŭ������ super Ŭ�����κ��� ��ӹް� �Ǿ��ִ�.
		super();			// �θ�(����) Ŭ���� : JAVA�� ��� Ŭ������ Object Class ������ ���
		
		this.title = title;		// �Ű������� ��������� �����ϱ� ���� ������� �տ� this Ű���带 �޾��ش�.
		this.price = price;
		this.com = com;
		this.auth = auth;
	}
	
	//------------------------------------------------------
	// �� �Է�(setter), ���(getter) �޼ҵ� ���� : ��������� ����
	// �����ϴ� ��� : 
	// 		���콺 ������ ��ư �� Source ��ư �� Generate getters and setters...
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCom() {
		return com;
	}

	public void setCom(String com) {
		this.com = com;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	// �� DTO VS VO
	//	- VO�� �Ű������� ���� ������ ���� �����Ҽ��� ���� ������ getter �޼ҵ常 �ְ� setter �޼ҵ�� �������� ����
	//	- ��, ��� ������ �ʱ�ȭ�ϴ� ������ �޼ҵ嵵 �ʿ����� �ʴ�.
	
}//class
