function checkWrite(){
       	document.getElementById("nameDiv").innerHTML = ""
    	document.getElementById("idDiv").innerHTML = ""
      	document.getElementById("pwdDiv").innerHTML = ""
	
		if(document.getElementById("name").value=="") 
			document.getElementById("nameDiv").innerHTML = "이름 입력"
		else if(document.writeform.id.value=="") 
			document.getElementById("idDiv").innerHTML = "아이디 입력"	
		else if(document.getElementById("pwd").value=="") 
			document.getElementById("pwdDiv").innerHTML = "비밀번호 입력"
		else if(document.getElementById("pwd").value!=document.getElementById("repwd").value) 
			document.getElementById("repwdDiv").innerHTML = "비밀번호가 틀립니다"
       	else document.writeform.submit();
		}
function checkWrite2(){
		var email3 = document.getElementById("email3").value;
		var email2 = document.getElementById("email2").value;
		if(document.getElementById("email3").value == 0) 
			document.getElementsById("email2").focus;
       	else document.writeform.email2.value = document.writeform.email3.value
		}

function checkWrite3(){
       	document.getElementById("nameDiv").innerHTML = ""
    	document.getElementById("idDiv").innerHTML = ""
      	document.getElementById("pwdDiv").innerHTML = ""
	
		if(document.getElementById("name").value=="") 
			document.getElementById("nameDiv").innerHTML = "이름 입력"
		else if(document.getElementById("id").value=="") 
			document.getElementById("idDiv").innerHTML = "아이디 입력"	
		else if(document.getElementById("pwd").value=="") 
			document.getElementById("pwdDiv").innerHTML = "비밀번호 입력"
		else if(document.getElementById("pwd").value!=document.getElementById("repwd").value) 
			document.getElementById("repwdDiv").innerHTML = "비밀번호가 틀립니다"
       	else document.updateform.submit();
		}