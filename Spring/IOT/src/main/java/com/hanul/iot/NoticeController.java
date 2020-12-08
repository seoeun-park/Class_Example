package com.hanul.iot;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;
import notice.NoticePage;
import notice.NoticeServiceImpl;
import notice.NoticeVO;

@Controller
public class NoticeController {
	@Autowired private NoticeServiceImpl service;
	@Autowired private MemberServiceImpl member;
	@Autowired private CommonService common;
	@Autowired private NoticePage page;
	
	//공지사항 목록 화면 요청
	@RequestMapping("/list.no")
	public String list(Model model, HttpSession session, 
						String search, String keyword,
					@RequestParam(defaultValue = "1") int curPage) {
		//임시 테스트용 관리자 로그인 : list.no를 들어갈때마다 자동으로 로그인
		//HashMap<String, String> map = new HashMap<String, String>();
		//map.put("id", "admin");
		//map.put("pw", "Manager");
		//session.setAttribute("login_info", member.member_login(map));
		
		session.setAttribute("category", "no");
		
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		
		//DB에서 공지글 목록을 조회해와 목록화면에 출력한다.
		//service.notice_list();
		//curPage.model.addAttribute("list", service.notice_list(page));
		model.addAttribute("page", service.notice_list(page));
		
		return "notice/list";
	} //list()
	
	
	//공지글 상세화면 요청
	@RequestMapping("/detail.no")
	public String datail(int id, Model model) {
		//선택한 공지글 조회수 증가처리
		service.notice_read(id);
		
		//선택한 공지글 정보를 DB에서 조회해와 상세화면에 출력
		model.addAttribute("vo", service.notice_detail(id));
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("page", page);
		
		return "notice/detail";
	} //datail()
	
	//신규 공지글 화면 요청
	@RequestMapping("/new.no")
	public String notice() {
		
		
		return "notice/new";
	}
	
	//신규 공지글 저장처리 요청
	@RequestMapping("/insert.no")
	public String insert(NoticeVO vo, HttpSession session, MultipartFile file) {
	// MultipartFile file → 첨부파일을 담을 매개변수 / pom.xml에 라이브러리 추가, default.xml에 beans 객체 추가
		
		//화면에서 입력한 공지글 정보를 DB에 저장한 후
		MemberVO member = (MemberVO)session.getAttribute("login_info");
		vo.setWriter( member.getId() );
		
		//첨부파일이 있는 경우 파일 정보를 데이터 객체에 담는다
		if( !file.isEmpty() ) {
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath( common.upload("notice", file, session) );
		}
		
		service.notice_insert(vo);
		
		//목록화면으로 연결
		return "redirect:list.no";
		//.jsp가 아닌 주소로 요청
	} //insert()
	
	//첨부파일 다운로드 처리
	@ResponseBody @RequestMapping("/download.no")
	public String download(int id, HttpSession session, HttpServletResponse response) {
		//해당 글에 첨부된 파일 정보를 통해 서버의 물리적 위치에서 다운로드한다
		NoticeVO vo = service.notice_detail(id);
		common.download(vo.getFilename(), vo.getFilepath(), session, response);
		
		return "";
	} //download()
	
	//공지글 수정화면 요청
	@RequestMapping("/modify.no")
	public String modify(Model model, int id) {
		//선택한 공지글 정보를 DB에서 조회해와 
		model.addAttribute("vo", service.notice_detail(id));
		
		//수정화면에 출력
		return "notice/modify";
	} //modify()
	
	//공지글 수정처리 요청
	@RequestMapping("/update.no")
	public String update(NoticeVO vo, String attach ,MultipartFile file, HttpSession session) {
		//DB에 저장된 파일정보를 조회해온다
		NoticeVO notice = service.notice_detail(vo.getId());
		String uuid = session.getServletContext().getRealPath("resources") + notice.getFilepath();
		
		if( !file.isEmpty() ) {
			//파일 첨부 o
			// 원래 없었는데 변경시 첨부하는 경우 / 원래 있었는데 변경시 바꿔서 첨부하는 경우
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath( common.upload("notice", file, session) );
			
			//원래 있었는데 변경시 바꿔서 첨부하는 경우 원래 있던 파일은 삭제(물리적인 영역 삭제)
			if(notice.getFilename() != null) {
				File f = new File(uuid);
				if ( f.exists() ) f.delete();
			}
		} else {
			//파일 첨부 x 
			// 1. 원래 첨부된 파일을 삭제하는 경우 / 2. 원래부터 첨부된 파일이 없었던 경우
			// 3. 원래 첨부된 파일이 있고 그것을 그대로 사용하는 경우
			if( attach.isEmpty() ) {		// 1번
				//원래 첨부되어 업로드된 파일을 삭제
				if(notice.getFilename() != null) {
					File f = new File(uuid);
					if ( f.exists() ) f.delete();
				}
			} else {	//3번
				vo.setFilename( notice.getFilename() );
				vo.setFilepath( notice.getFilepath() );
			}
		}
		
		service.notice_update(vo);
		
		//상세화면으로 연결
		return "redirect:detail.no?id=" + vo.getId();
	} //update()
	
	//공지글 삭제처리 요청
	@RequestMapping("/delete.no")
	public String delete(int id, HttpSession session) {
		//선택한 공지글을 DB에서 삭제한 후 목록화면으로 연결
		//첨부파일이 있는 경우 물리적영역에서 파일삭제
		NoticeVO vo = service.notice_detail(id);
		
		service.notice_delete(id);
		if( vo.getFilename() != null ) {
			File f = new File( session.getServletContext().getRealPath("resources") + vo.getFilepath() );
			
			if(f.exists()) f.delete();
		}
		
		service.notice_delete(id);
		
		return "redirect:list.no";
	} //delete()
	
	//공지글에 대한 답글쓰기 화면 요청
	@RequestMapping("/reply.no")
	public String reply(int id, Model model) {
		model.addAttribute("vo", service.notice_detail(id));
		
		return "notice/reply";
	} //reply()
	
	//공지글에 대한 답글쓰기 저장 처리 요청
	@RequestMapping("/reply_insert.no")
	public String reply_insert(NoticeVO vo, HttpSession session) {
		//화면에서 입력한 정보를 DB에 답글로 저장한 후,
		//목록화면으로 연결
		
		vo.setWriter( ((MemberVO) session.getAttribute("login_info")).getId() );
		service.notice_reply_insert(vo);
		
		return "redirect:list.no";
	} //reply()
	
	
}
