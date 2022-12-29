package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Board;

public class BoardDao {
	//검색어 없을때 board 총 행수
	public int countBoard (Connection conn) throws Exception
	{
		int row = 0;
		
		String sql = "SELECT COUNT(*) FROM board";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next())
		{
			row = rs.getInt("COUNT(*)");
		}
		
		return row;
	}
	
	//검색어 있을때 board 총 행수
	public int searchCountBoard (Connection conn, String search) throws Exception
	{
		int row = 0;
		
		String sql = "SELECT COUNT(*) FROM board WHERE board_title like ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		ResultSet rs = stmt.executeQuery();
		if(rs.next())
		{
			row = rs.getInt("COUNT(*)");
		}
		
		return row;
	}
	
	//겁색어 있을때
	public ArrayList<Board> searchBoardListByPage(Connection conn, int beginRow, int endRow,  String search) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate, updatedate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, member_id ,createdate, updatedate" 
				+ " 	FROM (SELECT board_no, board_title, member_id ,createdate, updatedate "
				+ "			FROM board WHERE board_title like ? ORDER BY createdate DESC))"
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			b.setUpdatedate(rs.getString("updatedate"));
			list.add(b);
		}
		return list;
	}
	// 검색어 없을때
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate, updatedate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, member_id ,createdate, updatedate" 
				+ " 	FROM (SELECT board_no, board_title, member_id ,createdate, updatedate "
				+ "			FROM board ORDER BY createdate DESC))"
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setMemberId(rs.getString("memberId"));
			b.setCreatedate(rs.getString("createdate"));
			b.setUpdatedate(rs.getString("updatedate"));
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
	
	public int updateBoard(Connection conn, Board board) throws Exception
	{
		int row = 0;
		
		String sql = "update board set board_title = ?, board_content = ?, updatedate=sysdate where board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setInt(3, board.getBoardNo());

		row = stmt.executeUpdate();
		
		return row;
	}
}
