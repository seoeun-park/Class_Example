

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.MemberDAO;
import com.hanul.study.MemberDTO;

@WebServlet("/s04.do")
public class Servlet04 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 처리 : 매개변수를 전달 받는다  ▶  HttpServletRequest
		//② 비즈니스 로직 : 전체회원의 목록을 검색하는 메소드 호출  ▶   memberSearchAll()
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> list = dao.memberSearchAll();
		
		//③ 프리젠테이션 로직 : list의 값을 출력  → html, *.jsp  ▶   HttpServletResponse
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.write("<div align='center'>");
		out.write("<h3>[전체회원 목록보기]</h3>");
		out.write("<table border='1'>");
		out.write("<tr>");
		out.write("<th>이름</th>");
		out.write("<th>아이디</th>");
		out.write("<th>비밀번호</th>");
		out.write("<th>나이</th>");
		out.write("<th>주소</th>");
		out.write("<th>전화번호</th>");
		out.write("<th>삭제</th>");
		out.write("</tr>");
		
		for (MemberDTO dto : list) {
			out.write("<tr align='center'>");
			out.write("<td>" + dto.getName() + "</td>");
			out.write("<td>" + dto.getId() + "</td>");
			out.write("<td>" + dto.getPwd() + "</td>");
			out.write("<td>" + dto.getAge() + "</td>");
			out.write("<td>" + dto.getAddr() + "</td>");
			out.write("<td>" + dto.getTel() + "</td>");
			out.write("<td><a href='s05.do?id=" + dto.getId() + "'>삭제</a></td>");
			out.write("</tr>");
		}//for-each
		
		out.write("<tr align='center'>");
		out.write("<td colspan='7'>");
		out.write("<a href='MemberMain.html'>회원가입화면</a>");
		out.write("</td>");
		out.write("</tr>");
		out.write("</table>");
		out.write("</div>");
	}//service()
}//class
