import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex07 {
	public static void main(String[] args) {
		//Ű���忡�� �ѱ� ���� ���ڸ� �Է¹޾� ��� : ����(Buffer)�� Ȱ��
		InputStream is = System.in;							//����Ʈ ��Ʈ��
		InputStreamReader isr = new InputStreamReader(is);	//���� ��Ʈ��	
		//InputStreamReader isr = new InputStreamReader(System.in);
		
		BufferedReader br = new BufferedReader(isr);		//���� Ȱ��
		//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("�ѱ� ���� ���ڸ� �Է��ϼ��� : ");
		try {
			String msg = br.readLine();		
			System.out.println("�Է��Ͻ� ���ڴ� " + msg + "�Դϴ�.");
			// readLine() : Enter�ձ����� ��� ���ڸ� �ѹ��� �Է�
			// readLine()�� ��ȯ�� : String
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class

/*
�� ����(Buffer)�� �ʿ伺
- �ֱ����ġ(DRAM)�� ����� ��ġ�� �ӵ� ���̸� ��������ִ� ������ �����Ѵ�.

- �Ϲ����� ������� ���� ���ڸ� �Է��Ѵ� �ϴ��� ���� ó���� ���� �� ���ھ� ����µȴ�.
- �Էµ� ������ ������ŭ ������ �̷������. ��  �ӵ� ������ ����
- �̿� ���� ��ȿ������ �����ϰ��� ���� ���ڸ� �Է��Ѵ� �ϴ��� ����(Buffer)�� �̿��Ͽ�
- �Է��� ���ڸ� �ѹ��� ������� �� �ֵ��� �������ش�.
- ������ �⺻ ũ�� : 1024 Byte
- ���� ��� ��� : BufferedReader Class ��ü ���� �� readLine() �޼ҵ� Ȱ��

 */
