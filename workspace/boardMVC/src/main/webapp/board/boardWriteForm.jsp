<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
}

#subjectDiv, #contentDiv{
	color: red;
}
</style>
</head>
<body>
	<form name="boardWriteForm" id = "boardWriteForm" method="post" action="/boardMVC/board/boardWrite.do"> 
	<h3>글쓰기</h3>
        <table  border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th width="100">제목</th> 
                <td>
                    <input type="text" name="subject" id="subject" size="45"/>
                    <div id="subjectDiv"></div>
                </td>
            </tr>
            <tr>
            	<th>내용</th>
            	<td>
	            	<textarea name="content" id="content" cols="50" rows="15">
	            	</textarea>
	            	<div id="contentDiv"></div>
	            </td>	
            </tr>
            <tr >
                <td colspan="2" align="center">
                    <input type="button" value="글쓰기" id="boardWriteBtn">
                   
                    <input type="reset" value="다시작성">
                </td>
            </tr>
       </table>
    </form>
    
    <script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
    $('#boardWriteBtn').click(function(){
    	$('#subjectDiv').empty();
    	$('#contentDiv').empty();
    	
    	if($('#subject').val()=='')
    		$('#subjectDiv').html('제목 입력');
    	else if($('#contnet').val()=='')
    		$('#contentDiv').html('내용 입력');
    	else
    	$('#boardWriteForm').submit();
    });
    
    </script>
</body>
</html>