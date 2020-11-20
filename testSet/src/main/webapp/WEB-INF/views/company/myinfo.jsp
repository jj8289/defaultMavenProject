<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../common/common.jsp" />    
<title>마이페이지</title>
<style type="text/css">
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

#selectSalary{
	height: 30px; 
	display: flex; 
}

.temp {
	height: 50px; 
}

body {
	margin: 0; 
	padding: 0;
}

.title {
	width: 100%;
	margin: 0;
	height: 45px;
	font-size: 30px;
	text-align: center;
} 
 
.infoCon {
 	margin: 0 auto;   
} 
 
table { 
	margin: 0 auto;   
}

td {
	height: 30px;
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

.but input , button{
	border: none;
	background-color: #424242;
	color: white;
	width: 100px;
	height: 30px;
}

input, select {
	height: 30px; 
}

#location {
	display: flex;  
} 
</style>   
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
</head>    
<body>   
	<div id="container">    
		<div class="temp"></div>
		<h2 class="title">내 정보 수정</h2>   
		<div class="temp"></div>  
		<div class="infoCon">  
			<form id="infoForm" name="infoForm">   
				<table cellspacing="3" style="height: 60px;">
					<tr>  	
						<td bgcolor="lightgrey" align="center">병원명</td>    
						<td><input type="text" id="companyNm" name="companyNm" value="${company.companyNm }" disabled="disabled"></td>      
					</tr>
	 				<tr>  	
						<td bgcolor="lightgrey" align="center">관리자 ID</td>    
						<td><input type="text" id="mgId" name="mgId" value="${company.managerId }" disabled="disabled"></td>      
					</tr>
					<tr>   
						<td bgcolor="lightgrey" align="center">관리자 PW</td>    
						<td><input type="text" id="mgPw" name="mgPw" value="${company.managerPw }" disabled="disabled"></td>
					</tr>
					<tr>   
						<td bgcolor="lightgrey" align="center">관리자 이름</td> 
						<td><input type="text" id="mgNm" name="mgNm" value="${company.managerNm }" disabled="disabled"></td>  
					</tr>  
					<tr> 
						<td bgcolor="lightgrey" align="center">관리자 핸드폰 번호</td>
						<td><input type="text" id="phone" name="phone" value="${company.phone }" disabled="disabled"></td>
					</tr>  
					<tr>  	  
						<td bgcolor="lightgrey" align="center">주소</td>    
						<td><input type="text" id="addr" name="addr" value="${company.addr }" size="70"></td>     
					</tr> 
					<c:if test="${company.tel != null and company.tel != '' }"> 
					<tr>  
						<td bgcolor="lightgrey" align="center">전화 번호</td> 
						<td><input type="text" id="tel" name="tel" value="${company.tel }" disabled="disabled"></td>
					</tr>
					</c:if> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">이메일</td>    
						<td><input type="text" id="email" name="email" value="${company.email }" size="70"></td>      
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">병원/의원 구분</td>    
						<td><input type="text" id="kind" name="kind" value="${company.kind }" size="70"></td>      
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">소개글</td>    
						<td><input type="text" id="intro" name="intro" value="${company.intro }" size="70"></td>      
					</tr>
					<tr>  	 
						<td bgcolor="lightgrey" align="center">사업자 등록번호</td>    
						<td><input type="text" id="intro" name="intro" value="${company.businessNum }" size="70"></td>      
					</tr> 
				</table> 
				<p class="but" align="center" > 
					<input type="button" value="뒤로가기" onclick="history.back()"> 
					<button id="info" value="변경" type="button" onclick="validationChk()" class="btn">변경</button>  
					<input type="reset" value="리셋">  
					<input type="button" value="홈으로" onclick="goHome()">
				</p> 
			</form>    
		</div>   
	</div>      
</body>
</html>