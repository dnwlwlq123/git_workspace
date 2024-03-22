<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="guestbook.dao.GuestBookDAO"%>
<%@page import="guestbook.bean.GuestBookDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>


<%
		request.setCharacterEncoding("UTF-8"); // post 요청시
		
		
		String homepage = request.getParameter("homepage");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		

		Map<String, String> map = new HashMap<>();
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		map.put("homepage", homepage);
		map.put("subject", subject);
		map.put("content", content);
		
		GuestBookDTO guestBookDTO= new GuestBookDTO();
		
		
		guestBookDTO.setHomepage(homepage);
		guestBookDTO.setSubject(subject);
		guestBookDTO.setContent(content);
		
		
		//DB - insert
		GuestBookDAO guestBookDAO = GuestBookDAO.getInstance(); // 생성
		int su = guestBookDAO.guestBook(map);

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%if(su==1){ %>
방명록을 등록하였습니다.

<%}else {%>
안넘어왔당
<%} %>
	
<div>
	<input type="button" value="글목록" onclick="location.href='guestbookList.jsp?pg=1'">
</div>
	
</body>
</html>