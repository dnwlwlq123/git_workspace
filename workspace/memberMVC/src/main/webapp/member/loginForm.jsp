<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>
</head>
<body>
	<form name="loginform" id="loginform" method="post" action="/memberMVC/member/login.do"> 
        <table border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th width="70">아이디</th> 
                <td>
                    <input type="text" name="id" id="id" size="20" />
                    <div id="idDiv" style="font-size: 8pt; font-weight:bold; color: red;"></div>
                </td>
            </tr>
            <tr>
            	<th>비밀번호</th>
            	<td>
	            	<input type="password" name="pwd" id="pwd" size="20" />
	            	<div id="pwdDiv" style="font-size: 8pt; font-weight:bold; color: red;"></div>
	            </td>	
            </tr>
             <tr >
                <td colspan="2" align="center">
                    <input type="button" value="로그인" onclick="checkLogin()">
                    <input type="button" value="회원가입" onclick = "location.href='writeForm.jsp'">
                    					<!-- 풀주소 http:/localhost:8080/projectJSP/member/writeForm.jsp -->
                </td>
            </tr>
        </table>
    </form>
<script src="../js/member.js"></script>
</body>
</html>