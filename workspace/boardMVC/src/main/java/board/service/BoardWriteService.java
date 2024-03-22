package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardWriteService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
	    //데이터
		
		String id = "hong";
		String name = "hong";
		String email = "dndfdfwlq@naver.com";
	    String subject = request.getParameter("subject");
	    String content = request.getParameter("content");
	    
	    
	    
	    
	    //세션
	  
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		map.put("subject", subject);
		map.put("content", content);
		
	    
	    BoardDTO boardDTO= new BoardDTO();
	    
	    boardDTO.setId(id);
	    boardDTO.setName(name);
	    boardDTO.setEmail(email);
	    boardDTO.setSubject(subject);
	    boardDTO.setContent(content);
	    

	    BoardDAO boardDAO = BoardDAO.getInstance(); // 생성
	    boardDAO.BoardWrite(map);
		
		
		return "/board/boardWrite.jsp";
	}

}
