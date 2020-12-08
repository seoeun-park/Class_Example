import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;

@WebServlet("/ds.do")
public class DeleteServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest
		request.setCharacterEncoding("utf-8");
		String isbn = request.getParameter("isbn");
		
		//② 비즈니스 로직 : 해당 id의 회원정보를 삭제  ▶  memberDelete()
		BookDAO dao = new BookDAO();
		int succ = dao.delete(isbn);
		
		//③ 프리젠테이션 로직 : 삭제 결과를 응답  → html, *.jsp ▶   HttpServletResponse
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (succ > 0) {
			out.println("<script>alert('도서정보 삭제 성공');</script>");
			out.println("<a href='BookMain.html'>도서정보 입력하기</a><br/><br/>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
		} else {
			out.println("<script>alert('도서정보 삭제 실패');</script>");
			out.println("<a href='BookMain.html'>도서정보 입력하기</a><br/><br/>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
		}
				
	}//service()

}//class
