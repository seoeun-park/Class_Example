

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;


@WebServlet("/gals.do")
public class GetAllListServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.getAllList();
		
		//③ 프리젠테이션 로직 : list의 값을 출력  → html ▶   HttpServletResponse
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.write("<div align='center'>");
		out.write("<h3>[전체회원 목록보기]</h3>");
		out.write("<table border='1'>");
		out.write("<tr>");
		out.write("<th>제목</th>");
		out.write("<th>저자</th>");
		out.write("<th>ISBN</th>");
		out.write("<th>출판사</th>");
		out.write("<th>단가</th>");
		out.write("<th>수량</th>");
		out.write("<th>가격</th>");
		out.write("<th>삭제</th>");
		out.write("</tr>");

		for (BookDTO dto : list) {
			out.write("<tr align='center'>");
			out.write("<td>" + dto.getTitle() + "</td>");
			out.write("<td>" + dto.getAuth() + "</td>");
			out.write("<td>" + dto.getIsbn() + "</td>");
			out.write("<td>" + dto.getComp() + "</td>");
			out.write("<td>" + dto.getCost() + "</td>");
			out.write("<td>" + dto.getSu() + "</td>");
			out.write("<td>" + dto.getPrice() + "</td>");
			out.write("<td><a href='ds.do?isbn=" + dto.getIsbn() + "'>삭제</a></td>");
			out.write("</tr>");
		}//for-each	
		
		out.write("<tr align='center'>");
		out.write("<td colspan='8'>");
		out.write("<a href='BookMain.html'>회원가입화면</a>");
		out.write("</td>");
		out.write("</tr>");
		out.write("</table>");
		out.write("</div>");
	}//service()
}
