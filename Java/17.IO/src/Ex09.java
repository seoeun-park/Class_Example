import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex09 {
	// 파일(그림, 영상, 음원)에서 바이트 단위로 입출력하는 스트림
	// FileInputStream(입력), FileOutputStream(출력)
	// 이미지 파일을 읽어서 복사하는 프로그램(Copy & Paste)
	// 원본 이미지 준비 : 이미지를 복사한 후 IO Project에 붙여넣기 → pic.jpg
	// 경로 설정을 하지 않으면 현재 프로젝트에서 작업이 이루어진다.
	// 경로 설정을 할 경우에는 절대 경로로 표기
	// 절대 경로 : D:\JAVA기반 응용 SW 개발자 과정\Study_Java\workspace\17.IO\pic.jpg
	// 그러나 \를 이스케이프 시퀀스 문자로 인식해버려 오류가 생김 → \를 두번 씩 입력해야 함
	// D:\\JAVA기반 응용 SW 개발자 과정\\Study_Java\\workspace\\17.IO\\pic.jpg
	// 최종적으로 동작이 완료되면 프로젝트를 새로고침(마우스 오른쪽 → Refresh, F5)
	
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream("pic.jpg");	//원본파일
			// 같은 프로젝트 안에 파일이 있으므로 파일명만 입력
			
			FileOutputStream fos = new FileOutputStream("copy.jpg");	//사본파일
			
			int data, cnt = 0;		
			while ((data = fis.read()) != -1) {		//파일을 읽을 때 -1의 의미 : End Of File 종료
				cnt++;		//접근횟수(파일의 크기)
				System.out.println(data);
				fos.write(data);	//data값을 기준으로 파일에 출력
			}//while
			
			//파일을 닫는 순서는 거꾸로 해야 함
			fos.close();
			fis.close();
			System.out.println("접근 횟수 : " + cnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}//main()
}//class

