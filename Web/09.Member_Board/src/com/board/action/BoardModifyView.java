package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardModifyView implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
	throws ServletException, IOException {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		// → 로그인했던 id
		
		BoardDAO dao = new BoardDAO();
		boolean result = dao.isBoardWriter(board_num, id);
		// → 작성자 확인
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		ActionForward forward = null;
		
		if (result) {		//작성자 일치(작성자만 수정 권한 부여)
			BoardDTO dto = dao.getDetail(board_num);
			request.setAttribute("dto", dto);
			
			forward = new ActionForward();
			forward.setPath("board/board_modify.jsp");
			forward.setRedirect(false);
		} else {			//작성자 불일치
			//오류 메세지
			out.println("<script>alert('수정할 권한이 없습니다!');");
			out.println("history.go(-1);</script>");
		}

		return forward;
	}//execute()
}//class
