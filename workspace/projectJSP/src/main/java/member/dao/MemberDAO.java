package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "1234";
	
	private static MemberDAO memberDAO = new MemberDAO();
	public static MemberDAO getInstance() {
		return memberDAO;
	}
	public MemberDAO() {
		try {
			Class.forName(driver);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,username,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isExistId(String id) {
		boolean exist = false;
		
		String sql= "select * from member where id=?";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				exist=true;
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt !=null)pstmt.close();
				if(conn !=null)conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return exist ;
		
	}
	
	public MemberDTO loginCheck(String id,String pwd) {
		
		String sql="select * from member where id=? and pwd=?";
		getConnection();
		MemberDTO memberDTO = new MemberDTO();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs= pstmt.executeQuery();
		
			if(rs.next()) {
				
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt !=null)pstmt.close();
				if(conn !=null)conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		return memberDTO;
	}
	
	public int write(MemberDTO memberDTO) {
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		int su=0;
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());
			
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null)pstmt.close();
				if(conn !=null)conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
		}
		return su;
	}
	
	public int update(MemberDTO memberDTO) {
		int su=0;
		String sql = """
				update member set name=?
								, pwd=?
								, gender=?
								, email1=?
								, email2=?
								, tel1=?
								, tel2=?
								, tel3=?
								, zipcode=?
								, addr1=?
								, addr2=?
				where id=?
				
					""";
		getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getPwd());
			pstmt.setString(3, memberDTO.getGender());
			pstmt.setString(4, memberDTO.getEmail1());
			pstmt.setString(5, memberDTO.getEmail2());
			pstmt.setString(6, memberDTO.getTel1());
			pstmt.setString(7, memberDTO.getTel2());
			pstmt.setString(8, memberDTO.getTel3());
			pstmt.setString(9, memberDTO.getZipcode());
			pstmt.setString(10, memberDTO.getAddr1());
			pstmt.setString(11, memberDTO.getAddr2());
			pstmt.setString(12, memberDTO.getId());
			
			su =pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				if(pstmt !=null)pstmt.close();
				if(conn !=null)conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
		}
		return su;
	}
	
	public MemberDTO getMember(String id) {
		
		MemberDTO memberDTO =new MemberDTO();
		String sql = "select * from member where id=?";
		getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDTO.setName(rs.getString("name"));
				memberDTO.setId(rs.getString("id"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setZipcode(rs.getString("zipcode"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt !=null)pstmt.close();
				if(conn !=null)conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		
		
		
		}
		return memberDTO;
		
		
	}
	
	
}

