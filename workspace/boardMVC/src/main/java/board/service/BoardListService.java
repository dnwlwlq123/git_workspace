package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		 // 데이터 X
	    int pg = Integer.parseInt(request.getParameter("pg"));

	    // 1페이지당 5개씩
	    int endNum = pg * 5;
	    int startNum = endNum - 4;
	    request.setAttribute("pg", pg);
	    
	    
	    // Set parameters in a Map
	    Map<String, Integer> map = new HashMap<>();
	    map.put("startNum", startNum);
	    map.put("endNum", endNum);

	    
	    
	    // DB - select
	    BoardDAO boardDAO = BoardDAO.getInstance();
	    List<BoardDTO> list = boardDAO.boardList(startNum, endNum);
	    request.setAttribute("list", list);
	    // 페이징 처리
	    int totalA = boardDAO.getTotalA(); // 총글수
	    int totalP = (totalA + 4) / 5; // 총 페이지수
	    request.setAttribute("totalA", totalA);
	    request.setAttribute("totalP", totalP);
	    
	    
	   
		
		return "/board/boardList.jsp";
	}

}
