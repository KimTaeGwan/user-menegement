package jsp.userInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import jsp.db.DBconnection;

public class UserInfoDAO {
private static UserInfoDAO instance;
	
	private UserInfoDAO() {}
	public static UserInfoDAO getInstance() {
		if(instance == null) instance = new UserInfoDAO();
		return instance;
	}
	
	
	// 회원 ID 자동 생성
	public String createId() {
		String data = getToday();
		
		Integer serial = checkNumberOfData();
		String number = String.format("%04d", serial);
		
		String id = data + number;
		
		return id;
	}
	
	// 현재 날짜 구하기
	public String getToday() {
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		String formatTime = fm.format(cal.getTime());
		
		return formatTime;
	}
	// id 찾기 (이름, 연락처)
	public String getId(UserInfoBean user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String id = "";
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * "
					+ "FROM USERMG "
					+ "WHERE NAME = ? AND PH = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPh());
			
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				id = rs.getString("ID");
			}
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) { pstmt.close(); pstmt = null;}
				if(conn != null) { conn.close(); conn = null;}
				if(rs != null) { rs.close(); rs = null;}
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return id; 
	}
	// 회원 가입한 여부
	public boolean isJoinUser(UserInfoBean user){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean isJoinUser = false;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT * "
					+ "FROM USERMG "
					+ "WHERE NAME = ? AND PH = ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPh());
			
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				isJoinUser = true;
			}
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) { pstmt.close(); pstmt = null;}
				if(conn != null) { conn.close(); conn = null;}
				if(rs != null) { rs.close(); rs = null;}
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return isJoinUser;
	}
	
	// 오늘 가입한 데이터 갯수 확인
	public int checkNumberOfData() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int getRow = 0;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(*) "
					+ "FROM USERMG "
					+ "WHERE CREATE_DATE LIKE ?");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, getToday());
			
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				getRow = rs.getInt(1);
			}
		}catch (ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) { pstmt.close(); pstmt = null;}
				if(conn != null) { conn.close(); conn = null;}
				if(rs != null) { rs.close(); rs = null;}
			}catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		
		return getRow;
	}
	
	// 회원 정보 기입
	public void insertUser(UserInfoBean user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO USERMG VALUES");
			sql.append("(?,?,?,?,?)");
			
			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			
			conn.setAutoCommit(false);
			
			user.setId(createId());
			user.setCREATE_DATE(getToday());
			
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getPh());
			pstmt.setString(4, user.getArea());
			pstmt.setString(5, user.getCREATE_DATE());
			
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
