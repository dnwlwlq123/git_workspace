package board.dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import board.dao.BoardDAO;


public class BoardDAO {

private SqlSessionFactory sqlSessionFactory;
	
	private static BoardDAO boardDAO = new BoardDAO();
	
	public  static BoardDAO getInstance() { 
         return boardDAO;
     }
	
	public BoardDAO()   {
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
  
     public void BoardWrite(Map<String, String> map) {

    		SqlSession sqlSession = sqlSessionFactory.openSession();
    		sqlSession.insert("boardSQL.boardWrite", map);
    		sqlSession.commit();
    		sqlSession.close();
    		
	
	  }//boardWrite
     
     public List<BoardDTO> boardList(int startNum, int endNum) {
    	 Map<String, Integer> map = new HashMap<String, Integer>();
    	 map.put("startNum", startNum);
    	 map.put("endNum", endNum);
    	 
    	 SqlSession sqlSession = sqlSessionFactory.openSession();
    	 List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
    	 sqlSession.close();
    	 return list;    
    	}
     
     
     public int getTotalA() {
    	 	
    	 SqlSession sqlSession = sqlSessionFactory.openSession();
	    	int su = sqlSession.selectOne("boardSQL.getTotalA");
			sqlSession.close();

	    	return su;
     }
}
