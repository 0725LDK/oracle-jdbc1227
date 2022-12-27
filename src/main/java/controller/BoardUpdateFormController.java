package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BoardUpdateFormController")
public class BoardUpdateFormController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("업데이트폼컨트롤러 접속");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		request.setAttribute("boardNo", boardNo);
		
		request.getRequestDispatcher("/WEB-INF/view/boardUpdateForm.jsp").forward(request, response);
	}

	

}
