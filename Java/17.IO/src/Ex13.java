import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex13 {
	//member.txt 파일에서 라인단위(readLine())로 내용을 읽어서
	//membercopy.txt 파일에 저장(출력)
	//파일 복사 : member.txt → membercopy.txt
	public static void main(String[] args) {
		try {
			//1.파일 입력을 위한 준비 단계 : FileReader, BufferedReader
			String inputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\member.txt";
			// → 원본 파일 위치
			FileReader fr = new FileReader(inputPath);
			// → 원본 파일
			BufferedReader br = new BufferedReader(fr);
			// → 입력 버퍼
			
			
			//2.파일 출력을 위한 준비 단계 : FileWriter, BufferedWriter
			String outputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\membercopy.txt";
			// → 사본 위치
			FileWriter fw = new FileWriter(outputPath);
			// → 사본 파일
			BufferedWriter bw = new BufferedWriter(fw);
			// → 출력 버퍼
			
			//3.열려진 파일(member.txt)의 내용을 읽어서 저장할 변수를 초기화
			String line = null;
			
			//4.파일의 내용을 라인단위(readLine())로 읽고 출력(write())하는 로직
			while ((line = br.readLine()) != null) {
				//sysout 대신 출력
				bw.write(line);
				//bw.write("\n");	// 줄마다 개행 처리
				bw.newLine();		// 줄마다 개행 처리
			}//while
			
			if (line == null) {
				System.out.println("membercopy.txt 파일이 복사되었습니다.");
			}//if
			
			//5.마지막 버퍼의 내용을 강제 전송(flush())후 종료(close)
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
