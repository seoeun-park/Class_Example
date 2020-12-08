import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex09 {
	// ����(�׸�, ����, ����)���� ����Ʈ ������ ������ϴ� ��Ʈ��
	// FileInputStream(�Է�), FileOutputStream(���)
	// �̹��� ������ �о �����ϴ� ���α׷�(Copy & Paste)
	// ���� �̹��� �غ� : �̹����� ������ �� IO Project�� �ٿ��ֱ� �� pic.jpg
	// ��� ������ ���� ������ ���� ������Ʈ���� �۾��� �̷������.
	// ��� ������ �� ��쿡�� ���� ��η� ǥ��
	// ���� ��� : D:\JAVA��� ���� SW ������ ����\Study_Java\workspace\17.IO\pic.jpg
	// �׷��� \�� �̽������� ������ ���ڷ� �ν��ع��� ������ ���� �� \�� �ι� �� �Է��ؾ� ��
	// D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\pic.jpg
	// ���������� ������ �Ϸ�Ǹ� ������Ʈ�� ���ΰ�ħ(���콺 ������ �� Refresh, F5)
	
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream("pic.jpg");	//��������
			// ���� ������Ʈ �ȿ� ������ �����Ƿ� ���ϸ� �Է�
			
			FileOutputStream fos = new FileOutputStream("copy.jpg");	//�纻����
			
			int data, cnt = 0;		
			while ((data = fis.read()) != -1) {		//������ ���� �� -1�� �ǹ� : End Of File ����
				cnt++;		//����Ƚ��(������ ũ��)
				System.out.println(data);
				fos.write(data);	//data���� �������� ���Ͽ� ���
			}//while
			
			//������ �ݴ� ������ �Ųٷ� �ؾ� ��
			fos.close();
			fis.close();
			System.out.println("���� Ƚ�� : " + cnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}//main()
}//class

