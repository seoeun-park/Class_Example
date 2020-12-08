import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex14 {
	//�⺻ ������ Ÿ��(PDT), ���ڿ�(String)�� byte������ ��ȯ�Ͽ� �����
	//DataInputStream, DataOutputStream ��  ��ȣȭ
	//����ڰ� �Է��� ������ ���Ϸ� ���� : FileOutputStream �� DataOutputStream
	//���Ͽ� ����� ������ �о ȭ�鿡 ��� : FileInputStream �� DataInputStream
	public static void main(String[] args) {
		try {
			int i = 12345;
			double d = 3.14;
			String s = "ȫ�浿";
			
			FileOutputStream fos = new FileOutputStream("data.txt");
			// byte������ ��ȣȭ�ϱ� ������ String �ڷ��� ���� �޾Ƶ� FileOutputStream�� ����Ѵ�.
			DataOutputStream dos = new DataOutputStream(fos);
			dos.writeInt(i);			//int �� byte
			dos.writeDouble(d);			//double �� byte
			dos.writeUTF(s);			//String �� byte
			
			dos.close();
			fos.close();
			System.out.println("data.txt ������ �����Ǿ����ϴ�.");
			
			FileInputStream fis = new FileInputStream("data.txt");
			DataInputStream dis = new DataInputStream(fis);
			int ii = dis.readInt();			//byte �� int
			double dd = dis.readDouble();	//byte �� double
			String ss = dis.readUTF();		//byte �� String
			
			dis.close();
			fis.close();
			
			System.out.println(ii);
			System.out.println(dd);
			System.out.println(ss);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class

/*
�۽�(���)----------------------����------------------------>����(�Է�)
    ��						 ��ȣ��						     �� 
  		          ��ȣȭ                        key          ��ȣȭ
                             = ��ĪŰ(���Ű) : DES
                            != ���ĪŰ(����Ű) : RSA
                            
�ڹ��� ��ȣȭ : ��µǴ� ������ ����(��)�� Byte�� �ڷ�� ��ȯ ����(��ȣ��)                            
                             
 */