import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex15 {
	//��������� ��������(����)�� ��ȣȭ�Ͽ� game.data ���Ͽ� ����
	//��ȣȭ : �⺻ ������ Ÿ��, String Ÿ���� ������ byte ���� �ڷ�� ��ȯ
	public static void main(String[] args) {
		try {
			String id = "hanul";
			String user = "�ѿ�";
			int level = 5;
			int money = 123450;
			double jumsu = 4567.89;
			
			FileOutputStream fos = new FileOutputStream("game.data");
			DataOutputStream dos = new DataOutputStream(fos);
			
			dos.writeUTF(id);
			dos.writeUTF(user);
			dos.writeInt(level);
			dos.writeInt(money);
			dos.writeDouble(jumsu);
			
			dos.close();
			fos.close();
			System.out.println("game.txt ������ �����Ǿ����ϴ�!");
			
			FileInputStream fis = new FileInputStream("game.data");
			DataInputStream dis = new DataInputStream(fis);
			
			String iid = dis.readUTF();
			String uuser = dis.readUTF();
			int llevel = dis.readInt();
			int mmoney = dis.readInt();
			double jjumsu = dis.readDouble();
			
			dis.close();
			fis.close();
			
			System.out.println("id : " + iid);
			System.out.println("user : " + uuser);
			System.out.println("level : " + llevel);
			System.out.println("money : " + mmoney);
			System.out.println("jumsu : " + jjumsu);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
