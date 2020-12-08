package com.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commons.action.Action;
import com.commons.action.ActionForward;

import memberListAction.MemberListAction;

@WebServlet("/MemberFrontController.me")
public class MemberFrontController extends HttpServlet {

	protected void service(HttpServletRequest request, 
							HttpServletResponse response) 
		throws ServletException, IOException {
		// 클라이언트가 무엇을 요청했는지 파악 : command
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		//System.out.println(command);
		
		// 실제 작업을 수행할 Action Class로 전환
		Action action = null;
		ActionForward forward = null;
		
		if (command.equals("/memberLogin.me")) {
			forward = new ActionForward();
			forward.setPath("member/loginForm.jsp");
			forward.setRedirect(false);		//url이 바뀌지 않도록
		} else if (command.equals("/memberLoginAction.me")) {
			action = new MemberLoginAction();
			forward = action.execute(request, response);
			
		} else if (command.equals("/memberJoin.me")) {
			forward = new ActionForward();
			forward.setPath("member/joinForm.jsp");
			forward.setRedirect(false);
			
		} else if (command.equals("/memberJoinAction.me")) {
			action = new MemberJoinAction();
			forward = action.execute(request, response);
		} else if (command.equals("/memberLogout.me")) {
			action = new MemberLogoutAction();
			forward = action.execute(request, response);
		} else if (command.equals("/memberListAction.me")) {
			action = new MemberListAction();
			forward = action.execute(request, response);
		} else if (command.equals("/memberDeleteAction.me")) {
			action = new MemberDeleteAction();
			forward = action.execute(request, response);
		} else if (command.equals("/memberViewAction.me")) {
			action = new MemberViewAction();
			forward = action.execute(request, response);
		} else if (command.equals("/memberDetailAction.me")) {
			action = new MemberDetailAction();
			forward = action.execute(request, response);
		} else if (command.equals("/memberUpdateAction.me")) {
			action = new MemberUpdateAction();
			forward = action.execute(request, response);
		}
		
		// 페이지 전환
		if(forward != null) {
			if(forward.isRedirect()) {	//true : sendRedirect() 전환
				response.sendRedirect(forward.getPath());
			} else {					//false : forward() 전환
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}	
	} //service()
}//class
