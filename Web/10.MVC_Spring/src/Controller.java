
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class Controller extends HttpServlet {

	protected void service(HttpServletRequest request, 
						   HttpServletResponse response)
		throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		
		Action action = null;
		ActionForward forward = null;
		
		if (command.equals("/employees.do")) {
			action = new PrintAction();
			forward = action.execute(request, response);
		}
		
		// 페이지 전환
		if(forward != null) {
			if(forward.isRedirect()) {	//true : sendRedirect() 전환
				response.sendRedirect(forward.getPath());
			} else {					//false : forward() 전환
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}
