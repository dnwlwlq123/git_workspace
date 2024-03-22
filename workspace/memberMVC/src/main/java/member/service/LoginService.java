package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.dao.MemberDAO;
import member.bean.MemberDTO;

public class LoginService implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		   
		//DB
		 MemberDAO memberDAO = MemberDAO.getInstance(); // 생성 
		 MemberDTO memberDTO = memberDAO.login2(id,pwd);
		//응답
		 if(memberDTO == null) 
		return "/member/loginFail.jsp";
		 else {
			HttpSession session = request.getSession(); 
				session.setAttribute("memName", memberDTO.getName());
				session.setAttribute("memId", id);
				String email = memberDTO.getEmail1()+"@"+memberDTO.getEmail2();
				session.setAttribute("memEmail", email);
				
				return "/member/loginOk.jsp";
			 
		 }
	}

}
