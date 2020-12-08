import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex10 {
	//버퍼를 이용한 이미지 파일 복사 : 입출력의 효율화(속도 향상)
	//BufferedInputStream, BufferedOutputStream
	//InputStream → FileInputStream → BufferedInputStream
	//OutputStream → FileOutputStream → BufferedOutputStream
	//버퍼의 기본 크기 : 1024 Byte
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\pic.jpg";		//원본위치
			String outputPath = "D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\copy2.jpg";	//사본위치
			
			FileInputStream fis = new FileInputStream(inputPath);		//원본파일
			FileOutputStream fos = new FileOutputStream(outputPath);	//사본파일
			
			BufferedInputStream bis = new BufferedInputStream(fis);		//입력 버퍼
			BufferedOutputStream bos = new BufferedOutputStream(fos);	//출력 버퍼
			
			int data, cnt = 0;
			while ((data = bis.read()) != -1) {
					cnt++;
					System.out.println(data);
					bos.write(data);
			}//while
			System.out.println("접근 횟수 : " + cnt);
			
			// 원본 : 98,388
			//copy2 : 98,304
			// 마지막 버퍼에는 기본 크기보다 작은 용량이 버퍼에 남아있어 전송이 되지 않는다.
			// 마지막 버퍼에 남아 있는 내용을 강제로 전송시킨 후,(flush()) 종료해야 함
			
			bos.flush();			//마지막 버퍼에 남아있는 내용을 강제 전송 후 출력
			bos.close();
			bis.close();
			//fos.close();			//bos를 종료하면 자동으로 fos도 종료
			//fis.close();			//bis를 종료하면 자동으로 fis도 종료
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}//main()
}//class
