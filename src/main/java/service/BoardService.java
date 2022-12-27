package service;
import vo.*;
import dao.*;
import util.DBUtil;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

public class BoardService {
	private BoardDao boardDao;
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage)
	{
		/*
			1) connection 생성 <- DBUTil.class
			2) beginRow, endRow 생성 <- currentPage, RowPerPage를 가공
		 */
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage-1)*rowPerPage+1;
			int endRow = currentPage * rowPerPage;
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
}
