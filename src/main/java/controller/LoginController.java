package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;


@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	
	//로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// VIEW -> /WEB-INF/view/member/login.jsp
		
		
		String msg = request.getParameter("msg");
		
		request.setAttribute("msg", msg);
		
		request.getRequestDispatcher("/WEB-INF/view/member/login.jsp").forward(request, response);
	
	}

	//로그인 액션
		
	// 로그인 세션 정보 : ex) session.setAttribute("loginMember", Member 타입)
	// view 없음 성공시 -> redirect(get 방식)-> /home (다른 컨트롤러)
	//로그인 액션
	private MemberService memberService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인전에만 진입가능
		HttpSession session = request.getSession();
		
		//로그인 전 : logineMember -> null
		//로그인 후 : logineMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null)//이미 로그인 상태
		{
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		//로그인폼에서 ID,PW 값 받기
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		Member paramMember = new Member();//request 파라미터값으로 바인딩
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		
		this.memberService = new MemberService();
		Member resultMember = memberService.login(paramMember);
		
		if(resultMember == null)//로그인 실패
		{
			response.sendRedirect(request.getContextPath()+"/member/login?msg="+0);
			return;
		}
		
		session.setAttribute("loginMember", resultMember);
		response.sendRedirect(request.getContextPath()+"/home");
	}

}
