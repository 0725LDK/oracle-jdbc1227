package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.*;

public class MemberDao {
	//로그인 메소드
	public Member selectMemberByIdAndPw(Connection conn, Member paramMember) throws Exception
	{
		Member resultMember = null;
		String sql = "SELECT member_id memberId, member_pw memberPw, member_name memberName FROM member WHERE member_id= ? AND member_pw= ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next())
		{
			resultMember = new Member();
			resultMember.setMemberId(rs.getString("memberId"));
			resultMember.setMemberPw(rs.getString("memberPw"));
			resultMember.setMemberName(rs.getString("memberName"));
		}
		
		return resultMember;
	}
	
	//회원가입
	public int addMember(Connection conn, Member member) throws Exception
	{
		int row = 0;
		
		String sql = "INSERT into member(member_id,member_pw,member_name, updatedate, createdate) VALUES( ? , ? , ? ,sysdate,sysdate)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		row = stmt.executeUpdate();
		
		return row;
	}
	
	//회원정보 수정
	public int modifyMember(Connection conn, Member member) throws Exception
	{
		int row = 0;
		String sql = "UPDATE member set member_name = ? , updatedate = sysdate where member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberName());
		stmt.setString(2, member.getMemberId());
		row = stmt.executeUpdate();
		return row;
	}
	
	//회원탈퇴
	
	public int removeMember(Connection conn, Member member) throws Exception
	{
		int row = 0;
		String sql = "delete from member where member_id= ? and member_pw= ? ";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		row = stmt.executeUpdate();
		return row;
	}
}
