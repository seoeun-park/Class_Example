public class Question01 {
	private int radius;
	
	// 디폴트 생성자 메소드
	public Question01() {}
	
	// 생성자 메소드 초기화
	public Question01(int radius) {
		super();
		this.radius = radius;
	}

	// Getters & Setters 메소드
	public int getRadius() {
		return radius;
	}
	
	public double getArea() {
		return radius * radius * 3.14;
	}//getArea()


}
