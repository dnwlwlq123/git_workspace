<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.onload=function(){
		alert("작성하신 글을 등록 하였습니다.");
		location.href = "/boardMVC/board/boardList.do?pg=1";
	}
</script>
	
	
	
</body>
</html>