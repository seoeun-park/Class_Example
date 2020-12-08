package common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonService {
	
	//이메일 전송
	public void sendEmail(String email, String name, HttpSession session) {
		//1.일반 메일
		//simpleSend(email, name);
		
		//2.첨부 파일이 있는 메일
		//attachSend(email, name, session);
		
		//3.HTML 형식의 내용을 갖는 메일
		htmlSend(email, name, session);
		
	}
	
	//1. 일반적인 메일 전송
	private void simpleSend(String email, String name) {
		SimpleEmail mail = new SimpleEmail();
		//메일 작성할 서버 지정
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);	//메일 전송되는 과정 확인
		
		//로그인하기 위한 아이디/비번 지정 : 사이트의 관리자의 메일 아이디와 비밀번호
		mail.setAuthentication("tjdms5322", "rla2684!");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("tjdms5322@naver.com", "한울 관리자");	//송신자 정보
			mail.addTo(email, name);	//수신자 정보
			
			mail.setSubject("회원가입축하");	//메일 제목
			mail.setMsg(name + "님! 한울 IoT 과정 가입을 축하합니다");
			
			mail.send();	//메일 보내기
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	} //simpleSend()
	
	//2.첨부파일이 있는 메일
	private void attachSend(String email, String name, HttpSession session) {
		//HttpSession session > 파일의 물리적인 위치가 저장되어있는 세션
		MultiPartEmail mail = new MultiPartEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("tjdms5322", "rla2684!");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("tjdms5322@naver.com", "한울관리자");
			mail.addTo(email, name);
			mail.setSubject("회원가입축하 - 첨부파일");
			mail.setMsg("한울 IoT 과정 가입을 축하합니다. 첨부파일을 확인해 주세요");
			
			//첨부파일을 담을 객체
			EmailAttachment file = new EmailAttachment();
			file.setPath("C:\\Users\\user\\Desktop\\스케치북\\마루코는 아홉살 양파새끼.png");
			mail.attach(file);
			
			file = new EmailAttachment();
			file.setPath(session.getServletContext().getRealPath("resources") + "/css/common.css");
			mail.attach(file);
			
			file = new EmailAttachment();
			file.setURL(new URL("https://file2.instiz.net/data/cached_img/upload/2017/01/31/14/77218e22efc440eb77afc64af4ce9937.jpg"));
			mail.attach(file);
			
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	} //attachSend()
	
	//3. HTML형식의 내용을 갖는 메일 : 파일 첨부 기능
	private void htmlSend(String email, String name, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		
		mail.setAuthentication("tjdms5322", "rla2684!");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("tjdms5322@naver.com", "한울관리자");
			mail.addTo(email, name);
			
			mail.setSubject("회원가입축하! - Html문서 내용");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<a href='https://www.naver.com'><img src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7ZGar4JGw7_Lq5FWlCthfYWILLFw_1mNP2Q&usqp=CAU'/></a>");
			msg.append("<hr>");
			msg.append("<h3>한울 IoT 과정 가입 축하</h3>");
			msg.append("<p>가입을 축하합니다!</p>");
			msg.append("<p>도망가셈;;</p>");
			msg.append("</body>");	
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
			
			EmailAttachment file = new EmailAttachment();
			file.setPath(session.getServletContext().getRealPath("resources") + "/images/hanul.logo.png");
			mail.attach(file);
			
			mail.send();
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	} //htmlSend()
	
	//파일 업로드
	public String upload(String category, MultipartFile file, HttpSession session) {
		//업로드해 둘 서버의 물리적 위치를 찾는다
		String resources = session.getServletContext().getRealPath("resources");
		
		//업로드해 둘 폴더 지정
		String upload = resources + "/upload";
		
		//upload/notice/2020/09/18/고유한 아이디_abc.txt
		//업로드할 파일을 담을 폴더(upload/notice/2020/09/18) 만들기
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		File f = new File(folder);	//파일 생성
		if( !f.exists() ) f.mkdirs();  	//폴더가 없을 경우 폴더들을 생성
		String uuid = UUID.randomUUID().toString() + "_" + file;	
		//고유 아이디 생성하고 파일 이름 앞에 붙인다
		
		try {
			file.transferTo( new File(folder, uuid));
			// 전달받은 파일을 폴더에 저장
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		//folder : 
		//	resources → D:\Study_Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\IOT\resources
		//	folder → D:\Study_Spring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\IOT\resources/upload/notice/2020-09-18
		return folder.substring( resources.length() ) + "/" + uuid;
		//담아 놓은 파일의 물리저인 위치를 알려주게끔 위치 주소를 반환
		
	} //upload()
	
	//파일 다운로드
	public File download(String filename, String filepath, 
						 HttpSession session, HttpServletResponse response) {
		
		//다운로드할 파일 객체 생성
		File file = new File( session.getServletContext().getRealPath("resources") + filepath );
		// → 물리적인 위치에서 다운로드 받아야 함 > session에 접근
		
		String mime = session.getServletContext().getMimeType(filename);
		response.setContentType(mime);
		
		try {
			filename = URLEncoder.encode(filename, "utf-8");
			response.setHeader( "content-disposition", 
					"attachment; filename=" + filename );
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return file;
	} //download()
	
	//REST API 요청시 결과
	public String rest_api(StringBuilder url) {
		String result = url.toString();
		
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(result).openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			BufferedReader reader;
			if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				reader = new BufferedReader(new InputStreamReader(conn.getErrorStream() , "UTF-8"));
			}
			
			url = new StringBuilder();
			
			while( (result = reader.readLine()) != null) {	//결과가 있으면
				url.append(result);
			}
			reader.close();
			conn.disconnect();
			result = url.toString();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		
		System.out.println(result);
		return result;
	} //rest_api()
	
	public String json_list(StringBuilder url) {
		JSONObject json = null;
		try {
			json = (JSONObject) new JSONParser().parse(rest_api(url));
			json = (JSONObject) json.get("response");
			json = (JSONObject) json.get("body");
			
			int count = json.get("totalCount") == null 
					? 0 : Integer.parseInt(json.get("totalCount").toString());
			
			json = (JSONObject) json.get("items");
			json.put("count", count);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return json.toJSONString();
	} //json_list()
}
