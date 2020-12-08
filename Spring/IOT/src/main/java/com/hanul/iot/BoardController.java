package com.hanul.iot;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.BoardCommentVO;
import board.BoardPage;
import board.BoardService;
import board.BoardServiceImpl;
import board.BoardVO;
import common.CommonService;
import member.MemberVO;

@Controller
public class BoardController {
	@Autowired private BoardServiceImpl service;
	@Autowired private BoardPage page;
	@Autowired private CommonService common;
	
	// 댓글 삭제 처리 요청
	@ResponseBody @RequestMapping("/board/comment/delete/{id}")
	public void comment_delete(@PathVariable int id) {
		
		service.board_comment_delete(id);
	}
	
	// 방명록 댓글 변경 저장처리 요청
	@ResponseBody @RequestMapping(value= "/board/comment/update"
								, produces = "application/text; charset=utf-8")
	public String comment_update(@RequestBody BoardCommentVO vo) {
		
		return service.board_comment_update(vo) > 0 ? "성공" : "실패";
	}
	
	//댓글 목록화면 조회
	@RequestMapping("/board/comment/{bid}")
	public String comment_list(@PathVariable int bid, Model model) {
		
		model.addAttribute("list", service.board_comment_list(bid));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		
		return "board/comment/comment_list";
	} //comment_list()
	
	// 방명록 댓글 저장 처리
	@ResponseBody @RequestMapping("/board/comment/regist")
	public int comment_regist(BoardCommentVO vo, HttpSession session) {
		//화면에서 입력한 정보를 DB에 저장한 후 ajax쪽으로 돌아간다.
		MemberVO member = (MemberVO) session.getAttribute("login_info");
		vo.setWriter(member.getId());		//작성자를 로그인한 아이디로 저장
		
		return service.board_comment_regist(vo);
	} //comment_regist()
	
	//방명록 삭제처리 요청
	@RequestMapping("/delete.bo")
	public String delete(int id, Model model) {
		//선택한 방명록 글을 DB에서 삭제한 후 목록화면으로 연결
		service.board_delete(id);
		model.addAttribute("page", page);
		model.addAttribute("url", "list.bo");
		
		return "board/redirect";
	}
	
	//방명록 수정 저장 처리 요청
	@RequestMapping("/update.bo")
	public String update(BoardVO vo, MultipartFile file, Model model,
						//RedirectAttributes redirect,
						 HttpSession session, String attach) {
		BoardVO board = service.board_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + board.getFilepath();
				
		//화면에서 입력한 정보를 DB에 저장한 후 상세화면으로 연결
		if(!file.isEmpty()) {		//첨부파일이 있는 경우
			//원래 파일 첨부 x > 파일첨부 o
			//원래 파일 첨부 o > 그 파일을 변경한 경우
			vo.setFilename(file.getOriginalFilename());		//파일 이름
			vo.setFilepath(common.upload("board", file, session));	//파일 경로
			
			// 원래 있던 파일을 삭제
			if(board.getFilename() != null) {	//파일정보가 있는 경우
				File f = new File(uuid);
				if(f.exists()) f.delete();	// 파일 삭제
			}
			
		} else {
			//원래 파일 첨부 x > 또 파일 첨부 x
			//원래 파일 첨부 o > 원래 있던걸 삭제
			// 원래 파일 첨부 o > 원래 있었던 파일 그대로 첨부
			if(attach.isEmpty()) {
				// 원래 있던 파일을 삭제
				if(board.getFilename() != null) {	//파일정보가 있는 경우
					File f = new File(uuid);
					if(f.exists()) f.delete();	// 파일 삭제
				}
			} else {
				//원래 있던걸 그대로 사용하는 경우
				vo.setFilename(board.getFilename());
				vo.setFilepath(board.getFilepath());
			}
		}
		
		service.board_update(vo);
		
		//return "redirect:detail.bo?id=" + vo.getId();
		
		//redirect.addFlashAttribute("id", vo.getId());
		//return "redirect:detail.bo";
		// → 수정한 후 detail.bo로 돌아갔을 때 새로고침하면 오류
		
		model.addAttribute("url", "detail.bo");
		model.addAttribute("id", vo.getId());
		return "board/redirect";
		// → 새로고침을 해도 오류가 나지 않음
	}
	
	//방명록 수정화면 요청
	@RequestMapping("/modify.bo")
	public String modify(int id, Model model) {
		//선택한 방명록 정보를 DB에서 조회해와 수정화면에 출력
		model.addAttribute("vo", service.board_detail(id));
		
		return "board/modify";
	}
	
	// 첨부파일 다운로드 요청
	@ResponseBody @RequestMapping("/download.bo")
	public void download(int id, HttpSession session, 
							HttpServletResponse response) {
		BoardVO vo = service.board_detail(id);
		
		common.download(vo.getFilename(), vo.getFilepath(), session, response);
		
	}
	
	//방명록 상세화면 요청
	@RequestMapping("/detail.bo")
	//public String detail(int id, Model model) {
	public String detail(/* @ModelAttribute("id") */ int id , Model model) {
		//선택한 방명록 글 정보를 DB에서 조회해와 상세화면에 출력
		model.addAttribute("vo", service.board_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		
		return "board/detail";
	}
	
	//방명록 신규 글 저장 처리 요청
	@RequestMapping("/insert.bo")
	public String insert(BoardVO vo, MultipartFile file, HttpSession session) {
		//첨부 파일 정보
		if(!file.isEmpty()) {
			vo.setFilename(file.getOriginalFilename());
			vo.setFilepath(common.upload("board", file, session));
		}
		
		//화면에서 입력한 정보를 DB에 저장한 후
		vo.setWriter( 
				((MemberVO)session.getAttribute("login_info")).getId() );
		service.board_insert(vo);
		
		//목록 화면으로 연결
		
		return "redirect:list.bo";
	} //insert()
	
	//방명록 글쓰기 화면 요청
	@RequestMapping("/new.bo")
	public String board() {
		//
		
		return "board/new";
	} //board()
	
	//방명록 목록화면 요청
	@RequestMapping("/list.bo")
	public String list(Model model, HttpSession session
	         ,String search, String keyword
	         , @RequestParam(defaultValue = "list") String viewType
	         , @RequestParam(defaultValue = "10") int pageList
	         , @RequestParam(defaultValue = "1") int curPage) {
		session.setAttribute("category", "bo");		//선택되면 카테고리 진하게 표시
		
		//DB에서 방명록 정보를 조회해와 목록화면에 출력
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		page.setPageList(pageList);
		page.setViewType(viewType);
		model.addAttribute("page", service.board_list(page));
		
		return "board/list";
	} //list()
}
