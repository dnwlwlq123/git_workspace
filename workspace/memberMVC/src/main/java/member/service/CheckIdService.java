package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		 String id = request.getParameter("id");

	      
	      MemberDAO memberDAO = MemberDAO.getInstance(); // 생성
	      boolean exist = memberDAO.isExistId(id);
	      

	      String exist_a;
	     
	      if(exist){
	   	   exist_a = "exist";
	   	   
	      }else{
	   	   exist_a = "non_exist";
	      }  
	      request.setAttribute("exist_a", exist_a);
		
		return "/member/checkId.jsp";
	}

}
