import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.SumMachine;

@WebServlet("/s08.do")
public class Servlet08 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 받는다 : 매개변수를 입력받는다.
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		//② 비즈니스 로직 : 별도의 클래스에 작성(SumMachine.java)
		SumMachine sm = new SumMachine();
		int sum = sm.getSum(num1, num2);
		
		//③ 프리젠테이션 로직 : 결과를 응답   ▶   Servlet09.java(s09.do) : response.sendRedirect()
		// → redirect 방식 : 단순한 페이지 전환만 필요할 경우(연결할 객체가 없는 경우)
		//url이 변경된다. → s08.do?num1=~&num2=~
		//request.setAttribute("num1", num1);		//바인딩(연결) 객체
		//request.setAttribute("num2", num2);
		//request.setAttribute("sum", sum);
		
		//response.sendRedirect("s09.do");
		//→ redirect 방식에서는 바인딩 객체가 전달되지 않는다.
		
		//redirect 방식으로 페이지 전환을 할 경우 연결할 매개변수가 있을 때, get 방식으로 넘겨주어야 한다.
		response.sendRedirect("s09.do?num1=" + num1 + "&num2=" + num2 + "&sum=" + sum);
		

	}//service
}//class
