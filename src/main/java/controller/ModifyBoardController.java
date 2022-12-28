package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;


@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	
	//글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("업데이트폼컨트롤러 접속");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		request.setAttribute("boardNo", boardNo);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardUpdateForm.jsp").forward(request, response);
	}


	//글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		
		Board board = new Board();
		board.setBoardNo(boardNo);
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		
		BoardService boardService = new BoardService();
		boardService.getUpdateBoard(board);
		
		response.sendRedirect(request.getContextPath()+"/board/boardList");
		
	}

}
