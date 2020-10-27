<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="common.jsp" />     
<title>로그인</title> 
<style type="text/css">
body {
	margin: 0; 
	padding: 0;
}

.temp {
	height: 50px;
}  

.title {
	width: 100%;
	margin: 0;
	height: 45px;
	font-size: 30px;
	text-align: center;
}
	
.btnCon {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 400px;
}   
 
button { 
	border: none;
	background-color: #424242;
	color: white;
	width: 200px; 
	height: 100px;
	font-size: 20px;
	cursor: pointer;  
} 
 
.btn { 
	margin: 20px; 
}
</style>  
</head>  
<body>  
<div id="container">   
	<div class="temp"></div> 
		<h2 class="title">로그인</h2>  
		<div class="temp"></div>  
	<div class="btnCon">    
		<button id="user_login" value="알바로 로그인" type="button" onclick="location.href = '/jj/user/login'" class="btn">알바로 로그인</button>
		<button id="company_login" value="병원으로 로그인" type="button" onclick="location.href = '/jj/company/login'" class="btn">병원으로 로그인</button>
	</div> 
</div> 
</body>  
</html>