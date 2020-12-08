package com.hanul.iot;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
	@Autowired private MemberServiceImpl service;
	@Autowired private CommonService common;
	
	//회원가입처리 요청
	@ResponseBody @RequestMapping(value="/join"
			, produces = "text/html; charset=utf-8")
	public String join(MemberVO vo, HttpServletRequest request, HttpSession session) {
		//화면에서 입력한 회원정보를 DB에 저장한다.
		String msg = "<script type='text/javascript'>";
		if(service.member_insert(vo)) {
			common.sendEmail(vo.getEmail(), vo.getName(), session);
			
			msg += "alert('회원가입을 축하합니다'); location='" + request.getContextPath() + "'";
		
				
		} else {
			msg += "alert('회원가입 실패'); history.go(-1)";
		}
		
		msg += "</script>";
		
		return msg;
	} //join()
	
	// 아이디 중복확인 요청
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String id) {
		//화면에서 입력한 아이디가 DB에 존재하는지 여부를 판단한다
		
		
		return service.member_id_check(id);
	}
	
	//회원가입화면 요청
	@RequestMapping("/member")
	public String member(HttpSession session) {
		session.removeAttribute("category");
		// → 회원가입 화면으로 이동할때는 카테고리에 속하지 않으므로 카테고리 정보 삭제
		
		return "member/join";
	} //member()

	
	//로그아웃 처리
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		//세션의 로그인정보를 삭제한다.
		session.removeAttribute("login_info");
		
		//로그아웃 한 후 가지고갈 데이터가 없기 때문에 반환할 값이 없다.
	} //logout()
	
	//로그인 처리
	@ResponseBody @RequestMapping("/login")
	public Boolean login(String userid, String userpw, HttpSession session) {
		//화면에서 입력한 아이디, 비번이 일치하는 회원정보를 가져옴
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", userid);
		map.put("pw", userpw);
		MemberVO vo = service.member_login(map);
		
		//DB에서 조회해와 세션에 담는다.
		session.setAttribute("login_info", vo);
		
		return vo==null ? false: true;
		//화면을 넘기는 것이 아니라 ajax로 통신한 쪽(header.jsp)으로 데이터를 가지고 오기만 하면 된다.
		// return "true"으로 작성할 경우 true.jsp라는 화면으로 넘기게 된다.
	} //login()
	
	
}
