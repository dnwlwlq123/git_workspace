<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLEncoder"%>
    <%@page import="member.dao.MemberDAO"%>
    <%@page import="member.bean.MemberDTO"%>
    <%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    
    MemberDTO memberDTO= new MemberDTO();
   

    MemberDAO memberDAO = MemberDAO.getInstance(); // 생성
    //boolean exist = memberDAO.login(memberDTO);
    memberDTO = memberDAO.login2(id,pwd);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%if(exist){ 
	//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(memberDTO.getName(),"UTF-8")+"&id="+id);
	
	//쿠키
	Cookie cookie = new Cookie("memName", memberDTO.getName());
	cookie.setMaxAge(3); // 3초
	response.addCookie(cookie); 
	
	Cookie cookie2 = new Cookie("memId", id);
	cookie2.setMaxAge(3); // 3초
	response.addCookie(cookie2);
	//세션
	response.sendRedirect("loginOk.jsp");
	
}else{ 
	response.sendRedirect("loginFail.jsp");
	} %> --%>
	
<%if(memberDTO != null){ 
	//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(memberDTO.getName(),"UTF-8")+"&id="+id);
	
	/* //쿠키
	Cookie cookie = new Cookie("memName", memberDTO.getName());
	cookie.setMaxAge(30*60); // 30분
	response.addCookie(cookie); 
	
	Cookie cookie2 = new Cookie("memId", id);
	cookie2.setMaxAge(30*60); // 30분
	response.addCookie(cookie2);
	//세션 */
	
	//HttpSession session = request.getSession();  내장객체
	session.setAttribute("memName", memberDTO.getName());
	session.setAttribute("memId", id);
	String email = memberDTO.getEmail1()+"@"+memberDTO.getEmail2();
	session.setAttribute("memEmail", email);
	
	
	
	//페이지 이동
	response.sendRedirect("loginOk.jsp");
	
	
}else{ 
	response.sendRedirect("loginFail.jsp");
	} %>
<%-- login2 이용
	<%if(memberDTO == null){
		//아이디 틀림
		<br><br>
		<input type="button" value="로그인" onclick="location.href='loginform.jsp'">
		<input type="button" value="로그인" onclick="history.go(-1)">
		}
		else {
		<%memberDTO.getName()%>}님 로그인 
		response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(memberDTO.getName(),"UTF-8")+"&id="+id);
		%> --%>
<script type="text/javascript">
</script>
</body>
</html>