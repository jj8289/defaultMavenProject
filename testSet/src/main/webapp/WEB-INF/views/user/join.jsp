<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
	<meta charset="UTF-8">
	<title>회원가입</title>
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
	 
	table {
		width: 800px;
		height: 180px
	}
</style>
</head>
<body>
	<div id="container">
		<div class="temp"></div>
		<h2 class="title">회원가입</h2>
		<div class="temp"></div>
		<div class="minicon">
			<form id="joinForm" name="joinForm"> 
				<table cellspacing="3">
				<colgroup> 
   					<col width="15%"/> 
    				<col width=""/> 
 				</colgroup>  
					<tr>
						<td bgcolor="lightgrey" align="center">아이디</td>	
						<!-- <td><input size="15" type="text" name="id" id="id"> 4~12자의 영문 대소문자와 숫자로만 입력</td> -->
						<td><input size="15" type="text" name="userId" id="userId"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">비밀번호</td>
						<!-- <td><input size="15" type="password" name="pw" id="pw"> 4~12자의 영문 대소문자와 숫자로만 입력</td> -->
						<td><input size="15" type="password" name="userPw"  id="userPw"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">이름</td>
						<!-- <td><input type="text" name="cname" id="cname"></td> -->
						<td><input type="text" name="userNm" id="userNm"></td>
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">나이</td>
						<<!-- td><input type="text" name="birth" id="birth"> ex) 950101</td> -->
						<td><input type="text" name="age" id="age"> ex) 27</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">직업</td>
						<<!-- td><input type="text" name="birth" id="birth"> ex) 950101</td> -->
						<td><input type="text" name="job" id="job"> ex) dev</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">성별</td>
						<td>
							<input type="radio" name="sex" id="sex1" value="F" > 여
							<input type="radio" name="sex" id="sex2" value="M" > 남
						</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">경력</td>
						<td><input type="text" name="career" id="career"> ex) 3</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">핸드폰</td>
						<td><input type="text" name="phone" id="phone"> ex) 01012345678</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">주소</td>
						<td><input size="70" type="text" name="addr" id="addr"></td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">이메일</td>
						<td><input size="70" type="text" name="email" id="email"></td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">간단 소개</td>
						<td><input size="70" type="text" name="intro" id="intro"></td>
					</tr>
				</table>

				<p class="but" align="center" >
					<button id="join" value="가입하기" type="button" onclick="joinChk()" class="btn">가입하기</button> 
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
		
		function joinChk() {  
	        var frm = document.joinForm;
	        if (!frm.userId.value) { //아이디를 입력하지 않으면.
	            alert("아이디를 입력하세요.");
	            frm.userId.focus();
	            return;
	        } else if (!frm.userPw.value) { //패스워드를 입력하지 않으면.
	            alert("패스워드를 입력하세요.");
	            frm.userPw.focus(); 
	            return;
	        } else if (!frm.userNm.value) { //패스워드를 입력하지 않으면.
	            alert("이름을 입력하세요.");
	            frm.userNm.focus(); 
	            return;
	        } else if (!frm.age.value) { //패스워드를 입력하지 않으면.
	            alert("나이를 입력하세요.");
	            frm.age.focus(); 
	            return;
	        } else if (!frm.job.value) { //패스워드를 입력하지 않으면.
	            alert("직업을 입력하세요.");
	            frm.job.focus(); 
	            return;
	        } else if (!frm.sex.value) { //패스워드를 입력하지 않으면.
	            alert("성별을 선택하세요.");
	            frm.sex.focus(); 
	            return;
	        } else if (!frm.career.value) { //패스워드를 입력하지 않으면.
	            alert("경력을 입력하세요.");
	            frm.career.focus(); 
	            return;
	        } else if (!frm.phone.value) { //패스워드를 입력하지 않으면.
	            alert("핸드폰을 입력하세요.");
	            frm.phone.focus(); 
	            return;
	        } else if (!frm.addr.value) { //패스워드를 입력하지 않으면.
	            alert("주소를 입력하세요.");
	            frm.addr.focus(); 
	            return;
	        } else if (!frm.email.value) { //패스워드를 입력하지 않으면.
	            alert("이메일을 입력하세요.");
	            frm.email.focus(); 
	            return;
	        }
	        
	        join();  
	    }       
	     
	    function join(){
	    	var formData = {
	                userId: $('#userId').val()
	              , userPw: $('#userPw').val()
	              , userNm: $('#userNm').val()
	              , age: $('#age').val()
	              , job: $('#job').val()
	              , sex: $('input[name=sex]:checked').val()
	              , career: $('#career').val()
	              , phone: $('#phone').val()
	              , addr: $('#addr').val() 
	              , email: $('#email').val()
	              , intro: $('#intro').val()
	    	};
	    	 
	    	$.ajax({
	    		url : CONTEXT_PATH + "/join/joinChk", 
	    		type: "POST",  
	    		data: formData,
	    		success: function(data){
	    			console.log("join");  
	    			
	    			if(data == 'success'){
	        			location.href = CONTEXT_PATH + "/";  
	    			} else {  
	    				alert("ID 또는 PW를 확인해주세요.");
	    				location.href = CONTEXT_PATH + "/join";
	    			} 
	    		},
	    		error: function(data){ 
	    		   		location.href = CONTEXT_PATH + "/join";
	    		   		console.log("error");
	    		}
	    	});   
	    }
	</script>
</body>
</html>
