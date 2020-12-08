import java.io.FileReader;

public class Ex11 {
	//����(�ؽ�Ʈ ����, �����ڵ�)���� ���� ������ ������ϴ� ��Ʈ��
	//FileReader, FileWriter
	//�ѱ��� ���Ե� ����(member.txt)�����͸� �о ȭ�鿡 ���
	//member.txt ���� ���� : IO Project > ���콺 ������ > New > file > ���ϸ�.Ȯ����
	//���� �ۼ� �� �׸� ������ �ݵ�� TabŰ�� Ȱ���Ѵ�.
	//�̿� ���� ���� �� ���ھ�(Unicode) �����ϰ� �ǹǷ� ������ ������ ���� ���� �ӵ��� ��������. �� ���� Ȱ��
	public static void main(String[] args) {
		// txt ���Ͽ� �ִ� ��� ������ �ѱ��ھ� ����
		try {
			FileReader fr = new FileReader("member.txt");	//��������
			int data, cnt = 0;
			while ((data = fr.read()) != -1) {
				cnt++;
				System.out.println((char)data);
			}
			fr.close();
			System.out.println("���� Ƚ�� : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class
