public class Question01 {
	private int radius;
	
	// ����Ʈ ������ �޼ҵ�
	public Question01() {}
	
	// ������ �޼ҵ� �ʱ�ȭ
	public Question01(int radius) {
		super();
		this.radius = radius;
	}

	// Getters & Setters �޼ҵ�
	public int getRadius() {
		return radius;
	}
	
	public double getArea() {
		return radius * radius * 3.14;
	}//getArea()


}
