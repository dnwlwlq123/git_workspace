package user.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory;
	
	private static UserDAO userDAO = new UserDAO();
	
	public  static UserDAO getInstance() { 
         return userDAO;
     }
	
	public UserDAO()   {
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

	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();	 //생성	
		sqlSession.insert("userSQL.write", userDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public List<UserDTO> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUserList");
		sqlSession.close();
		return list;
	}


	public UserDTO updateCheckId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.updateCheckId", id);
		sqlSession.close();
		return userDTO;
	}

	public void update(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("userSQL.update", userDTO);
		sqlSession.commit();
		sqlSession.close();

	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
		
		
	}

	public List<UserDTO> search(Map<String, String> searchMap) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search", searchMap);
		sqlSession.close();
		return list;
	}

	
}
