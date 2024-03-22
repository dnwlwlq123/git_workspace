package board.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		int seq = Integer.parseInt(request.getParameter("seq"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		//DB
		Map<String, Object> map = new HashMap<>();
		map.put("seq", seq);
		map.put("subject", subject);
		map.put("content", content);
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardUpdate(map);
		
		return "/board/boardUpdate.jsp";
	}

}
