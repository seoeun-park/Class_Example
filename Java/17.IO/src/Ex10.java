import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex10 {
	//���۸� �̿��� �̹��� ���� ���� : ������� ȿ��ȭ(�ӵ� ���)
	//BufferedInputStream, BufferedOutputStream
	//InputStream �� FileInputStream �� BufferedInputStream
	//OutputStream �� FileOutputStream �� BufferedOutputStream
	//������ �⺻ ũ�� : 1024 Byte
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\pic.jpg";		//������ġ
			String outputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\copy2.jpg";	//�纻��ġ
			
			FileInputStream fis = new FileInputStream(inputPath);		//��������
			FileOutputStream fos = new FileOutputStream(outputPath);	//�纻����
			
			BufferedInputStream bis = new BufferedInputStream(fis);		//�Է� ����
			BufferedOutputStream bos = new BufferedOutputStream(fos);	//��� ����
			
			int data, cnt = 0;
			while ((data = bis.read()) != -1) {
					cnt++;
					System.out.println(data);
					bos.write(data);
			}//while
			System.out.println("���� Ƚ�� : " + cnt);
			
			// ���� : 98,388
			//copy2 : 98,304
			// ������ ���ۿ��� �⺻ ũ�⺸�� ���� �뷮�� ���ۿ� �����־� ������ ���� �ʴ´�.
			// ������ ���ۿ� ���� �ִ� ������ ������ ���۽�Ų ��,(flush()) �����ؾ� ��
			
			bos.flush();			//������ ���ۿ� �����ִ� ������ ���� ���� �� ���
			bos.close();
			bis.close();
			//fos.close();			//bos�� �����ϸ� �ڵ����� fos�� ����
			//fis.close();			//bis�� �����ϸ� �ڵ����� fis�� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
