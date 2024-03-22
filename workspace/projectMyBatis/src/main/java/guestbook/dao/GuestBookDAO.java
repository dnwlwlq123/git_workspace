package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import guestbook.dao.GuestBookDAO;
import guestbook.bean.GuestBookDTO;

public class GuestBookDAO {

	private Connection conn; // 커넥션은 인터페이스라 new 가 안됨
    private PreparedStatement pstmt;
    private ResultSet rs;

    /*private String driver = "oracle.jdbc.driver.OracleDriver";
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String username = "c##java";
    private String password = "1234";*/
    
    private DataSource ds;

    private static GuestBookDAO guestBookDAO = new GuestBookDAO();

    public static GuestBookDAO getInstance() {
        return guestBookDAO;
    }

    public GuestBookDAO() {
        /*try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }*/
    	
    	Context context;
    	try {
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //Tomcat의 경우: java:comp/env/
		} catch (NamingException e) {
			e.printStackTrace();
		}
    }

   /* public void getConnection() {
        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/
    
    public int guestBook(Map<String, String> map) {
    	int su = 0;
    	String sql = "insert into guestbook (seq, name, email, homepage, subject, content, logtime)values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
    	
    	
    	try {
    		conn = ds.getConnection();
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, map.get("name"));
	        pstmt.setString(2, map.get("email"));
	        pstmt.setString(3, map.get("homepage"));
	        pstmt.setString(4, map.get("subject"));
	        pstmt.setString(5, map.get("content"));
           
        	
        	su = pstmt.executeUpdate();

	    }catch (SQLException e) {
			e.printStackTrace();
		}finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
			}
		}
    	return su;
  }
    
    public List<GuestBookDTO> guestbookList(int startNum, int endNum){
   	 
   	 List<GuestBookDTO> list = new ArrayList<GuestBookDTO>();
   	 String sql= """
   	 		select*from
			(select rownum rn, tt.* from
			(select * from guestbook order by seq desc)tt
            )where rn>=? and rn<=?
   	 		""";
   	
   	 
   	 try {
   		conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestBookDTO guestBookDTO = new GuestBookDTO();
				guestBookDTO.setSeq(rs.getInt("seq"));
				guestBookDTO.setName(rs.getString("name"));
				guestBookDTO.setEmail(rs.getString("email"));
				guestBookDTO.setHomepage(rs.getString("homepage"));
				guestBookDTO.setSubject(rs.getString("subject"));
				guestBookDTO.setContent(rs.getString("content"));
				guestBookDTO.setLogtime(rs.getDate("logtime"));
				list.add(guestBookDTO);
			}//while
			
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
				}
			}
   	 
   	 return list;
    }
    public int getTotalA() {
	    	int totalA = 0;
	        String sql = "select count(*)from guestbook";
	       
	        
	        try {
	        	conn = ds.getConnection();
	        	pstmt = conn.prepareStatement(sql);
	        	rs = pstmt.executeQuery();
	            rs.next();
	            totalA = rs.getInt(1);

	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (pstmt != null) pstmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        return totalA;
	    }
}
