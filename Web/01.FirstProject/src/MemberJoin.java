

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.member.MemberDTO;

@WebServlet("/memberJoin.do")
public class MemberJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//클라이언트의 요청을 받는다 : 매개변수를 가져온다 ▶  HttpServletRequest
		// input 태그의 name 속상의 값을 가져와야 한다.
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		int age = Integer.parseInt(request.getParameter("age"));
		String addr = request.getParameter("addr");
		
//		System.out.println("성명 : " + name);
//		System.out.println("아이디 : " + id);
//		System.out.println("비밀번호 : " + pw);
//		System.out.println("나이 : " + age);
//		System.out.println("주소 : " + addr);
		
		//비즈니스 로직 : DAO를 통해 DB와 연동하여 결과를 리턴받는 작업
		MemberDTO dto = new MemberDTO(name, id, pw, age, addr);
		//DB 연동 : MemberDAO.java → insertMember(dto) ▶  생략
		
		//프리젠테이션 로직 : 리턴받은 결과를 클라이언트에게 응답 ▶  HttpServletResponse
		request.setAttribute("dto", dto);
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");
		rd.forward(request, response);
		
	}//service()

}//class

/*

MVC Pattern

→ Model : .java 파일
→ View : html, css, js, image
→ Controller : Servlet

View 파트에서 회원정보를 Controller를 통해 Model에 전달
.java에서 비즈니스 로직을 Controller에 전달하여 View 파트에 최종적으로 전달

 */
