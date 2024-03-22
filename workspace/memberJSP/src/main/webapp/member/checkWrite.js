function checkWrite(){
       	document.getElementById("nameDiv").innerHTML = ""
    	document.getElementById("idDiv").innerHTML = ""
      	document.getElementById("pwdDiv").innerHTML = ""
	
		if(document.inputform.name.value=="") 
			document.getElementById("nameDiv").innerHTML = "이름 입력"
		else if(document.inputform.id.value=="") 
			document.getElementById("idDiv").innerHTML = "아이디 입력"	
		else if(document.inputform.pwd.value=="") 
			document.getElementById("pwdDiv").innerHTML = "비밀번호 입력"
		else if(document.inputform.pwd.value!=document.inputform.repwd.value) 
			document.getElementById("repwdDiv").innerHTML = "비밀번호가 틀립니다"
       	else document.inputform.submit();
		}
function checkWrite2(){
		var email3 = document.inputform.email3.value;
		var email2 = document.inputform.email2.value;
		if(document.inputform.email3.value == 0) 
			document.getElementsByName("email2").focus;
       	else document.inputform.email2.value = document.inputform.email3.value
		}