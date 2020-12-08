package com.board.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
		throws ServletException, IOException {
		
		String search = (String) request.getParameter("search");
		String search_data = (String) request.getParameter("search_data");
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardDTO> list = dao.searchList(search, search_data);
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/board_search_view.jsp");
		forward.setRedirect(false);
		
		return forward;
	} //execute()
} //class
