package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.*;
import vo.*;
import java.util.*;


@WebServlet("/board/boardList")
public class BoardListController extends HttpServlet {
	
	private BoardService boardService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		if(request.getParameter("currentPage") != null)
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null)
		{
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		this.boardService = new BoardService();
		ArrayList<Board> list = boardService.getBoardListByPage(currentPage, rowPerPage);
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage); //view에서 필요
		request.setAttribute("rowPerPage", rowPerPage);  //view에서 필요
  
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
   }
}