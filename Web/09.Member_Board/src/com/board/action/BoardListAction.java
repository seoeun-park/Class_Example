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

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
		throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//비즈니스 로직 : DB접속 후, 전체 글 목록 검색, 페이징처리 코드
		BoardDAO dao = new BoardDAO();
		int listCount = dao.getListCount();		//글의 총 개수
		
		int page = 1;		//시작되는 페이지 번호
		int limit = 10;		// 한 페이지에 표시되는 글 목록 개수
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		list = dao.getBoardList(page, limit);	//전체 글 목록 검색
		
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// → 전체 페이지 수
		//   글 갯수가 20개일 경우  maxPage는 2.9에서 2만 갖고 오므로 페이지는 2개가 됨
		//   글 갯수가 21개일 경우  maxPage는 3.0에서 3만 갖고 오므로 페이지는 3개가 됨
		
		//현재 페이지에서 보여줄 시작 페이지 수(1, 11, 21~)
		int startPage = (((int) ((double)page / limit + 0.9)) - 1) * limit + 1;
		
		//현재 페이지에서 보여줄 마지막 페이지 수 (10, 20, 30)
		int endPage = maxPage;
		if(endPage > startPage + 10 - 1) {
			endPage = startPage + 10 - 1;
		}
		
		request.setAttribute("page", page);				//현재 페이지 수
		request.setAttribute("maxPage", maxPage);		//전체 페이지 수
		request.setAttribute("startPage", startPage);	//첫 페이지 수
		request.setAttribute("endPage", endPage);		//마지막 페이지 수
		request.setAttribute("listCount", listCount);	//전체 글의 개수
		request.setAttribute("list", list);				//전체 글 목록
		
		ActionForward forward = new ActionForward();
		
		if(id == null) {		//로그인이 되지 않은 상태
			forward.setPath("memberLogin.me");
			forward.setRedirect(true);
			return forward;
		} else {
			forward.setPath("board/board_list.jsp");
			forward.setRedirect(false);
			// → url이 바뀌지 않아야 하므로
			
			return forward;
		}
	} //execute()
} //class
