
public class PersonMain {
	// 3���� ���������� ������ ��ü�迭(person[])�� ���� �� �����ϰ� ���� �Ҵ�
	// "ȫ�浿", 27, 175.5cm, 75kg, "���ֽ� ���� �󼺵�", "010-1111-1111"
	// "���浿", 33, 185cm, 65.5kg, "���ֽ� ���� ������", "010-2222-2222"
	// "������", 25, 165cm, 48.5kg, "����� ������ û�㵿", "010-3333-3333"
	// ����� ��ü �迭�� ������ ��� : display() ȣ��
	public static void main(String[] args) {
		PersonDTO[] person = new PersonDTO[3];
		
		person[0] = new PersonDTO("ȫ�浿", 27, 175.5f, 75, "���ֽ� ���� �󼺵�", "010-1111-1111");
		person[1] = new PersonDTO("���浿", 33, 185, 65.5f, "���ֽ� ���� ������", "010-2222-2222");
		person[2] = new PersonDTO("������", 25, 165, 48.5f, "����� ������ û�㵿", "010-3333-3333");
		
		// ��ü�迭�� ���� ��� : display() ȣ��
		PersonDAO dao = new PersonDAO();
		dao.display(person);
		
		dao.ageAscSort(person);		// ������ �������� ����
		dao.display(person);
		
		dao.heightDescSort(person);	// Ű�� �������� ����
		dao.display(person);
		
		dao.nameAscSort(person);	// ������ �������� ����
		dao.display(person);
	}//main()
}//class
