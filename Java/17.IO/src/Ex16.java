import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.hanul.study.MemberDTO;

public class Ex16 {
	// ��ü(��������)�� byte������ ��ȯ�Ͽ� ������ϴ� ��Ʈ��
	// ObjectInputStream, ObjectOutputStream
	// ��ü�� ����ȭ : ��ü�� ������ �ִ� ����������� byte������ �ٲ�� ��
	// ��ü�� ������ȭ : ����ȭ�� ��ü�� �ٽ� ������ ���·� �����Ǵ� ��
	// ��ü ����(DTO Class ����) : implements Serializable ��  ��ü�� ����ȭ 
	
	public static void main(String[] args) {
		
		// ����Ʈ ������ ȣ�� : setter �޼��带 �̿��� ���� ���� �Ҵ����ֱ� ����
		MemberDTO dto = new MemberDTO();
		
		dto.setNum(777);
		dto.setName("�ѿ�");
		dto.setAge(26);
		dto.setAddr("���ֽ�");
		dto.setTel("062-362-7797");
		//MemberDTO dto = new MemberDTO(777, "�ѿ�", 26, "���ֽ�", "010-362-7797");
		
		//���� ȸ�� 1���� ������ ���Ͽ� �����Ͻÿ�. : member.ser
		try {
			FileOutputStream fos = new FileOutputStream("member.ser");
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(dto);		//��ü�� ����ȭ
			oos.close();
			fos.close();
			System.out.println("member.ser ������ �����Ǿ����ϴ�.");
			
			//member.ser ������ ������ �о ȭ�鿡 ����Ͻÿ�.
			FileInputStream fis = new FileInputStream("member.ser");
			ObjectInputStream ois = new ObjectInputStream(fis);
			dto = (MemberDTO)ois.readObject();		//��ü�� ������ȭ
			// �� ois.readObject()�� �ڷ����� Object�̹Ƿ� Ÿ�� ��ȯ�� ���Ѿ� �Ѵ�.
			ois.close();
			fis.close();
			
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class
