import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import com.hanul.study.MemberDTO;

public class MemberCopyMain {
	//member.txt ���Ͽ��� ���δ���(readLine())�� ������ �о �� FileReader, BufferedReader
	//���δ����� �� �׸��� tab�� ���еǾ� �ִ�. �� split("\t");
	//MemberDTO Ÿ���� ���� ArrayList<> ����   ��   ArrayList<MemberDTO> list;
	//membercopy2.txt ������ ����   ��   FileWriter, BufferedWriter, flush()
	public static void main(String[] args) {
		try {
			//���� �Է��� ���� �غ� �ܰ� : FileReader, BufferedReader
			String inputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\member.txt";
			// �� ���� ���� ��ġ
			FileReader fr = new FileReader(inputPath);
			// �� ���� ����
			BufferedReader br = new BufferedReader(fr);
			// �� �Է� ����		
			
			//������ ������ ������ �о�(readLine())�� ������ ������ �ʱ�ȭ
			//tab���� split()�� ��, MemberDTO ��ü�� ����
			//ArrayList<MemberDTO> list ����
			String line = null;
			MemberDTO dto = null;
			ArrayList<MemberDTO> list = new ArrayList<>();
			
			//������ �а�(readLine()) ArrayList<>�� ����(add())
			while ((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				dto = new MemberDTO(Integer.parseInt(sp[0]), sp[1], 
									Integer.parseInt(sp[2]), sp[3], sp[4]);
				list.add(dto);
			}//while
			
			//���� ����� ���� �غ� �ܰ� : FileWriter, BufferedWriter
			String outputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\membercopy2.txt";
			// �� �纻 ��ġ
			FileWriter fw = new FileWriter(outputPath);
			// �� �纻 ����
			BufferedWriter bw = new BufferedWriter(fw);
			// �� ��� ����	
			
			//ArrayList<>�� ����� ������ ���
			int index = 0;		//���� ������ ������ ����(�ε���)
			for (MemberDTO dto2 : list) {
				if (index < list.size() - 1) {		//���� ������ �ε����� ��ü ������ �ε����� �� : �ٹٲ�
					String data = dto2.getNum() + "\t" + dto2.getName() + "\t" + dto2.getAge() + "\t" +
								  dto2.getAddr() + "\t" + dto2.getTel() + "\n";
					bw.write(data);
					bw.flush();
					index++;
				} else {		//������ ���� : �ٹٲ����� �ʴ´�.
					String data = dto2.getNum() + "\t" + dto2.getName() + "\t" + dto2.getAge() + "\t" +
							  dto2.getAddr() + "\t" + dto2.getTel();
					bw.write(data);
					bw.flush();
					System.out.println("���� ���� �Ϸ�");
				}//if
			}//for
			
			//��Ʈ�� ����
			bw.close();
			br.close();
			fw.close();
			fr.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
	}//main()
}//class
