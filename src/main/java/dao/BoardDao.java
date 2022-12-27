package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import vo.*;

public class BoardDao {
	//검색추가
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception
	{
		ArrayList<Board> list = new ArrayList<Board>();
		
		String sql = "SELECT board_no boardNo, board_title boardTitle, createdate"
				+ "	FROM (SELECT rownum rnum, board_no, board_title createdate"
				+ " 	FROM (SELECT board_no, board_title, createdate"
				+ "				FROM board ORDER BY board_no DESC))"
				+ " WHERE rnum BETWEEN ? AND ?";//WHERE rnum>=? AND rnum<=?
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next())
		{
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			list.add(b);
		}
		return list;
	}
	
	
	public int insertBoard(Connection conn, Board board)
	{
		String sql = "insert into board("
					+" board_no, board_title, board_content, member_id, updatedate, createdate) "
					+" values"
					+" (board_seq.nextval, ?, ?, ?, sysdate, sysdate)";
		return 0;
	}
}
