public class PersonDTO {
	// 멤버 변수 선언 : 이름(name), 나이(age), 키(height), 몸무게(weight), 주소(addr), 전화번호(tel)
	// ▶ 정보 은닉
	private String name;
	private int age;
	private float height;
	private float weight;
	private String addr;
	private String tel;
	
	// 기본 생성자 메소드
	public PersonDTO() {}

	// 생성자 메소드 초기화 : 자동완성
	public PersonDTO(String name, int age, float height, float weight, String addr, String tel) {
		super();
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.addr = addr;
		this.tel = tel;
	}
	
	// Getters & Setters 메소드 : 자동완성
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
}//class
