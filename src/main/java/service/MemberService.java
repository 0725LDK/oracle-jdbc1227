package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import util.DBUtil;
import vo.*;

public class MemberService {
	private MemberDao memberDao;
	
	//로그인 서비스
	public Member login(Member paramMember)
	{
		this.memberDao = new MemberDao();
		Member resultMember = null;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			resultMember = memberDao.selectMemberByIdAndPw(conn, paramMember);
			conn.commit();
			System.out.println("memberService_login 성공");
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
		return resultMember;
	}
	
	//회원가입 서비스
	public int addMember(Member member)
	{
		this.memberDao = new MemberDao();
		int row = 0;
		Connection conn= null;
		
		try {
			conn = DBUtil.getConnection();
			row = memberDao.addMember(conn, member);
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
	
	//회원정보 수정 서비스
	public int modifyMember(Member member)
	{
		this.memberDao = new MemberDao();
		int row = 0;
		Connection conn = null;
		
		try {
			conn = DBUtil.getConnection();
			row = memberDao.modifyMember(conn, member);
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
	
	//회원정보 수정 서비스
		public int removeMember(Member member)
		{
			this.memberDao = new MemberDao();
			int row = 0;
			Connection conn = null;
			
			try {
				conn = DBUtil.getConnection();
				row = memberDao.removeMember(conn, member);
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
