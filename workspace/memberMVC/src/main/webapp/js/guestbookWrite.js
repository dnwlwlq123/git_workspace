function checksubject(){
	
       	document.getElementById("subjectDiv").innerHTML = ""
    	document.getElementById("contentDiv").innerHTML = ""
      	
	
		if(document.getElementById("subject").value=="") 
			document.getElementById("subjectDiv").innerHTML = "제목 입력"
		else if(document.guestbookWriteForm.content.value=="") 
			document.getElementById("contentDiv").innerHTML = "내용 입력"
			
		else document.guestbookWriteForm.submit();
}