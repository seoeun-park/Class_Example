package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		BoardDAO dao = new BoardDAO();
		
		//dao.readCount(board_num);		//조회수 증가
		// → getDetail() 메소드가 나오기 전에 조회수를 증가시키는 메소드를 호출해야함
		
		BoardDTO dto = dao.getDetail(board_num);
		if (!(id.equals(dto.getBoard_id()))) {
		// → 로그인 id와 작성자 id가 같지 않으면	
			dao.readCount(board_num);
			// 조회수 증가
		}
		dto = dao.getDetail(board_num);
		// → 업데이트된 글 검색	
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/board_view.jsp");
		forward.setRedirect(false);
		
		return forward;
	} //execute()
} //class
