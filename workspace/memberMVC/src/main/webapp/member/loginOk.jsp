<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="member.dao.MemberDAO"%>
    <%@page import="member.bean.MemberDTO"%>

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
		<font color = "red"><strong><br> ${memName } 님 로그인<br></strong></font>
		<tr>
			<td>
			<input type="button" value="회원정보 수정" onclick = "location.href='/memberMVC/member/updateForm.do'">
			<input type="button" value="로그아웃" onclick = "location.href='/memberMVC/member/logout.do'">
			</td>
		</tr>
	</form>
</body>
</html>