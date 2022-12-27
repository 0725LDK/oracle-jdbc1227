package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Board;

public class BoardDao {
	// 검색 추가
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, createdate"
				+ "			FROM (SELECT board_no, board_title, createdate"
				+ "					FROM board ORDER BY createdate DESC))"
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
	
	//board 추가
	public int insertBoard(Connection conn, Board board) throws Exception
	{
		int row = 0;
		
		String sql = "insert into board("
					+" board_no, board_title, board_content, member_id, updatedate, createdate) "
					+" values"
					+" (board_seq.nextval, ?, ?, ?, sysdate, sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//board 상세보기
	public Board oneBoard(Connection conn, int boardNo) throws Exception
	{
		
		
		String sql = "SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId, updatedate,createdate  from board where board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
		
		Board board = new Board();
		if(rs.next())
		{
			board.setBoardNo(rs.getInt("boardNo"));
			board.setBoardTitle(rs.getString("boardTitle"));
			board.setBoardContent(rs.getString("boardContent"));
			board.setMemberId(rs.getString("MemberId"));
			board.setUpdatedate(rs.getString("updatedate"));
			board.setCreatedate(rs.getString("createdate"));
		}
		return board;
	}
	
	//board 삭제
	public int deleteBoard(Connection conn, int boardNo) throws Exception
	{
		int row = 0;
		
		String sql = "delete board WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		row = stmt.executeUpdate();
		
		return row;
	}
	
	public Board updateBoard(Connection conn, int boardNo) throws Exception
	{
		Board board = null;
				
		return board;
	}
}
