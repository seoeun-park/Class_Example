import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.MemberDAO;
import com.hanul.study.MemberDTO;

@WebServlet("/s03.do")
public class Servlet03 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest
		//request.setCharacterEncoding("utf-8");
		//String name = request.getParameter("name");
		//String id = request.getParameter("id");
		//String pwd = request.getParameter("pwd");
		//int age = Integer.parseInt(request.getParameter("age"));
		//String addr = request.getParameter("addr");
		//String tel = request.getParameter("tel");
		
		request.setCharacterEncoding("utf-8");
		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"));
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setAddr(request.getParameter("addr"));
		dto.setTel(request.getParameter("tel"));
		
		//② 비즈니스 로직 : DataBase 연동(DTO, DAO)
		//MemberDTO dto = new MemberDTO(name, id, pwd, age, addr, tel);
		
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberInsert(dto);
		
		//③ 프리젠테이션 로직(결과를 응답) : html, *.jsp ▶   HttpServletResponse
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0) {
			out.write("<script>alert('회원가입 성공!')</script>");
			out.write("<input type='button' "
						   + "value='회원가입' "
						   + "onClick='location.href=\"MemberMain.html\"'"
					+ "/>");
			out.write("<input type='button' "
					+ "value='목록보기' "
					+ "onClick='location.href=\"s04.do\"'"
					+ "/>");
			
		} else {
			out.write("<script>alert('회원가입dto 실패!')</script>");
			out.write("<input type='button' "
					+ "value='회원가입' "
					+ "onClick='location.href=\"MemberMain.html\"'"
					+ "/>");
			out.write("<input type='button' "
					+ "value='목록보기' "
					+ "onClick='location.href=\"s04.do\"'"
					+ "/>");
		}
		
		
	}//service()
}//class
