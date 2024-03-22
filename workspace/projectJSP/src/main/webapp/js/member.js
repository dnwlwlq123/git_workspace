function checkWrite(){
		
		document.getElementById("nameDiv").innerHTML="";
		document.getElementById("idDiv").innerHTML="";
		document.getElementById("pwdDiv").innerHTML="";
		if(document.form1.name.value==""){
			document.getElementById("nameDiv").innerHTML="이름을 입력하세요";
		}else if(document.form1.id.value==""){
			document.getElementById("idDiv").innerHTML="아이디를 입력하세요";
		}else if(document.form1.pwd.value==""){
			document.getElementById("pwdDiv").innerHTML="비밀번호를 입력하세요";
		}else if(document.form1.pwd.value!=document.form1.repwd.value){
			document.getElementById("pwdDiv").innerHTML="비밀번호가 일치하지않습니다.";
			
		}else if (document.getElementById("id").value!=document.getElementById("check").value){
			document.getElementById("idDiv").innerHTML="중복체크 하세요 "
			
		}else{
			document.form1.submit();
		}
		
	}
	
	function changeEmail(){
		var email3 = document.getElementById("email3");
		var text = email3.options[email3.selectedIndex].text;
		if(text!="직접입력"){
			document.getElementById("email2").value=text;
		}else {
			document.getElementById("email2").value="";
		}
	}
	
	function checkPost(){
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
	}
	function checkId(){
		var id = document.getElementById("id");
		if(id.value=="")
			alert("먼저 아이디를 입력하세요");
		else
			window.open("http://localhost:8080/projectJSP/member/checkId.jsp?id="+id.value,"checkId","width=300 height=150");
			
		}
	function checkLogin(){
		document.getElementById("idDiv").innerHTML="";
		document.getElementById("pwdDiv").innerHTML="";
		if(document.form2.id.value==""){
			document.getElementById("idDiv").innerHTML="아이디를 입력하세요";
		}else if(document.form2.pwd.value==""){
			document.getElementById("pwdDiv").innerHTML="비밀번호를 입력하세요";
		}else{
			document.form2.submit();
		}
	}
	
	function checkUpdate(){
		document.getElementById("nameDiv").innerHTML="";
		
		document.getElementById("pwdDiv").innerHTML="";
		
		if(document.form3.name.value==""){
			document.getElementById("nameDiv").innerHTML="이름을 입력하세요";
		}else if(document.form3.pwd.value==""){
			document.getElementById("pwdDiv").innerHTML="비밀번호를 입력하세요";
		}else if(document.form3.pwd.value!=document.form3.repwd.value){
			document.getElementById("pwdDiv").innerHTML="비밀번호가 일치하지않습니다.";
			
		}else{
			document.form3.submit();
		}
	}	
	
	
	