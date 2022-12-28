package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;


@WebServlet("/BoardOneActionController")
public class BoardOneActionController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new Board();
		BoardService boardService = new BoardService();
		board = boardService.getOneBoard(boardNo);
		
		board.setBoardNo(board.getBoardNo());
		board.setBoardTitle(board.getBoardTitle());
		board.setBoardContent(board.getBoardContent());
		board.setMemberId(board.getMemberId());
		board.setUpdatedate(board.getUpdatedate());
		board.setCreatedate(board.getCreatedate());
		
		request.setAttribute("board", board);
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp").forward(request, response);
	}

	

}