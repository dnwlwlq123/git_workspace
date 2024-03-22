<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.dao.MemberDAO"%>
    <%
    String id = request.getParameter("id");
    
	//DB- 싱글톤    
    MemberDAO memberDAO = MemberDAO.getInstance(); //사람이 들어올때마다 new 할수 없으니까 한번만 new를 하는 싱글톤으로 생성
    boolean exist = memberDAO.isExistId(id);

    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(exist){ %>
		<form action="checkId.jsp">
			<font color="red"><strong>선택하신 아이디 <%=id %>는 사용이 불가합니다.</strong></font>
			<br><br>
			아이디<input type="text" name="id" id="id" size="15" placeholder="아이디 입력"/>
				<input type="submit" value="중복체크" />
		</form>
<%}else{ %>
<font color="blue"><strong>선택하신 아이디 <%=id %>는 사용이 가능합니다.</strong></font>
<br><br>
<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')">
<%} %>

<script>
	function checkIdClose(id) {
		opener.document.getElementById("id").value=id;
		opener.document.getElementById("check").value=id;
		window.close();
		opener.document.getElementById("pwd").focus();
	}
</script>
</body>
</html>