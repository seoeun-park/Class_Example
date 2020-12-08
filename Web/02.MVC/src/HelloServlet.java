import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/hs.do")		//Servlet Mapping 자동 설정 코드 : Annotation(web.xml을 대신)
public class HelloServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {		//throws 구문 : try-catch 구문을 쓸 필요x
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest
		//② 비즈니스 로직 수행 : DTO, DAO, Class
		//③ 프리젠테이션 로직 수행 : 결과를 응답(html, *.jsp) ▶  HttpServletResponse
		response.setContentType("text/html; charset=utf-8");	//MIME Type
		PrintWriter out = response.getWriter();		//응답(출력) 준비 완료
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Response Servlet</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>Welcome to Hello Servlet</h3>");
		out.println("</body>");
		out.println("</html>");
		
	}//service()

}//class
