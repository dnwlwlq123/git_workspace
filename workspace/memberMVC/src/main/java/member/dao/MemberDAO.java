package member.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;


public class MemberDAO {
private SqlSessionFactory sqlSessionFactory;
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	public  static MemberDAO getInstance() { 
         return memberDAO;
     }
	
	public MemberDAO()   {
		try {
			//문자단위
			//Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			//sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			
			//바이트단위
			String resource = "mybatis-config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

        public boolean isExistId(String id) {
        	boolean exist = false;
        	SqlSession sqlSession = sqlSessionFactory.openSession();
    		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMemberList", id);
    		sqlSession.close();
    		if(memberDTO != null) {
    			exist = true;
    		}
    		return exist;
        	
        }

	
	    public int write(MemberDTO memberDTO) {
	    	
	    	SqlSession sqlSession = sqlSessionFactory.openSession();	 //생성	
			int su = sqlSession.insert("memberSQL.write", memberDTO);
			sqlSession.commit();
			sqlSession.close();
			return su;
	    	
	  }

	    public boolean login(String id) {
	    	
	    	SqlSession sqlSession = sqlSessionFactory.openSession();
			MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", id);
			sqlSession.close();
			
			if(memberDTO.getId()==id) {
				return false;
			}
			return true;
		    	
	    }
	    
	    
	    public MemberDTO login2(String id, String pwd) {
	    	SqlSession sqlSession = sqlSessionFactory.openSession();
	    	MemberDTO memberDTO = new MemberDTO();
			memberDTO.setId(id);
	    	memberDTO.setPwd(pwd);
	    	memberDTO = sqlSession.selectOne("memberSQL.login2", memberDTO);
			sqlSession.close();

	    	return memberDTO;
	    }
	    
	    public MemberDTO getMember(String id) {
	    	SqlSession sqlSession = sqlSessionFactory.openSession();
	    	MemberDTO memberDTO = new MemberDTO();
	    	memberDTO = sqlSession.selectOne("memberSQL.getMember", id);
			sqlSession.close();
	    	
	    	return memberDTO;
	    }
	    
	    public void update(MemberDTO memberDTO) {
	      
	        SqlSession sqlSession = sqlSessionFactory.openSession();
			sqlSession.update("memberSQL.update", memberDTO);
			sqlSession.commit();
			sqlSession.close();
	       
	    }
    
	    
}