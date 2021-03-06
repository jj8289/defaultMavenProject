<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../common/common.jsp" />    
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/company/login.js"></script>        
<style type="text/css"> 
body { 
	margin: 0;  
	padding: 0;
}

#container {
	
}

.temp {
	height: 50px;
}

.minicon {
	width: 500px;
	margin: 0 auto;
}

.title {
	width: 100%;
	/* background-color: powderblue; */
	margin: 0;
	height: 45px;
	font-size: 30px;
	text-align: center;
}

form {
	margin: 20px;
}

form p {
	margin: 70px;
}

.but {
	text-align: center;
}

.but input {
	border: none;
	background-color: #424242;
	color: white;
	width: 100px;
	height: 30px;
}

button {
	border: none;
	background-color: #424242;
	color: white;
	width: 100px;
	height: 30px; 
}  
	
</style>
</head>
<body>
	<div id="container">
		<div class="temp"></div>
		<h2 class="title">로그인</h2>
		<div class="temp"></div>
		<div class="minicon">
			<form id="loginForm" name="loginForm">
				<table cellspacing="3" style="height: 60px;">
					<colgroup>
	   					<col width="30%"/>
	    				<col width="30%"/>
	 				</colgroup>
					<tr>
						<td bgcolor="lightgrey" align="center">아이디</td>
						<td>
							<input type="text" name="managerId" id="managerId" size="30">
						</td>	
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">비밀번호</td>
						<td>
							<input type="password" name="managerPw" id="managerPw" size="30">
						</td>
					</tr>
				</table> 
				<div class="col set_login">
					<label class="control control-checkbox">
                           ID기억하기
					<input type="checkbox" name="idSave" id="idSave" value="saveOk"/>
					<div class="control_indicator"></div>
					</label>  
				</div> 
				<p class="but" align="center" >
					<button id="login" value="로그인" type="button" onclick="loginChk()" class="btn">로그인</button>  
					<input type="reset" value="리셋"> 
					<input type="button" value="홈으로" onclick="goHome()">
				</p> 
			</form>  
		</div> 
	</div> 
<script type="text/javascript">
	var CONTEXT_PATH = "/jj";	
	 
	function goHome() { 
		// controller URL
		location.href = CONTEXT_PATH + "/";
	} 
	
	function loginChk() {  
	    var frm = document.loginForm;
	    
	    if (!frm.managerId.value) { //아이디를 입력하지 않으면.
            alert("아이디를 입력하세요.");
            frm.managerId.focus();
            return;
        } else if (!frm.managerPw.value) { //패스워드를 입력하지 않으면.
            alert("패스워드를 입력하세요.");
            frm.managerPw.focus(); 
            return;
        }
	    
	    login();
	}
	
	function login() {
		
		var formData = {
				managerId: $('#managerId').val()
              , managerPw: $('#managerPw').val()
    	};
		
		$.ajax({
    		url : CONTEXT_PATH + "/company/login/loginChk", 
    		type: "POST",  
    		data: formData,
    		success: function(data){
    			console.log("login");  
    			
    			if(data == 'success'){
        			location.href = CONTEXT_PATH + "/";  
    			} else {  
    				alert("ID 또는 PW를 확인해주세요.");
    				location.href = CONTEXT_PATH + "/company/login";
    			} 
    		}, 
    		error: function(){  
    		   		location.href = CONTEXT_PATH + "/company/login";
    		   		console.log("error");
    		}
    	});  
	}
</script>
</body>
</html>