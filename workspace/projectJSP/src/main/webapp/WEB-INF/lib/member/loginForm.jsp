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
#idDiv, #pwdDiv{
	color:red;
}
</style>
</head>
<body>


<form name=loginForm method="post" action="login.jsp" >

<table border="1" cellpadding="5" >
        <tr>
            <td align="center"  width="120"><strong>아이디</strong></td>
            <td>      
                 <input type="text" name="id"  id="id" size="30" placeholder="아이디 입력"/>  
                     <div id="idDiv"></div>
           </td>
           </tr>
           <tr>
           <td align="center" width="120"><strong>비밀번호</strong></td>
           <td>
           <input type="text" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력"/>
           </td>
           </tr>
           <tr>
           <td colspan="2" align="center">
                <input type="button" value="로그인" onclick = "checkLogin()">
                <input type="button" value="회원가입" >
          </td>
          </tr>
          </table>
          </form>
          <script type="text/javascript" src="../js/member.js"></script>
</body>
</html>