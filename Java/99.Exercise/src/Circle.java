public class Circle {
	private int radius;
	
	public Circle(int radius) {
		super();
		this.radius = radius;
	}

	public double getArea() {
		return radius * radius * 3.14;
	}
}
