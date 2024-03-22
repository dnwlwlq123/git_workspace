<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
	border-collapse: collapse;
	}
	#nameDiv,#idDiv,#pwdDiv{
		color:violet;
	}
	
</style>
</head>
<body>
	<form name="form2" method="post" action="login.jsp">
		<table border="1" width ="400" cellpadding="5" >

			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id" size="15" />
					<div id="idDiv"></div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td> 
					<input type="password" name="pwd" size ="20"/>
					<div id="pwdDiv"></div>
				</td>
			</tr>
			<tr>
            	<td colspan="2" align="center">
            		<input type="button"value="로그인" onclick="javascript:checkLogin()"/>
                    <input type="button"value="회원가입" onclick="location.href='writeForm.jsp'"/>
            	</td>
            </tr>
            
		</table>
	</form>
<script src="../js/member.js"></script>
</body>
</html>