import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s09.do")
public class Servlet09 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//Servlet08.java(s08.do)에서 넘겨준 바인딩(연결) 객체를 받는다.
		//redirect 방식에서는 바인딩 객체가 전달되지 않는다.
		//Integer num1 = (Integer) request.getAttribute("num1");
		//Integer num2 = (Integer) request.getAttribute("num2");
		//Integer sum = (Integer) request.getAttribute("sum");
		
		//Servlet08.java(s08.do)에서 넘겨준 매개변수를 받는다
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		int sum = Integer.parseInt(request.getParameter("sum"));
		
		
		//결과를 출력 : html
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<body>");	
		out.println("<h3>response.sendRedirect()</h3>");
		out.println("첫 번째 정수 : " + num1 + "<br/>");
		out.println("두 번째 정수 : " + num2 + "<br/>");
		out.println("두 수 사이의 누적합 : " + sum);
		out.println("</body>");			
	}//service()
}//class