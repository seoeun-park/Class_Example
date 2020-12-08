package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.member.study.MemberDAO;
import com.member.study.MemberDTO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
		throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		MemberDTO dto = new MemberDTO();
		dto.setMember_id(request.getParameter("member_id"));
		dto.setMember_pw(request.getParameter("member_pw"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.isMember(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (result == -1) {
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다!');");
			out.println("location.href = 'memberLogin.me';");
			out.println("</script>");
			return null;
		} else if (result == 0) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다!');");
			out.println("location.href = 'memberLogin.me';");
			out.println("</script>");
			return null;
		} else {			//로그인 성공 : session 객체를 생성 후, 게시판 목록으로 이동
			HttpSession session = request.getSession();
			session.setAttribute("id", dto.getMember_id());
			
			ActionForward forward = new ActionForward();
			forward.setPath("boardList.bo");
			forward.setRedirect(true);
			// → 로그인 성공 했으므로 url이 바뀌어도 상관x
			
			return forward;
		}
	} //execute()
} //class
