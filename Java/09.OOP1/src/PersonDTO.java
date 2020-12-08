public class PersonDTO {
	// ��� ���� ���� : �̸�(name), ����(age), Ű(height), ������(weight), �ּ�(addr), ��ȭ��ȣ(tel)
	// �� ���� ����
	private String name;
	private int age;
	private float height;
	private float weight;
	private String addr;
	private String tel;
	
	// �⺻ ������ �޼ҵ�
	public PersonDTO() {}

	// ������ �޼ҵ� �ʱ�ȭ : �ڵ��ϼ�
	public PersonDTO(String name, int age, float height, float weight, String addr, String tel) {
		super();
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.addr = addr;
		this.tel = tel;
	}
	
	// Getters & Setters �޼ҵ� : �ڵ��ϼ�
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
