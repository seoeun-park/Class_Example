import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

import com.hanul.study.FruitDAO;
import com.hanul.study.FruitDTO;

public class FruitMain {
	//member.txt ���Ͽ��� ���δ���(readLine())�� ������ �о �� FileReader, BufferedReader
	//���δ����� �� �׸��� tab�� ���еǾ� �ִ�. �� split("\t");
	//FruitDTO Ÿ���� ���� ArrayList<> ����   ��   ArrayList<FruitDTO> list;
	//ArrayList<FruitDTO> list�� �迭�� �̿��Ͽ�, ������ ���(getPrice())�ϰ� ȭ�鿡 ���(display())�Ͻÿ�.
	//������ ���������� ����(priceDescSort())�� ȭ�鿡 ���(display())�Ͻÿ�. 
	//���� ����� fruitResult.txt ���Ϸ� ����   ��   FileWriter, BufferedWriter, flush() : fileSave()
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\JAVA��� ���� SW ������ ����\\Study_Java\\workspace\\17.IO\\fruit.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			String line = null;
			FruitDTO dto = null;
			ArrayList<FruitDTO> list = new ArrayList<>();
			
			while ((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				dto = new FruitDTO(sp[0], Integer.parseInt(sp[1]), Integer.parseInt(sp[2]));
				list.add(dto);
			}//while
			
			//FruitDAO ������ �޼ҵ� �� ���ݰ��, ȭ�����, ���ݳ������� ����, ���� ���ھ� �޼ҵ� ȣ��
			FruitDAO dao = new FruitDAO(list);
			dao.getPrice();
			dao.display();
			dao.priceDescSort();
			dao.display();
			dao.fileSave();
			
			//��Ʈ�� ����
			br.close();
			fr.close();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
	}//main()

}//class
