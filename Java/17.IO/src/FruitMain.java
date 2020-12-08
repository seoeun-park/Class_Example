import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

import com.hanul.study.FruitDAO;
import com.hanul.study.FruitDTO;

public class FruitMain {
	//member.txt 파일에서 라인단위(readLine())로 내용을 읽어서 ▶ FileReader, BufferedReader
	//라인단위의 각 항목은 tab을 구분되어 있다. ▶ split("\t");
	//FruitDTO 타입을 갖는 ArrayList<> 구조   ▶   ArrayList<FruitDTO> list;
	//ArrayList<FruitDTO> list의 배열을 이용하여, 가격을 계산(getPrice())하고 화면에 출력(display())하시오.
	//가격의 내림차순을 정렬(priceDescSort())후 화면에 출력(display())하시오. 
	//최종 결과를 fruitResult.txt 파일로 생성   ▶   FileWriter, BufferedWriter, flush() : fileSave()
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\fruit.txt";
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
			
			//FruitDAO 생성자 메소드 및 가격계산, 화면출력, 가격내림차순 정렬, 파일 저자아 메소드 호출
			FruitDAO dao = new FruitDAO(list);
			dao.getPrice();
			dao.display();
			dao.priceDescSort();
			dao.display();
			dao.fileSave();
			
			//스트림 종료
			br.close();
			fr.close();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
	}//main()

}//class
