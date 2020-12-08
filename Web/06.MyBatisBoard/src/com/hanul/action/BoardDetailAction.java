package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.BoardDAO;
import com.hanul.dto.BoardDTO;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, 
								HttpServletResponse response)
		throws ServletException, IOException {
		// 클라이언트의 요청을 받는다.
		String b_num = request.getParameter("b_num");
		
		// 비즈니스 로직 : 글 검색
		BoardDAO dao = new BoardDAO();
		
		dao.boardCount(b_num); 	//조회수 증가
		// → 조회수를 증가시킨 다음에 글 검색을 해야 변경된 조회수를 조회할 수 있다.
		// → [글 상세보기] 페이지에도 올라간 조회수를 보여주기 위해
		
		BoardDTO dto = dao.boardDetail(b_num);		//글 검색
		request.setAttribute("dto", dto);
		
		// 프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardDetail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}//excute()
	
	
}//class
