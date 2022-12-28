package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;


@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정 폼
		// VIEW -> /WEB-INF/view/member/modifyMember.jsp
		
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정 액션
		// view 없음 성공시 -> redirect(get 방식)-> /memberOne (다른 컨트롤러)
		
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberName(memberName);
		
		HttpSession session = request.getSession();
		//로그인 전 : logineMember -> null
		//로그인 후 : logineMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		loginMember.setMemberName(memberName);
		
		MemberService memberService = new MemberService();
		memberService.modifyMember(member);
		
		response.sendRedirect(request.getContextPath()+"/member/memberOne?memberId="+member.getMemberId());
		
		
	}

}
