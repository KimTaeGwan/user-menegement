package jsp.memberInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import jsp.db.DBconnection;

public class MemberInfoDAO {
	private static MemberInfoDAO instance;
	
	private MemberInfoDAO(){}
	public static MemberInfoDAO getInstance() {
		if(instance == null) instance = new MemberInfoDAO();
		return instance;
	}
	
	/*
	 * 로그인 한 회원 정보를 가져온다
	*/
	public MemberInfoBean getMemberInfo(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		MemberInfoBean member = new MemberInfoBean();
		try{
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM memberInfo WHERE memberId = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setId(rs.getString("memberId"));
				member.setPw(rs.getString("memberPw"));
				member.setName(rs.getString("memberName"));
				member.setGender(rs.getString("memberGender"));
				member.setBirth(rs.getString("memberBirth"));
				member.setPhone(rs.getString("memberPhone"));
			}
			
		} catch(ClassNotFoundException | SQLException e) {	
			try{
				conn.rollback();
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}	
			System.out.println(e.getMessage());
		} finally { 
			try { 
				if ( pstmt != null) { pstmt.close(); pstmt = null;} 
				if ( conn != null) { conn.close(); conn = null; }
				if (rs !=null ) { rs.close(); rs=null; }
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage()); 
			} 
		}
		return member;
	}
	
	/*
	 * 아이디 중복 체크
	 * 중복되면 true
	*/
	public Boolean overlapIdCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Boolean isOverlap = false;
		try{
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM memberInfo WHERE memberId = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isOverlap = true;
			}
		} catch(ClassNotFoundException | SQLException e) {	
			try{
				conn.rollback();
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}	
			System.out.println(e.getMessage());
		} finally { 
			try { 
				if ( pstmt != null) { pstmt.close(); pstmt = null;} 
				if ( conn != null) { conn.close(); conn = null; }
				if (rs !=null ) { rs.close(); rs=null; }
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage()); 
			} 
		}
		return isOverlap;
	}
	
	/*
	 * 로그인 화면
	 * 아이디와 비밀번호가 일치하면 true
	*/
	public Boolean loginCheck(String id,String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Boolean isLogin = false;

		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * FROM memberInfo WHERE memberId = ? AND memberPw = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isLogin = true;
			}
		} catch (ClassNotFoundException | SQLException e) {	
				e.printStackTrace();
		} finally { 
			try { 
				if ( pstmt != null) { pstmt.close(); pstmt = null;} 
				if ( conn != null) { conn.close(); conn = null; }
				if (rs !=null ) { rs.close(); rs=null; }
			} catch (SQLException sqle) {
			  System.out.println(sqle.getMessage()); } 
		}
		return isLogin;
	}
	
	/*
	 * 생년월일을 받아서 현재 나이 계산
	*/
	public Integer memberAge(MemberInfoBean member) {
		Calendar cal = Calendar.getInstance();
		int curYear = cal.get(Calendar.YEAR);
	
		String onlyYear = member.getBirth().substring(0,4);	
		int memberAge = curYear - Integer.parseInt(onlyYear) + 1;
		
		return memberAge;
	}
	
	/*
	 * 회원가입
	*/
	public void insertMember(MemberInfoBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO memberInfo VALUES");
			sql.append("(?,?,?,?,?,?,?,?,?)");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			conn.setAutoCommit(false);
		
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirth());
			pstmt.setInt(6, memberAge(member));
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, null);
			//pstmt.setString(8, member.getFilePath());
			pstmt.setString(9, null);
			//pstmt.setString(9, member.getFileName());
			
			pstmt.executeUpdate();
			
			conn.commit();
			
		}catch(ClassNotFoundException | SQLException e) {	
			try{
				conn.rollback();
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}	
			System.out.println(e.getMessage());
		} finally { 
			try { 
				if ( pstmt != null) { pstmt.close(); pstmt = null;} 
				if ( conn != null) { conn.close(); conn = null; }
			} catch (SQLException sqle) {
			  System.out.println(sqle.getMessage()); } 
		}
	}
	
	public void updateMember(MemberInfoBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE memberInfo SET");
			sql.append(" memberPw = ?");
			sql.append(" WHERE memberId = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getId());
			
			pstmt.executeUpdate();
			
			conn.commit();
			
		}catch(ClassNotFoundException | SQLException e) {	
			try{
				conn.rollback();
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}	
			System.out.println(e.getMessage());
		} finally { 
			try { 
				if ( pstmt != null) { pstmt.close(); pstmt = null;} 
				if ( conn != null) { conn.close(); conn = null; }
			} catch (SQLException sqle) {
			  System.out.println(sqle.getMessage()); } 
		}
	}
	
	public void deleteMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM memberInfo WHERE memberId = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
			conn.commit();
			
		}catch(ClassNotFoundException | SQLException e) {	
			try{
				conn.rollback();
			} catch (SQLException sqle) {
				System.out.println(sqle.getMessage());
			}	
			System.out.println(e.getMessage());
		} finally { 
			try { 
				if ( pstmt != null) { pstmt.close(); pstmt = null;} 
				if ( conn != null) { conn.close(); conn = null; }
			} catch (SQLException sqle) {
			  System.out.println(sqle.getMessage()); } 
		}
	}
}
