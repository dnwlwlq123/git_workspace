<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>


<%
	request.setCharacterEncoding("UTF-8"); // post 요청시
    //데이터
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    
    //세션
    String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	String email = (String)session.getAttribute("memEmail");
	
	Map<String, String> map = new HashMap<String, String>();
	map.put("id", id);
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("content", content);
	
    
    BoardDTO boardDTO= new BoardDTO();
    
    boardDTO.setName(name);
    boardDTO.setId(id);
    boardDTO.setEmail(email);
    boardDTO.setSubject(subject);
    boardDTO.setContent(content);
    

    BoardDAO boardDAO = BoardDAO.getInstance(); // 생성
    boardDAO.BoardWrite(map);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>작성하신 글작성이 완료되었습니다.</h3>	
	<
	</script>
	
</body>
</html>