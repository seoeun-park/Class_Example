import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class MemberMain {
	public static void main(String[] args) {
		//ȸ������(MemberDTO)�� ArrayList<>�� �����Ͻÿ�.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("ȫ�浿", 27, "���ֽ� ���� �󼺵�", "010-1111-1111"));
		list.add(new MemberDTO("��浿", 29, "���ֽ� ���� ���̵�", "010-2222-2222"));
		list.add(new MemberDTO("���浿", 25, "���ֽ� ���� ������", "010-3333-3333"));
		
		//ArrayList<>�� ������ ��� : display() ��  com.hanul.member.MemberDAO
		MemberDAO dao = new MemberDAO();
		dao.display(list);
		
		//ArrayList<>�� ������ ������ ������������ �����ϰ� ��� 
		// : ageAscSort(), display() ��  com.hanul.member.MemberDAO
		dao.ageAscSort(list);
		dao.display(list);
		
		//ArrayList<>�� ������ �̸��� ������������ ���� �� ��� : nameDescSort(), display()
		dao.nameDescSort(list);
		dao.display(list);
		
	}//main()
	

}//class
