<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
	//자바 역할
	List<String> list = new ArrayList<String>();
	list.add("호랑이");
	list.add("사자");
	list.add("기린");
	list.add("코끼리");
	list.add("타조");
	list.add("코알라");
	list.add("여우");
	
	//주소를 통해서 넘어가는 데이터는 문자열(String)만 가능, 객체는 넘길 수 없다.
	request.setAttribute("list", list);
	
	//페이지 이동
	response.sendRedirect("sendEnd.jsp");

%>