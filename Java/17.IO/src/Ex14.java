import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex14 {
	//기본 데이터 타입(PDT), 문자열(String)을 byte형으로 변환하여 입출력
	//DataInputStream, DataOutputStream ▶  암호화
	//사용자가 입력한 내용을 파일로 저장 : FileOutputStream → DataOutputStream
	//파일에 저장된 내용을 읽어서 화면에 출력 : FileInputStream → DataInputStream
	public static void main(String[] args) {
		try {
			int i = 12345;
			double d = 3.14;
			String s = "홍길동";
			
			FileOutputStream fos = new FileOutputStream("data.txt");
			// byte형으로 암호화하기 때문에 String 자료형 값을 받아도 FileOutputStream을 사용한다.
			DataOutputStream dos = new DataOutputStream(fos);
			dos.writeInt(i);			//int → byte
			dos.writeDouble(d);			//double → byte
			dos.writeUTF(s);			//String → byte
			
			dos.close();
			fos.close();
			System.out.println("data.txt 파일이 생성되었습니다.");
			
			FileInputStream fis = new FileInputStream("data.txt");
			DataInputStream dis = new DataInputStream(fis);
			int ii = dis.readInt();			//byte → int
			double dd = dis.readDouble();	//byte → double
			String ss = dis.readUTF();		//byte → String
			
			dis.close();
			fis.close();
			
			System.out.println(ii);
			System.out.println(dd);
			System.out.println(ss);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//main()
}//class

/*
송신(출력)----------------------전송------------------------>수신(입력)
    평문						 암호문						     평문 
  		          암호화                        key          복호화
                             = 대칭키(비밀키) : DES
                            != 비대칭키(공개키) : RSA
                            
자바의 암호화 : 출력되는 문서의 내용(평문)을 Byte형 자료로 변환 저장(암호문)                            
                             
 */