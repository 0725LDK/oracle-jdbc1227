package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;


@WebServlet("/member/logout")
public class LogoutController extends HttpServlet {
	
	// 로그인 세션 정보 삭제: ex) session.invelidate
	// view 없음 성공시 -> redirect(get 방식)-> /home (다른 컨트롤러)
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String msg = "1";
		if(request.getParameter("msg") != null)
		{
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/home?msg="+msg);
	}

	

}
