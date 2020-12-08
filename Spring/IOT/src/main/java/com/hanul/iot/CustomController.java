package com.hanul.iot;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import customer.CustomerServiceimpl;
import customer.CustomerVO;

@Controller
public class CustomController {
	@Autowired private CustomerServiceimpl service;
	
	//고객정보삭제 처리 요청
	@RequestMapping("/delete.cu")
	public String delete(int id) {
		//해당 고객정보를 DB에서 삭제한 후 목록 화면으로 연결
		service.customer_delete(id);
		
		return "redirect:list.cu";
		//return "list.jsp"로 할 경우 url는 delete.cu로 그대로 남아있고 화면만 전환됨
		//return "list.cu"로 할 경우 list.cu.jsp를 찾게 되므로 redirect를 앞에 붙여야 한다.
	}
	
	// 고객 정보 수정 저장 처리 요청
	@RequestMapping("/update.cu")
	public String update(CustomerVO vo) {
		//화면에서 변경한 정보를 DB에 저장한 후
		//화면으로 연결
		service.customer_update(vo);
		
		return "redirect:detail.cu?id=" + vo.getId();
	}
	
	
	// 고객 정보 수정 화면 요청
	@RequestMapping("/modify.cu")
	public String modify(Model model, int id) {
		//해당 고객의 정보를 DB에서 조회해와
		//수정 화면에 출력한다.
		model.addAttribute("vo", service.customer_detail(id));
		
		return "customer/modify";
	}
	
	//고객 상세 화면 요청
	@RequestMapping("/detail.cu")
	public String detail(Model model, int id) {
		//선택한 고객의 정보를 DB에서 조회해와 
		//상세화면에 출력한다
		model.addAttribute("vo", service.customer_detail(id));
		
		return "customer/detail";
	}
	
	//신규 고객 등록 처리 요청
	@RequestMapping("/insert.cu")
	public String insert(CustomerVO vo) {
		//화면에 입력한 정보들을 DB에 저장한 후 화면으로 연결
		service.customer_insert(vo);
		
		//return "customer/list";		//forward 방식
		// → 주소가 insert.cu로 그대로 유지 → 새로고침할때마다 저장이 되버리므로 
		//	 redirect 방식으로 url을 바꿔야 함 
		return "redirect:list.cu";
	}
	
	//신규 고객 등록 화면 요청
	@RequestMapping("/new.cu")
	public String customer() {
		
		
		return "customer/new";
	}
	
	//고객 목록 화면 요청
	@RequestMapping("/list.cu")
	public String list(Model model, HttpSession session) {
		session.setAttribute("category", "cu");
		
		//DB에서 고객목록을 조회애와 목록화면에 출력할 수 있도록 한다.
		List<CustomerVO> list = service.customer_list();
		model.addAttribute("list", list);
		
		return "customer/list";
	}
}
