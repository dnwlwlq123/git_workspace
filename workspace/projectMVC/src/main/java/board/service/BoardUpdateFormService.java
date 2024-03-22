package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		
		//DB
		//BoardDAO boardDAO = BoardDAO.getInstance();
		//BoardDTO boardDTO = boardDAO.getBoard(seq);
		
		request.setAttribute("pg", pg);
		request.setAttribute("seq", seq);
		//request.setAttribute("boardDTO", boardDTO);
		return "/board/boardUpdateForm.jsp";
	}

}
