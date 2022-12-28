package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;


@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글쓰기 폼
		String memberId = request.getParameter("memberId");
		
		request.setAttribute("memberId", memberId);
		request.getRequestDispatcher("/WEB-INF/view/board/boardInsertForm.jsp").forward(request, response);
	}


	//글쓰기 액션
	private BoardService boardService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//로그인 전 : logineMember -> null
		//로그인 후 : logineMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		request.setCharacterEncoding("utf-8");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String memberId = loginMember.getMemberId();
		
		Board board = new Board();
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setMemberId(memberId);
		
		//모델 호출
		BoardService boardService = new BoardService();
		boardService.getAddBoard(board);
		
		//뷰가없다
		response.sendRedirect(request.getContextPath()+"/board/boardList");
		
   }

}
