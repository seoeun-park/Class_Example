import java.util.ArrayList;

import com.hanul.member.MemberDTO;

public class ForEachMain01 {
	public static void main(String[] args) {
		//ȸ������(MemberDTO)�� ArrayList<>�� �����Ͻÿ�.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("ȫ�浿", 27, "���ֱ����� ���� �󼺵�", "010-1111-1111"));
		list.add(new MemberDTO("��浿", 29, "���ֱ����� ���� ���̵�", "010-2222-2222"));
		list.add(new MemberDTO("���浿", 25, "���ֱ����� ���� ������", "010-3333-3333"));
		
		//ArrayList<>�� ������ ����Ͻÿ� : for_1
		for (int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i).getName() + "\t");
			System.out.print(list.get(i).getAge() + "\t");
			System.out.print(list.get(i).getAddr() + "\t");
			System.out.print(list.get(i).getTel() + "\n");
		}
		
		System.out.println("=============================================");
		
		//ArrayList<>�� ������ ����Ͻÿ� : for_2
		for (int i = 0; i < list.size(); i++) {
			MemberDTO dto = list.get(i);
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		
		System.out.println("=============================================");
		
		//ArrayList<>�� ������ ����Ͻÿ� : forEach �� ���� for��
		// for(ElementType �ĺ��� : �迭��) { �ڵ� ���� }
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		
		System.out.println("=============================================");
		
	}//main()
}//class
