package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

public class BoardService {
	private BoardDao boardDao;
	
	//검색어 없을시 board 총 행수 출력
	public int getCountBoard(String search)
	{
		this.boardDao = new BoardDao();
		int row = 0;
		Connection conn = null;
		
		try {
			conn=DBUtil.getConnection();
			row = boardDao.searchCountBoard(conn, search);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//검색어 있을시 board 총 행수 출력
	public int getCountBoard()
	{
		this.boardDao = new BoardDao();
		int row = 0;
		Connection conn = null;
		
		try {
			conn=DBUtil.getConnection();
			row = boardDao.countBoard(conn);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//검색어 있을시  board list출력
	public ArrayList<Board> getSearchBoardListByPage(int currentPage, int rowPerPage, String search) {
		/*
		 	1) connection 생성 <- DBUtil.class
		 	2) beginRow, endRow 생성 <- currentPage,rowPerPage를 가공
		 */
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage-1)*rowPerPage+1;
			int endRow = beginRow + rowPerPage - 1;
			boardDao = new BoardDao();
			list = boardDao.searchBoardListByPage(conn, beginRow, endRow, search);
			conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
		} catch (Exception e) {
			try {
				conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	// 검색어 없을시 board list출력
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage) {
		/*
		 	1) connection 생성 <- DBUtil.class
		 	2) beginRow, endRow 생성 <- currentPage,rowPerPage를 가공
		 */
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			int beginRow = (currentPage-1)*rowPerPage+1;
			int endRow = beginRow + rowPerPage - 1;
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
			conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
		} catch (Exception e) {
			try {
				conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//board 추가
	public int getAddBoard(Board board)
	{
		boardDao = new BoardDao();
		int row = 0;
		Connection conn = null;
		try {
			conn=DBUtil.getConnection();
			row = boardDao.insertBoard(conn, board);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//board 상세보기
	public Board getOneBoard(int boardNo) 
	{
		boardDao = new BoardDao();
		Board board = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			board = boardDao.oneBoard(conn, boardNo);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	
	//board 삭제
	public int getDeleteBoard(int boardNo)
	{
		
		int row = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			row = boardDao.deleteBoard(conn, boardNo);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	//board 수정
	public int getUpdateBoard(Board board)
	{
		BoardDao boardDao = new BoardDao();
		int row = 0;
		Connection conn = null;
				
		try {
			conn = DBUtil.getConnection();
			row = boardDao.updateBoard(conn, board);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}

















