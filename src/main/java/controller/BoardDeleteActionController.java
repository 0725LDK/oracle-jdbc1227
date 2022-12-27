package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;


@WebServlet("/BoardDeleteActionController")
public class BoardDeleteActionController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardService boardService = new BoardService();
		int row = boardService.getDeleteBoard(boardNo);
		if(row != 1)
		{
			System.out.println("삭제실패");
		}
		
		response.sendRedirect(request.getContextPath()+"/BoardListController");
	}

	

}
