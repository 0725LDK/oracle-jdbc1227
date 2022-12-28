package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;


@WebServlet("/member/memberOne")
public class MemberOneController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// VIEW -> /WEB-INF/view/member/memberOne.jsp
		//
		// 메뉴구성
		// 1) 회원정보 수정
		// 2) 회원 탈퇴
		
		HttpSession session = request.getSession();
		//로그인 전 : logineMember -> null
		//로그인 후 : logineMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		request.getRequestDispatcher("/WEB-INF/view/member/oneMember.jsp").forward(request, response);
	}

	

}
