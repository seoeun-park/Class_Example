import com.hanul.student.StudentDAO;
import com.hanul.student.StudentDTO;

public class StudentMain {
	// 3���� ���������� ������ ��ü�迭(student[])�� ���� �� �����ϰ� �ʱ�ȭ
	// ����, ��հ��(getSumAvg()), ��� �������� ����(avgDescSort()), ���(display())
	// ���� �������� ����(nameAscSort()), ���(display())
	public static void main(String[] args) {
		StudentDTO[] student = new StudentDTO[3];
		
		student[0] = new StudentDTO("ȫ�浿", "2020001", "�İ���", 95.4f, 90.3f);
		student[1] = new StudentDTO("��浿", "2020002", "�����", 80.7f, 85.6f);
		student[2] = new StudentDTO("���浿", "2020003", "�����", 85f, 97.8f);
		
		StudentDAO dao = new StudentDAO(student);
		dao.getSumAvg();
		dao.avgDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	}//main()
}//class
