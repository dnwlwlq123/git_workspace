<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.dao.MemberDAO"%>
    <%@page import="member.bean.MemberDTO"%>
    <%
    /* String id = request.getParameter("id");
    String name = request.getParameter("name"); */
    
	 //쿠키
	String name = null;
    String id = null;
    /*
	Cookie[] ar = request.getCookies();//특정 쿠키만을 가져오지 못하고, 모든 쿠키를 카져올수 있다
	if(ar != null){
		for(int i = 0; i<ar.length; i++){
			String cookieName = ar[i].getName(); //쿠키명
			String cookieValue = ar[i].getValue(); //쿠키값
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("쿠키값 = " + cookieValue);
			System.out.println();
			
			if(cookieName.equals("memName")){name = cookieValue;}
			if(cookieName.equals("memId")){id = cookieValue;}
		}
	} */
	
	//세션
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="loginform" method="post" >
		<img src="../image/hi.png" width="150" height="150" alt="you" 
		onclick="location.href='../index.jsp'" style="cusor:pointer">
		<font color = "red"><strong><%=id %><br> <%=name %>님 로그인<br></strong></font>
		<tr>
			<td>
			<input type="button" value="회원정보 수정" onclick = "location.href='updateForm.jsp'">
			<input type="button" value="로그아웃" onclick = "location.href='logout.jsp'">
			</td>
		</tr>
	</form>
</body>
</html>