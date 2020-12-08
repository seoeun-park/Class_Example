package memberListAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.member.study.MemberDAO;
import com.member.study.MemberDTO;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, 
								 HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if (id == null) {			//로그인이 되지 않았을 때
		// 로그인하지 않았을 때 url을 memberListAction.me로 바꿀 경우
			forward.setPath("memberLogin.me");
			forward.setRedirect(true);
			return forward;
		} else if (!id.equals("admin")) {	// 정상적인 접근이 아닐 경우
		// 관리자 아이디가 아닌 다른 아이디로 로그인했을 때 url에 memberListAction.me로 치고 들어갈 경우
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자가 아닙니다!');");
			out.println("location.href='boardList.bo';</script>");
			return null;	//위에서 페이지 전환을 했기 때문에
		} else {
		// 관리자 아이디로 로그인한 후, 회원관리 버튼을 눌렀을 경우
			/*
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('관리자로 로그인 하셨습니다!');</script>");
			*/
			MemberDAO dao = new MemberDAO();
			ArrayList<MemberDTO> list = new ArrayList<>(); 
			list = dao.getAllMember();
			request.setAttribute("list", list);

			forward.setPath("member/member_list.jsp");
			forward.setRedirect(false);
			
			return forward;
		}
	} //execute()
} //class
