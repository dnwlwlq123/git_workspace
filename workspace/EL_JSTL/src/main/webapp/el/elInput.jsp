<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="input" action="elResult.jsp">
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<th>X</th>
			<td width="60%">
			<input type="text" name="x" />
			</td>
		</tr>
		<tr>
			<th>Y</th>
			<td width="60%">
			<input type="text" name="y" />
			</td>
		</tr>
		<tr >
	         <td colspan="2" align="center">
	         <input type="submit" value="계산" >
	         <input type="reset" value="취소">
	     </td>
	     </tr>
	</table>
</form>	
</body>
</html>