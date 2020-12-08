import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PrintAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		DAO dao = new DAO();
		ArrayList<DTO> list = dao.print();
		request.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("view.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
