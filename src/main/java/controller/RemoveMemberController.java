package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RemoveMemberController
 */
@WebServlet("/RemoveMemberController")
public class RemoveMemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원탈퇴 폼
		// VIEW -> /WEB-INF/view/member/modifyMember.jsp
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원탈퇴 액션
		// view 없음 성공시 -> redirect(get 방식)-> /member/logout (다른 컨트롤러)
	}

}
