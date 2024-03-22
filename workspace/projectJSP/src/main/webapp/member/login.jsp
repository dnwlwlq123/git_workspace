<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>

<%
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = new MemberDTO();

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

memberDTO = memberDAO.loginCheck(id,pwd);


%>



    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%if(memberDTO == null){ 
	response.sendRedirect("loginFail.jsp");


}else{
	response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(memberDTO.getName(), "UTF-8")+"&id="+id);
	
	//쿠키
	/*
	Cookie cookie = new Cookie("memName", memberDTO.getName());
	cookie.setMaxAge(30*60); //초단위 - 30분
	response.addCookie(cookie);//클라이언트로 보내기
	
	Cookie cookie2 = new Cookie("memId", id);
	cookie2.setMaxAge(30*60); //초단위 - 30분
	response.addCookie(cookie2);//클라이언트로 보내기
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
	*/
	//세션 
	//HttpSession session = request.getSession();
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id);
	

}%>

</body>
</html>