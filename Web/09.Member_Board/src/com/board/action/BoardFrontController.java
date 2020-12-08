package com.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.commons.action.Action;
import com.commons.action.ActionForward;

@WebServlet("/BoardFrontController.bo")
public class BoardFrontController extends HttpServlet {

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
		
		if (command.equals("/boardList.bo")) {
			action = new BoardListAction();
			forward = action.execute(request, response);
		} else if (command.equals("/boardWrite.bo")) {
			forward = new ActionForward();
			forward.setPath("board/board_write.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/boardAddAction.bo")) {
			action = new BoardAddAction();
			forward = action.execute(request, response);
		} else if (command.equals("/boardDetailAction.bo")) {
			action = new BoardDetailAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardDeleteAction.bo")) {
			action = new BoardDeleteAction();
			forward = action.execute(request, response);
		} else if (command.equals("/boardModifyView.bo")) {
			action = new BoardModifyView();
			forward = action.execute(request, response);
		} else if (command.equals("/boardModifyAction.bo")) {
			action = new BoardModifyAction();
			forward = action.execute(request, response);
		} else if (command.equals("/boardReplyView.bo")) {
			action = new BoardReplyView();
			forward = action.execute(request, response);
		} else if (command.equals("/boardReplyAction.bo")) {
			action = new BoardReplyAction();
			forward = action.execute(request, response);
		} else if (command.equals("/boardSearchAction.bo")) {
			action = new BoardSearchAction();
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
} //class
