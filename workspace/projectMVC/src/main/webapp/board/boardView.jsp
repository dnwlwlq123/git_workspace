<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
		#container {
			margin: auto;
			width: 1100px;
			height: 500px;
		}
		
		#container:after {
			content: '';
			display: block;
			clear: both;
			float: none;
		}
		
		#nav {
			margin-left: 10px;
			width: 25%;
			height: 100%;
			float: left;
		}
		
		#section {
			width: 70%;
			height: 100%;
			float: left;
		}
		pre{
			white-space: pre-line;
		}
</style>

<div id="header" style="text-align: center;">
	<h1>
		<a href="/projectMVC/index.jsp">
			<img alt="사과" src="/projectMVC/image/apple.png" width="50" height="50"></a>
		MVC를 활용한 미니 프로젝트
	</h1>
</div>
<hr style="border-color: yellowgreen;">
<div id="container">
	<jsp:include page="../main/boardMenu.jsp" />
	
	<form id="boardViewForm">
	<div id="section">
		<input type="hidden" name="seq" id="seq" value="${seq }" />
		<input type="hidden" name ="pg" id="pg" value="${pg }" />
		<input type="hidden" id="memId" value="${memId }"/>
		<table border="1" cellpadding="7" frame="hsides" rules="rows">
			<tr>
				<th height="100" colspan="3">
					<h3><span id="subjectSpan"></span></h3>
				</th>
			</tr>
			
			<tr>
				<td align="center" width="200">글번호 : <span id="seqSpan"></span></td>
				<td align="center" width="200">작성자 : <span id="idSpan"></span></td>
				<td align="center" width="200">조회수 : <span id="hitSpan"></span></td>
			</tr>
			
			<tr> 
				<td height="300" valign="top" colspan="3">
				
				<pre>
				<span id="contentSpan"></span>
				</pre>
				</td>
			</tr>
		</table>
		<br>
		<div style="margin-top: 5px;">
		<input type="button" value="목록" 
			   onclick="location.href='/projectMVC/board/boardList.do?pg=${pg}'">
		<span id="boardViewSpan">
			<input type="button" value="글수정" id="boardUpdateFormBtn">
			<input type="button" value="글삭제" id="boardDeleteFormBtn">
		</span>
			<input type="button" value="답글" id="boardReplyFormBtn">
		</div>
	</div>
	</form>
</div>

<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="../js/boardView.js"></script>





