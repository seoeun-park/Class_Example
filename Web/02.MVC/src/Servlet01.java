import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s01.do")		//Servlet Mapping 자동설정
public class Servlet01 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest
		request.setCharacterEncoding("utf-8");	//폼에서 전달되는 값 중에 한글 처리(인코딩)
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		//② 비즈니스 로직 수행(num1 ~ num2 누적합 계산)     ▶    Model : DTO, DAO, Class
		int sum = 0;
		for (int i = num1; i <= num2 ; i++) {
			sum += i;
		}
		
		//③ 프리젠테이션 로직 수행 : 결과를 html 코드로 응답(HttpServletResponse)  ▶  View
		response.setContentType("text/html; charset=utf-8");		//MIME Type
		PrintWriter out = response.getWriter();
		out.write("<body>");
		out.write("첫 번째 수 : " + num1 + "</br>");
		out.write("두 번째 수 : " + num2 + "</br>");
		out.write("두 수 사이의 누적합 : " + sum);
		out.write("</body>");
		
	}//service()
}//class
