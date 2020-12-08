

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;

@WebServlet("/is.do")
public class InsertServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest		
		request.setCharacterEncoding("utf-8");
		BookDTO dto = new BookDTO();
		dto.setTitle(request.getParameter("title"));
		dto.setAuth(request.getParameter("auth"));
		dto.setIsbn(request.getParameter("isbn"));
		dto.setComp(request.getParameter("comp"));
		dto.setCost(Integer.parseInt(request.getParameter("cost")));
		dto.setSu(Integer.parseInt(request.getParameter("su")));
		dto.setPrice(dto.getCost() * dto.getSu());

		//② 비즈니스 로직 : DataBase 연동(DTO, DAO)		
		BookDAO dao = new BookDAO();
		int succ = dao.insert(dto);
		
		//③ 프리젠테이션 로직(결과를 응답) : html ▶   HttpServletResponse
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (succ > 0) {
			out.write("<script>alert('도서정보등록 성공!')</script>");
			out.write("<a href='BookMain.html'>도서정보 입력하기</a><br/>");
			out.write("<a href='gals.do'>전체도서 정보보기</a>");
		} else {
			out.write("<script>alert('도서정보등록 실패!')</script>");
		}
	}//service()
}//class
