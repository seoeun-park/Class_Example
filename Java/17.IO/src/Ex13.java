import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex13 {
	//member.txt ���Ͽ��� ���δ���(readLine())�� ������ �о
	//membercopy.txt ���Ͽ� ����(���)
	//���� ���� : member.txt �� membercopy.txt
	public static void main(String[] args) {
		try {
			//1.���� �Է��� ���� �غ� �ܰ� : FileReader, BufferedReader
			String inputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\member.txt";
			// �� ���� ���� ��ġ
			FileReader fr = new FileReader(inputPath);
			// �� ���� ����
			BufferedReader br = new BufferedReader(fr);
			// �� �Է� ����
			
			
			//2.���� ����� ���� �غ� �ܰ� : FileWriter, BufferedWriter
			String outputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\membercopy.txt";
			// �� �纻 ��ġ
			FileWriter fw = new FileWriter(outputPath);
			// �� �纻 ����
			BufferedWriter bw = new BufferedWriter(fw);
			// �� ��� ����
			
			//3.������ ����(member.txt)�� ������ �о ������ ������ �ʱ�ȭ
			String line = null;
			
			//4.������ ������ ���δ���(readLine())�� �а� ���(write())�ϴ� ����
			while ((line = br.readLine()) != null) {
				//sysout ��� ���
				bw.write(line);
				//bw.write("\n");	// �ٸ��� ���� ó��
				bw.newLine();		// �ٸ��� ���� ó��
			}//while
			
			if (line == null) {
				System.out.println("membercopy.txt ������ ����Ǿ����ϴ�.");
			}//if
			
			//5.������ ������ ������ ���� ����(flush())�� ����(close)
			bw.flush();
			bw.close();
			br.close();
			fw.close();
			fr.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
	}//main()
}//class
