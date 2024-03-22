<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO" %>
<%@ page import="member.bean.MemberDTO" %>
    
 <%
 
 String id = request.getParameter("result");
 
 MemberDAO memberDAO = MemberDAO.getInstance();
 MemberDTO memberDTO = memberDAO.getMember(id);
 

 %>
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
	<form name="form3" method="post" action="update.jsp">
		<table border="1" width ="400" cellpadding="5" >
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" value="<%=memberDTO.getName() %>" size="10" /> 
					<div id="nameDiv"></div>
				</td>
			</tr>		
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id" value="<%=memberDTO.getId() %> "size="15" placeholder="아이디 입력"/> 
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
				<th>재확인</th>
				<td> <input type="password" name="repwd" size ="20"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="0" checked/>남자</label>
		            <label><input type="radio" name="gender" value="1"/>여자</label>
            	</td>
            </tr>
            <tr>
            	<th>이메일</th>
            	<td>
            		<input type="text" name="email1" value="<%=memberDTO.getEmail1() %>"size="6" /> @
            		<input type="text" name="email2" value="<%=memberDTO.getEmail2() %>"id="email2" size="6"/>
         
            	</td>
            </tr>
            <tr>
            	<th>휴대폰</th>
            	<td>
            		<select style="width:45px;" name="tel1" id="tel1" >
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="019">019</option>
                            
                    </select>
                    <input type="text" name="tel2" value="<%=memberDTO.getTel2() %>"size="6" maxlength="4"/>
            		<input type="text" name="tel3" value="<%=memberDTO.getTel3() %>"size="6" maxlength="4"/>
            	</td>
            </tr>
            <tr>
            	<th>주소</th>
            	<td>
            		<input type="text" name="zipcode" id="zipcode" value="<%=memberDTO.getZipcode() %>"size="6" readonly/>
            		<input type="button"  value="우편번호 검색" onclick="checkPost(); return false;"/>
            		<br>
            		<input type="text" name="addr1" id="addr1" value="<%=memberDTO.getAddr1() %>"size="40%" placeholder="주소" readonly/>
            		<br>
            		<input type="text" name="addr2" id="addr2" value="<%=memberDTO.getAddr2() %>"size="40%" placeholder="상세주소" />
            	</td>
            </tr>
         
            <tr>
            	<td colspan="2" align="center">
            		<input type="button"value="회원정보수정" onclick="javascript:checkUpdate()"/>
                    <input type="reset"value="다시입력" onclick="location.reload()"/>
            	</td>
            </tr>
            
</table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script>
window.onload=function(){
	document.form3.gender['<%=memberDTO.getGender() %>'].checked=true;
	document.getElementById("tel1").value="<%=memberDTO.getTel1()%>";
}
</script>
</body>
</html>