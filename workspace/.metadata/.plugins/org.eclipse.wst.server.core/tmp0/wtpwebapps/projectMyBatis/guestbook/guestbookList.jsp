<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="guestbook.bean.GuestBookDTO" %>
<%@ page import="guestbook.dao.GuestBookDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
    <%
    //데이터 X
    int pg = Integer.parseInt(request.getParameter("pg"));
    
    //1페이지당 3개씩
    int endNum = pg*3;
    int startNum = endNum-2;
    
    
    
    //DB - select
    GuestBookDAO guestBookDAO = GuestBookDAO.getInstance();
    List<GuestBookDTO>list = guestBookDAO.guestbookList(startNum, endNum);
    
    //페이징 처리
    int totalA=guestBookDAO.getTotalA(); //총글수
    int totalP=(totalA+2)/3; //총 페이지수
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

#currentPaging{
	text-decoration: underline red;
	font-size: 1.5em;
}
#Paging{
	text-decoration: none;
      font-size: 1.5em;
      color: black;
}
#line{
	background-color: red;
	height: 5px;
}
</style>
</head>
<body>
<%if(list != null) {%>
<p>
	<%for(int i=1; i<=totalP; i++) {%>
	<%if(pg==i){ %>
		<a id="currentPaging"href="guestbookList.jsp?pg=<%=i %>">[<%=i %>]</a>
		<%}else{ %>
		<a id="Paging"href="guestbookList.jsp?pg=<%=i %>">[<%=i %>]</a>

		<%} %>
	<%}//for %>
</p>
<%for(GuestBookDTO guestBookDTO: list) {%>


<table border="1" cellpadding="7" >

			
	  		<tr>
                <td width="10">작성자 </td>
                <td ><%=guestBookDTO.getName() %></td>
                
                <td width="50">작성일</td> 
                <td ><%=new SimpleDateFormat("YYYY.MM.dd").format(guestBookDTO.getLogtime()) %></td>
     	 	</tr>
            
            <tr>
                <td width="50">이메일</td> 
                <td colspan="3" ><%=guestBookDTO.getEmail() %></td>
            </tr>
            
            <tr>
                <td width="70">홈페이지</td> 
                <td colspan="3" ><%=guestBookDTO.getHomepage() %></td>
            </tr>
            
             <tr>
                <td width="50">제목</td> 
                <td colspan="3" ><%=guestBookDTO.getSubject() %> </td>
            </tr>
            <tr>
            	
	            	<td colspan="4" id="content" width="400" height="300">
	            	<%=guestBookDTO.getContent() %> 
	            	</td>
            </tr>
      

 </table>
 <hr id="line">
 <%}//for %>
<%} %>

</body>
</html>