<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
}

#subjectDiv, #contentDiv{
	color: red;
}
</style>
</head>
<body>
	<form name="guestbookWriteForm" method="post" action="guestbookWrite.jsp"> 
	<h3>방명록</h3>
        <table  border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th width="100">작성자</th> 
                <td>
                    <input type="text" name="name" id="name" value="<%=name %>" size="20" readonly/>
                    <div id="nameDiv"></div>
                </td>
            </tr>
            
            <tr>
                <th width="100">이메일</th> 
                <td>
                    <input type="text" name="email" id="email" value="<%=email %>" size="30" readonly/>
                    <div id="emailDiv"></div>
                </td>
            </tr>
            
            <tr>
                <th width="100">홈페이지</th> 
                <td>
                    <input type="text" name="homepage" id="homepage" size="40"/>
                    <div id="homepageDiv"></div>
                </td>
            </tr>
            
            <tr>
                <th width="100">제목</th> 
                <td>
                    <input type="text" name="subject" id="subject" size="45"/>
                    <div id="subjectDiv"></div>
                </td>
            </tr>

            <tr>
            	<th>내용</th>
            	<td>
	            	<textarea name="content" id="content" cols="50" rows="15">
	            	</textarea>
	            	<div id="contentDiv"></div>
	            </td>	
            </tr>
            <tr >
                <td colspan="2" align="center">
                    <input type="button" value="글쓰기" onclick="checksubject()">
                    <input type="reset" value="다시작성">
                    <input type="submit" value="글목록" action="guestbookList.jsp?pg=1">
                </td>
            </tr>
       </table>
    </form>
    
    <script src="../js/guestbookWrite.js"></script>
</body>
</html>