import java.io.FileReader;

public class Ex11 {
	//파일(텍스트 문서, 유니코드)에서 문자 단위로 입출력하는 스트림
	//FileReader, FileWriter
	//한글이 포함된 파일(member.txt)데이터를 읽어서 화면에 출력
	//member.txt 파일 생성 : IO Project > 마우스 오른쪽 > New > file > 파일명.확장자
	//내용 작성 시 항목간 구분은 반드시 Tab키를 활용한다.
	//이와 같은 경우는 한 글자씩(Unicode) 접근하게 되므로 내용이 많으면 많을 수록 속도가 느려진다. → 버퍼 활용
	public static void main(String[] args) {
		// txt 파일에 있는 모든 내용을 한글자씩 접근
		try {
			FileReader fr = new FileReader("member.txt");	//원본파일
			int data, cnt = 0;
			while ((data = fr.read()) != -1) {
				cnt++;
				System.out.println((char)data);
			}
			fr.close();
			System.out.println("접근 횟수 : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class
