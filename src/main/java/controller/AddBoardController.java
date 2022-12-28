package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;


@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//글쓰기 폼
		request.getRequestDispatcher("/WEB-INF/view/board/boardInsertForm.jsp").forward(request, response);
	}


	//글쓰기 액션
	private BoardService boardService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String memberId = "goodee";//임시아이디
		
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
