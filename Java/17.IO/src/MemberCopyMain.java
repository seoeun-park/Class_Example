import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import com.hanul.study.MemberDTO;

public class MemberCopyMain {
	//member.txt 파일에서 라인단위(readLine())로 내용을 읽어서 ▶ FileReader, BufferedReader
	//라인단위의 각 항목은 tab을 구분되어 있다. ▶ split("\t");
	//MemberDTO 타입을 갖는 ArrayList<> 구조   ▶   ArrayList<MemberDTO> list;
	//membercopy2.txt 파일을 생성   ▶   FileWriter, BufferedWriter, flush()
	public static void main(String[] args) {
		try {
			//파일 입력을 위한 준비 단계 : FileReader, BufferedReader
			String inputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\member.txt";
			// → 원본 파일 위치
			FileReader fr = new FileReader(inputPath);
			// → 원본 파일
			BufferedReader br = new BufferedReader(fr);
			// → 입력 버퍼		
			
			//열려진 파일의 내용을 읽어(readLine())서 저장할 변수를 초기화
			//tab으로 split()한 후, MemberDTO 객체로 생성
			//ArrayList<MemberDTO> list 생성
			String line = null;
			MemberDTO dto = null;
			ArrayList<MemberDTO> list = new ArrayList<>();
			
			//파일을 읽고(readLine()) ArrayList<>에 저장(add())
			while ((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				dto = new MemberDTO(Integer.parseInt(sp[0]), sp[1], 
									Integer.parseInt(sp[2]), sp[3], sp[4]);
				list.add(dto);
			}//while
			
			//파일 출력을 위한 준비 단계 : FileWriter, BufferedWriter
			String outputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\membercopy2.txt";
			// → 사본 위치
			FileWriter fw = new FileWriter(outputPath);
			// → 사본 파일
			BufferedWriter bw = new BufferedWriter(fw);
			// → 출력 버퍼	
			
			//ArrayList<>의 저장된 내용을 출력
			int index = 0;		//현재 라인을 저장할 변수(인덱스)
			for (MemberDTO dto2 : list) {
				if (index < list.size() - 1) {		//현재 라인의 인덱스와 전체 라인의 인덱스를 비교 : 줄바꿈
					String data = dto2.getNum() + "\t" + dto2.getName() + "\t" + dto2.getAge() + "\t" +
								  dto2.getAddr() + "\t" + dto2.getTel() + "\n";
					bw.write(data);
					bw.flush();
					index++;
				} else {		//마지막 라인 : 줄바꿈하지 않는다.
					String data = dto2.getNum() + "\t" + dto2.getName() + "\t" + dto2.getAge() + "\t" +
							  dto2.getAddr() + "\t" + dto2.getTel();
					bw.write(data);
					bw.flush();
					System.out.println("파일 복사 완료");
				}//if
			}//for
			
			//스트림 종료
			bw.close();
			br.close();
			fw.close();
			fr.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
	}//main()
}//class
