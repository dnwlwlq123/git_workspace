<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.bean.BoardDTO" %>
<%@ page import="board.dao.BoardDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page trimDirectiveWhitespaces="true" %> <%-- XML태그 시작전의 공백 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

   
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#currentPaging{
	border: 1px solid black;
	color: black;
	cursor: pointer;
	font-size: 15pt;
	margin: 5px;
	padding: 5px 8px;
	
}
#paging {
	color: gray;
	cursor: pointer;
	font-size: 15pt;
	margin: 5px;
	padding: 5px;
	
}
span{
	padding: 10px;
	margin: 5px;
}

span:hover{
	text-decoration: underline;
}
</style>
</head>
<body>
<table border="1" cellpadding="7" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="150">작성자</th>
		<th width="150">작성일</th>
		<th width="100">조회수</th>
	</tr>
	
	<c:if test="${requestScope.list != null}">
	
	<c:forEach var="boardDTO" items="${list}">
    <tr>
    
        <td align="center">${boardDTO.seq }</td>
        
        <td align="center">
            <c:forEach var="i" begin="1" end="${boardDTO.lev }" step="1">
                &emsp;
            </c:forEach>
            <!-- Add your content here based on the loop variable 'loop' -->
        
 

   
        <c:if test="${boardDTO.getPseq() != 0}">
            <img src="../image/reply.gif" alt="reply">
        </c:if>
        ${boardDTO.getSubject()}</td>
        <td align="center">${boardDTO.getId()}</td>
        <td align="center">
        <fmt:formatDate value="${ boardDTO.logtime }" pattern="yyyy.MM.dd."/>
        </td>
        <td align="center">${boardDTO.getHit()}</td>
    </tr>
</c:forEach>
</c:if>
</table>
<div style="text-align:center; width: 900px; margin: 20px;" >
	<c:forEach var ="i" begin="1" end="${totalP }" step="1">
	<c:if test ="${i == pg }">
		<span id="currentPaging" onclick="boardPaging(${i })">${i }</span>
	</c:if>
	<c:if test ="${i != pg }">
		<span id="paging" onclick="boardPaging(${i })">${i }</span>
		</c:if>
	</c:forEach>
</div>

<script type="text/javascript">
function boardPaging(pg){
	location.href= "/boardMVC/board/boardList.do?pg=" + pg;
}
</script>
</body>
</html>