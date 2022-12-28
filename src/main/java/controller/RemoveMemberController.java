package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import vo.Member;

/**
 * Servlet implementation class RemoveMemberController
 */
@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원탈퇴 폼
		// VIEW -> /WEB-INF/view/member/removerMember.jsp
		request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원탈퇴 액션
		// view 없음 성공시 -> redirect(get 방식)-> /member/logout (다른 컨트롤러)
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		
		int row = 1;
		MemberService memberService = new MemberService();
		row = memberService.removeMember(member);
		
		if(row ==0)
		{
			System.out.println("removeMember 실패");
			response.sendRedirect(request.getContextPath()+"/member/removeMember?memberId="+memberId);
			return;
		}
		response.sendRedirect(request.getContextPath()+"/member/logout");
	}

}
