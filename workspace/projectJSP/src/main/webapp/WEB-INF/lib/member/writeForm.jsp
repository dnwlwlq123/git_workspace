<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border-collapse: collapse;
}
#nameDiv, #idDiv, #pwdDiv, #repwdDiv{
		font-size:8pt;
		color: hotpink; 
}

</style>
</head>
<body>
	<form name="writeForm" method="post" action="write.jsp"> 
    <table border="1" cellpadding="5">
        <tr>
            <td align="center"  width="120"><strong>이름</strong></td>
            <td>
                       
                 <input type="text" name="name"  id="name" size="30" placeholder="이름 입력"/>  
                     <div id="nameDiv"></div>
            </td>
        </tr>
        <tr>
        <td align="center"  width="100"><strong>아이디</strong></td>
        <td>
        <input type="text" name="id" id="id" size="20" placeholder="아이디 입력"/>
        <input type="button" onclick="checkId()" value="중복체크">
        		<div id="idDiv"></div>
        </td>
        </tr>
        
        <tr>
         <td align="center"  width="100"><strong>비밀번호</strong></td>
        <td>
        <input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 "/>
        		<div id="pwdDiv"></div>
        </td>
        </tr>
        
        <tr>
         <td align="center"  width="100"><strong>비밀번호 재입력</strong></td>
        <td>
        <input type="password" name="repwd" id="repwd" size="30" placeholder="비밀번호 재입력"/>
        		<div id="repwdDiv"></div>
        </td>
        </tr>
        
        <tr>
            <td align="center"><strong>성별</strong></td>
            <td>  
                <fieldset>
                    <legend>성별</legend>       
                    <input type="radio" name="gender" id="gender_m" value="0" checked/>
                    <label for="gender_m">남자</label>
                    <input type="radio" name="gender" id="gender_f" value="1"/>
                    <label for="gender_f">여자</label>   
                </fieldset>
        </td>
        </tr>
        
        <tr>
            <td align="center"  width="100"><strong>이메일</strong></td>
            <td>    
                 <input type="text" name="email1" id="eamil1">
            	 @
            	 <input type="text" name="email2" id="email2">
                 <select style="width:110px;" id="com" name="email3" onchange="checkcom()">
                        <option value="default">직접입력</option>
                        <option value="naver">naverㅋㅋ.com</option>   
                        <option value="google">googleㅋㅋ.com</option>  
                        <option value="yh">야후ㅋㅋ.com</option>                     
                 </select>
             </td>    
        </tr>
        
            
         <tr>
         <td align="center"  width="100"><strong>휴대폰</strong></td>
        <td>
        <select style="width:110px;" name="tel1">
                        <option value="number1">010</option>
                        <option value="number2">011</option>
                        <option value="number3">019</option>
        </select>
        -
        <input type="text" name="tel2" size="10"  maxlength="4" >
        -
        <input type="text" name="tel3" size="10"  maxlength="4" >
        </td>
        </tr>
      
      <tr>
	      <td align="center"  width="100"><strong>주소</strong></td>
	        <td>
	        <input type="text" name="zipcode" id="zipcode" readonly />
	        <input type="button" onclick="checkPost()" value="우편번호검색">
	        <br>
	        <input name="addr1" id="addr1" size="50" placeholder="주소" readonly/>
	        <br>
			<input name="addr2" id="addr2"  size="50" placeholder="상세주소"/>
			
	        </tr>
	   		
         <tr>
            <td colspan="2" align="center">
                <input type="button" value="회원가입" onclick = "javascript:checkWrite()">
                <input type="reset" value="다시작성">
            </td>
          </tr>
      </table>
    </form>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
     <script type="text/javascript" src="../js/member.js">
       </script>
</body>
</html>