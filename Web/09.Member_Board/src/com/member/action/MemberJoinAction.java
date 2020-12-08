package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;

import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.member.study.MemberDAO;
import com.member.study.MemberDTO;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		/*
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		int member_age = Integer.parseInt(request.getParameter("member_age"));
		String member_gender = request.getParameter("member_gender");
		String member_email = request.getParameter("member_email");
		MemberDTO dto = new MemberDTO(member_id, member_pw, member_name, member_age, member_gender, member_email);
		*/
		
		MemberDTO dto = new MemberDTO();
		dto.setMember_id(request.getParameter("member_id"));
		dto.setMember_pw(request.getParameter("member_pw"));
		dto.setMember_name(request.getParameter("member_name"));
		dto.setMember_age(Integer.parseInt(request.getParameter("member_age")));
		dto.setMember_gender(request.getParameter("member_gender"));
		dto.setMember_email(request.getParameter("member_email"));
		
		MemberDAO dao = new MemberDAO();
		int succ = dao.joinMember(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(succ > 0) {
			out.println("<script>alert('회원가입 성공!');");
			out.println("location.href='memberLogin.me';</script>");
		} else {
			out.println("<script>alert('회원가입 실패!');");
			out.println("location.href='memberJoin.me';</script>");
		}
		
		return null;
		// → 위에서 페이지 전환을 해주기 때문에 null을 반환
	} //execute()

}
