public class Ex_static01 {
	public static void main(String[] args) {
		display1();
		//display2();	//non-static : ���� �Ұ���
		
		Ex_static01 ex01 = new Ex_static01();	//��ü ����
		ex01.display2();
		
	}//main()
	
	public static void display1() {
		System.out.println("Display1");
	}//display1()
	
	public void display2() {
		System.out.println("Display2");
	}//display2()
	
	static {
		System.out.println("�ʱ�ȭ ��");
	}//static
	
}//class

// static : ���α׷� �����ϱ� ���� ���� �޸𸮿� �Ҵ�, ���α׷� ���ᰡ �Ǹ� �Ҹ�
//			������ �������� �������� �ʴ´�. 	��  �޸� ����
//			�޸� ������ ���� ��� Project �޴��� > Clean�� Ŭ���ϸ� �޸� ������ ���ش�.
//			main �޼ҵ带 ������ �޼ҵ�� �ǵ����̸� static�� ���� �ʾƾ� �Ѵ�.
// �ʱ�ȭ �� : static { ~~~ } ��  ���� ���� ����Ǵ� ��(�ڵ�) , main �Լ����� �켱���� ������ ����
