<%@page import="member.dao.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
      String id = request.getParameter("id");

      // DB쪽에선 - 싱글톤
      MemberDAO memberDAO = MemberDAO.getInstance(); // 생성
      boolean exist = memberDAO.isExistId(id);
   
 
   String exist_a;
   if(exist){
	   exist_a = "exist";
	   
   }else{
	   exist_a = "non_exist";
   }   
%>
<%=exist_a %>