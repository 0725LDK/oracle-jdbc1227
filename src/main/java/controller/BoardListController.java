package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.*;
import vo.*;
import java.util.*;


@WebServlet("/board/boardList")
public class BoardListController extends HttpServlet {
	
	private BoardService boardService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//로그인 전 : logineMember -> null
		//로그인 후 : logineMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		String search = request.getParameter("search");
		ArrayList<Board> list = null;
		
		int firstPage = 1;
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
		
		int countBoard = 0;
		int lastPage = 0;
		BoardService BS = new BoardService();
		
		//검색어가 없을시 
		if(search == null)
		{
			countBoard = BS.getCountBoard();
			
			lastPage = countBoard / rowPerPage;
			if(countBoard % rowPerPage != 0)
			{
				lastPage= lastPage+1;
			}
			this.boardService = new BoardService();
			list = boardService.getBoardListByPage(currentPage, rowPerPage);
			System.out.println(countBoard+"<---BoardListCtrl 검색어X 총 board 열 수");
			System.out.println(lastPage+"<---BoardListCtrl 검색어X 마지막 페이지");
		}
		else if(search != null)
		{
			countBoard = BS.getCountBoard(search);
			
			lastPage = countBoard / rowPerPage;
			if(countBoard % rowPerPage != 0)
			{
				lastPage= lastPage+1;
			}
			this.boardService = new BoardService();
			list = boardService.getSearchBoardListByPage(currentPage, rowPerPage, search);
			System.out.println(countBoard+"<---BoardListCtrl 검색어O 총 board 열 수");
			System.out.println(lastPage+"<---BoardListCtrl 검색어O 마지막 페이지");
		}
		
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage); //view에서 필요
		request.setAttribute("rowPerPage", rowPerPage);  //view에서 필요
		request.setAttribute("firstPage", firstPage);  //view에서 필요
		request.setAttribute("lastPage", lastPage);  //view에서 필요
  
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}
}