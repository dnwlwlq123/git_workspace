<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="member.bean.MemberDTO"%>
   <%@ page import="member.dao.MemberDAO"%>
   
   <% 
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
	
   MemberDTO memberDTO = new MemberDTO();
    memberDTO.setId(id);
	memberDTO.setPwd(pwd);
	
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	String[] lo = memberDAO.login(memberDTO);
	String name = lo[0];
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(name != null){ %>
		<%=name %>로그인 되었습니다.
	<%}else{ %>
		아이디 또는 비밀번호가 틀렸습니다.
	<%} %>
</body>
</html>