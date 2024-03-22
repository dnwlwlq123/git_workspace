<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
    <%
    //데이터
    String id = (String)session.getAttribute("memId");
    //DB
     MemberDAO memberDAO = MemberDAO.getInstance();
     MemberDTO memberDTO = memberDAO.getMember(id);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>
</head>
<body>
    <form name="updateform" method="post" action="update.jsp"> 
        <table border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th width="70">이름</th> 
                <td>
                    <input type="text" name="name" id="name" value="<%=memberDTO.getName()%>" />
                    <div id="nameDiv" style="font-size: 8pt; font-weight:bold; color: red;"></div>
                </td>
            </tr>
            <tr>
            	<th>아이디</th>
            	<td>
	            	<input type="text" name="id" id="id" value="<%=id%>"/>
	            	<div id="idDiv" style="font-size: 8pt; font-weight:bold; color: red;"></div>
	            </td>	
            </tr>
            <tr>
            	<th>비밀번호</th>
            	<td>
	        		<input type="password" name="pwd" id="pwd" size="25" />
	        		<div id="pwdDiv" style="font-size: 8pt; font-weight:bold; color: red;"></div>
	        	</td>	
       		 </tr>
       		<tr>
       			<th>재확인</th>
	    		<td>	
	    			<input type="password" name="repwd" id="repwd" size="25" />
	    			<div id="repwdDiv" style="font-size: 8pt; font-weight:bold; color: red;"></div>
	    		</td>
   		 	</tr>
            <tr>
                <th>성별</th>
                <td>
                    <input type="radio" name="gender"  id="male" checked />
                    <label for="male">남자</label>
                    <input type="radio" name="gender" id= "female"/>
                    <label for="female">여성</label>
                </td>
            </tr>
            <tr>
            <th>이메일</th>
            	<td>
					<input type="text" name="email1" size="15" />
					@
					<input type="text" name="email2" size="15"/>
					
					<%-- <input type = "select" name="email3" id="email3" list="email3_list" onchange="change()" placeholder="직접입력"> --%>
					<%-- <datalist id="email3_list">
						<option value=""/>
						<option value="naver.com">naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="nate.com">nate.com</option>
					</datalist> 
					--%>
					 <select name="email3" id="email3" onclick="change()">
					 	<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
	                    <option value="gmail.com">gmail.com</option>
	                    <option value="nate.com">nate.com</option>
					</select>
            	</td>
		 	</tr>

            <tr>
                <th>휴대폰</th>
                <td>
                    <select name="tel1" style="widht:70px">
	                        <option value="010" selected>010</option>
	                        <option value="011">011</option>
	                        <option value="019">019</option>
                    </select>
                    -
                    <input type="text" name="tel2" size = "5" maxlength="4" />
                    -
					<input type="text" name="tel3" size = "5" maxlength="4" />
                </td>
            </tr>
            <br/>

            <tr>
                <th>주 소</th>
                <td>
                    <input type="text" name="zipcode" id="zipcode" size="10" />  <input type="button" onclick = "checkPost()" value="우편번호검색" ><br>
                	<input type="text" name="addr1" id="addr1" size="50" placeholder="주소"/><br>
					<input type="text" name="addr2" id="addr2" size="50" placeholder="상세주소"/>
                </td>
            </tr>
         
            <tr >
                <td colspan="2" align="center">
                    <input type="button" value="회원정보 수정" onclick="checkWrite3()">
                    <!-- <button onclick="javascript:checkInput(); return false;">send</button> -->
                    <input type="reset" value="다시작성" >
                </td>
            </tr>

        </table>
   	</form>
   	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   	<script src="../js/member.js"></script>
   	<script src="../js/checkWrite.js">
   	window.onload=fuction(){
   		//radio는 배열의 값으로 넘어옴,, 남자는 gender[0], 여자는 gender[1]
   		document.updateform.gender[1].checked = true;
   	}
   		</script>
   	
   	
</body>
</html>