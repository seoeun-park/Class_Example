public class StudentMain {
	public static void main(String[] args) {
		//Student Class ��ü�� �����ϰ� ��(�̸�, ����, ����, ����)�� �Ҵ�  �� ��� ����
		// �������(getSum()), ��հ��(getAvg()), ����� ���(display()) �� ��� �޼ҵ�
		Student s1 = new Student();
		s1.name = "ȫ�浿";
		s1.kor = 95;
		s1.eng = 65;
		s1.mat = 100;
		s1.display();
		
		Student s2 = new Student();
		s2.name = "�ڹ���";
		s2.kor = 65;
		s2.eng = 95;
		s2.mat = 91;
		s2.display();
	}//main()
}//class
