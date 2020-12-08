package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
		throws ServletException, IOException {
		//String saveFolder = "boardupload";
		//String realFolder = request.getRealPath(saveFolder);
		//System.out.println(realFolder);
		String realFolder = "";		//업로드한 파일이 저장되는 경로
		realFolder = "D:\\Study_Web\\workspace\\09.Member_Board\\WebContent\\boardupload";
		int fileSize = 5 * 1024 * 1024;		//업로드한 파일의 최대 용량 : 5MB
		
		// cos 라이브러리에서 제공하는 클래스
		MultipartRequest multi = null;		//파일 업로드 처리
		DefaultFileRenamePolicy policy 
			= new DefaultFileRenamePolicy();	//중복 파일명 방지
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", policy);
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_id(multi.getParameter("board_id"));
		dto.setBoard_subject(multi.getParameter("board_subject"));
		dto.setBoard_content(multi.getParameter("board_content"));
		
		//System.out.println(multi.getParameter("board_file"));
		// → null
		
		//System.out.println(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		// → 파일명.jpg
		
		dto.setBoard_file(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (succ > 0) {
			out.println("<script>alert('등록 성공!');");
			out.println("location.href='boardList.bo';</script>");
		} else {
			out.println("<script>alert('등록 실패!');");
			out.println("location.href='boardList.bo';</script>");
		}
		
		return null;
	} //execute()
} //class
