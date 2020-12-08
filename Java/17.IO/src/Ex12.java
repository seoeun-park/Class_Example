import java.io.BufferedReader;
import java.io.FileReader;

public class Ex12 {
	//버퍼를 활용하여 파일에서 문자단위로 입출력하는 스트림
	//BufferedReader, BufferedWriter
	//readLine() 메소드를 활용하면 한 줄단위로 입력된다.
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\member.txt";	//원본위치
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			String line = null;		//초기화
			int cnt = 0;
			while ((line = br.readLine()) != null) {
				cnt++;
				System.out.println(line);
			}//while
			br.close();
			fr.close();
			System.out.println("접근 횟수 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
		
		
		
	}//main()
}//class
