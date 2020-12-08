package com.hanul.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.MemberVO;

@Controller
public class TestController {
	
	//1. 회원가입 처리 요청 - HttpServletRequest으로 파라미터 접근
	@RequestMapping("/joinRequest")
	public String join(HttpServletRequest request, Model model) {
		model.addAttribute("name", request.getParameter("name"));	
		// → request로 해당 파라미터에 접근한 후(name 속성안의 값을 통해), model안에 저장
		
		model.addAttribute("gender", request.getParameter("gender"));
		model.addAttribute("email", request.getParameter("email"));
		model.addAttribute("method", "HttpServletRequest");
		
		
		return "member/info";
	}
	
	//2. 회원가입 처리 요청 - @RequestParam으로 파라미터 접근
	//					annotation 생략 가능
	@RequestMapping("/joinParam")
	public String join(@RequestParam String name, 
					    String gender,
					    String email,
					    //@RequestParam("email") String mail,	→ name 속성 값과 다를 때 
						Model model) {
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		model.addAttribute("method", "HttpServletRequest");
		
		return "member/info";
	}
	
	//3. 회원가입 처리 요청 - 데이터 객체로 파라미터 접근
	@RequestMapping("/joinData")
	public String join(MemberVO vo, Model model) {
		model.addAttribute("vo", vo);
		model.addAttribute("method", "데이터 객체");
		
		return "member/info";
	}
	
	//4. 회원가입 처리 요청 - @PathVariable로 파라미터 접근
	@RequestMapping("/joinPath/{name}/{gender}/{email}")
	public String join(Model model,
					   @PathVariable String name,
					   @PathVariable String gender,
					   @PathVariable String email) {
		// 메소드의 이름이 동일한 경우 매개변수까지 같다면 오버로딩의 오류가 생김!
		// 이땐 매개변수의 순서를 변경하면 된다.
		model.addAttribute("method", "@PathVariable");
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		
		return "member/info";
	}
	
	//회원가입 화면 요청
	@RequestMapping("/member")
	public String member() {
		
		
		return "member/join";
	}
	
	//----------------------------------------------------------
	
	//로그인 처리 요청
	@RequestMapping("/login_result")
	public String login(String id, String pw) {
		// 화면에서 입력한 아이디/비번이 DB에 일치하는 정보가 있는 지
		// 판단 하여 로그인되게 하거나 일치하지 않다는 처리를 하거나
		// → 일치한다면 홈화면으로 연결
		// → 일치하지 않는다면 로그인화면으로 연결
		if(id.equals("admin") && pw.equals("1234")) {
			return "redirect:/";
			// return "home";		//forward 방식
		} else {
			return "redirect:login";
			// return "member/login"; 	//forward 방식(주소는 login_result로 바뀌지 않음)
		}
		
	}
	
	
	// 로그인 화면 요청
	@RequestMapping("/login")
	public String login() {
		
		
		return "member/login";
	}
	
	@RequestMapping("/second")
	public ModelAndView second() {
		ModelAndView model = new ModelAndView();
		String now = new SimpleDateFormat("a HH시 mm분 ss초").format(new Date());
		model.addObject("now", now);	//화면에 전달할 데이터 담기
		model.setViewName("index");		//응답할 화면명을 지정
		return model;
	}
	
	@RequestMapping("/first")
	public String first(Model model) {
		String today = new SimpleDateFormat("yyyy년 MM월 dd일").format(new Date());
		model.addAttribute("today", today);
		
		return "index";
	} //first()
} //class
