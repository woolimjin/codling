package codling.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import codling.identity.Corporation;
import codling.identity.Individual;

public class InformationDao {
	final static String DB_URL = "jdbc:mysql://localhost:3306/codling";
	final static String DB_NAME = "codling";
	final static String DB_PASSWORD = "1234";
	
	static Connection conn;
	static PreparedStatement pstmt;
	static ResultSet rs;
	
	protected Connection getConnection() throws Exception {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, DB_NAME, DB_PASSWORD);
			return conn;
	}
	
	// 개인회원 ID 중복확인
	public boolean checkIndiId(String id) {
		boolean result = false;
		String query = "SELECT id FROM individual WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = true;
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("checkIndiId Error : " + e.getMessage());
		}
		return result;
	}
	
	// 기업회원 ID 중복확인
	public boolean checkCorpId(String id) {
		boolean result = false;
		String query = "SELECT id FROM corporation WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = true;
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("checkCorpId Error : " + e.getMessage());
		}
		return result;
	}
	
	// 개인회원 비밀번호
		public String getIndiPassword (String id) {
			String password = "";
			String query = "SELECT password FROM individual WHERE id = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) password = rs.getString("password");
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("getIndiPassword Error : " + e.getMessage());
			}
			return password;
		}
		
	// 기업회원 비밀번호
	public String getCorpPassword (String id) {
		String password = "";
		String query = "SELECT password FROM corporation WHERE id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) password = rs.getString("password");
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getCorpPassword Error : " + e.getMessage());
		}
		return password;
	}
	
	
	// 개인회원 이름
	public Map<String, String> getIndiName(String id) {
		Map<String, String> map = null;
		String query = "SELECT id, name FROM individual WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				map = new HashMap<String, String>();
				map.put(rs.getString("id"), rs.getString("name"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getIndiName Error : " + e.getMessage());
		}
		return map;
	}
	
	// 개인회원 이름
	public String getIndividualName(String id) {
		String name = "";
		String query = "SELECT name FROM individual WHERE id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("name");
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getIndividualName Error : " + e.getMessage());
		}
		return name;
	}
		
	// 기업회원 이름
	public Map<String, String> getCorpName(String id) {
		Map<String, String> map = null;
		String query = "SELECT id, corporateName FROM corporation WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				map = new HashMap<String, String>();
				map.put(rs.getString("id"), rs.getString("corporateName"));
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getCorpName Error : " + e.getMessage());
		}
		return map;
	}
	
	// 기업회원 이름
	public String getCorporationName(String id) {
		String name = "";
		String query = "SELECT corporateName FROM corporation WHERE id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString("corporateName");
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("getCorporationName Error : " + e.getMessage());
		}
		return name;
	}
	
	// 개인회원 삭제
	public boolean deleteIndividual(String id) {
		boolean result = false;
		String query = "DELETE FROM individual WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("deleteIndividual Error : " + e.getMessage());
		}
		return result;
	}
	
	// 개인회원 이름, 이메일, ID (ID 찾기 사용)
		public String findIndiId(String name, String email) {
			String id = "";
			String query = "SELECT id FROM individual WHERE name = ? AND email = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					id = rs.getString("id");
				}
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("findIndiId Error : " + e.getMessage());
			}
			return id;
		}
		
		// 개인회원 이름, 이메일, ID (ID 찾기 사용)
		public String findCorpId(String corporateName, String email) {
			String id = "";
			String query = "SELECT id FROM corporation WHERE corporateName = ? AND email = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, corporateName);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					id = rs.getString("id");
				}
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("findCorpId Error : " + e.getMessage());
			}
			return id;
		}
		
		// 개인회원 ID, 이메일 (비밀번호 찾기 사용)
		public boolean findIndiPassword(String id, String email) {
			boolean result = false;
			String query = "SELECT id FROM individual WHERE id = ? AND email = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) result = true;
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("findIndiPassword Error : " + e.getMessage());
			}
			return result;
		}
		
		// 개인회원 ID, 이메일 (비밀번호 찾기 사용)
		public boolean findCorpPassword(String id, String email) {
			boolean result = false;
			String query = "SELECT id FROM corporation WHERE id = ? AND email = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, email);
				rs = pstmt.executeQuery();
				
				if(rs.next()) result = true;
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("findCorpPassword Error : " + e.getMessage());
			}
			return result;
		}
		
		// 개인회원 비밀번호 변경
		public boolean updateIndiPassword(String id, String password) {
			boolean result = false;
			String query = "UPDATE individual SET password = ? WHERE id = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, password);
				pstmt.setString(2, id);
				
				if(pstmt.executeUpdate() == 1) result = true;
				
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("updateIndiPassword Error : " + e.getMessage());
			}
			
			return result;
		}
		
		// 기업회원 비밀번호 변경
		public boolean updateCorpPassword(String id, String password) {
			boolean result = false;
			String query = "UPDATE corporation SET password = ? WHERE id = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, password);
				pstmt.setString(2, id);
				
				if(pstmt.executeUpdate() == 1) result = true;
				
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("updateCorpPassword Error : " + e.getMessage());
			}
			
			return result;
		}
		
		// 개인회원 일치 여부
		public boolean checkIndiId (String id, String password) {
			boolean result = false;
			String query = "SELECT id FROM individual WHERE id = ? AND password = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				rs = pstmt.executeQuery();
				
				if(rs.next()) result = true;
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("checkIndiId Error : " + e.getMessage());
			}
			return result;
		}
		
		// 기업회원 일치 여부
		public boolean checkCorpId (String id, String password) {
			boolean result = false;
			String query = "SELECT id FROM corporation WHERE id = ? AND password = ?";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				rs = pstmt.executeQuery();
				
				if(rs.next()) result = true;
				
				rs.close();
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				System.out.println("checkCorpId Error : " + e.getMessage());
			}
			return result;
		}
	
	// 기업회원 삭제
	public boolean deleteCorporation(String id) {
		boolean result = false;
		String query = "DELETE FROM corporation WHERE id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			if(pstmt.executeUpdate() == 1) result = true;
			
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("deleteCorporation Error : " + e.getMessage());
		}
		return result;
	}
}