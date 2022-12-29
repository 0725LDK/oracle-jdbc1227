package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import vo.*;


@WebServlet("/home")
public class HomeController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//메인페이지
		
		// VIEW -> /WEB-INF/view/home.jsp
		
		//메뉴 구성(로그인 전 / 후에 따라 분기)
		//로그인 전
		//1) 회원가입
		//2) 로그인 안하면 홈말고 아무것도 못봄
		
		//로그인 후
		//1) 로그아웃
		//2) 회원정보
		//3) 게시판 리스트
		String msg = request.getParameter("msg");
		request.setAttribute("msg", msg);
		HttpSession session = request.getSession();
		//로그인 전 : logineMember -> null
		//로그인 후 : logineMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		request.getRequestDispatcher("/WEB-INF/view/member/home.jsp").forward(request, response);
	}


}
