import java.io.BufferedReader;
import java.io.FileReader;

public class Ex12 {
	//���۸� Ȱ���Ͽ� ���Ͽ��� ���ڴ����� ������ϴ� ��Ʈ��
	//BufferedReader, BufferedWriter
	//readLine() �޼ҵ带 Ȱ���ϸ� �� �ٴ����� �Էµȴ�.
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\member.txt";	//������ġ
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			String line = null;		//�ʱ�ȭ
			int cnt = 0;
			while ((line = br.readLine()) != null) {
				cnt++;
				System.out.println(line);
			}//while
			br.close();
			fr.close();
			System.out.println("���� Ƚ�� : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
		
		
	}//main()
}//class
