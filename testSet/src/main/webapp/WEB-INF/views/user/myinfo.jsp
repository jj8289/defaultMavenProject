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
						<td bgcolor="lightgrey" align="center">ID</td>    
						<td><input type="text" id="userId" name="userId" value="${user.userId }" disabled="disabled"></td>      
					</tr>
					<tr>   
						<td bgcolor="lightgrey" align="center">PW</td>    
						<td><input type="text" id="userPw" name="userPw" value="${user.userPw }" disabled="disabled"></td>
					</tr>
					<tr>   
						<td bgcolor="lightgrey" align="center">이름</td> 
						<td><input type="text" id="userNm" name="userNm" value="${user.userNm }" disabled="disabled"></td>  
					</tr>  
					<tr> 
						<td bgcolor="lightgrey" align="center">나이</td>
						<td><input type="text" id="age" name="age" value="${user.age }" disabled="disabled"></td>
					</tr>  
					<tr>  	
						<td bgcolor="lightgrey" align="center">직업</td>    
						<td>
							<select>
								<option value="">선택</option>
								<c:forEach var="item" items="${jobList }">
									<option id="${item.key }" value="${item.key }">${item.value }</option>
									<c:if test="${item.key == jobNm }">
										<option id="${item.key }" value="${item.key }" selected>${item.value }</option>
									</c:if>  
								</c:forEach> 
							</select> 
						
						</td>     
					</tr> 
					<tr>  	
						<td bgcolor="lightgrey" align="center">성별</td>    
						<td><input type="text" id="sex" name="sex" value="${user.sex }" disabled="disabled"></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">연차(경력)</td>    
						<td><input type="text" id="career" name="career" value="${user.career }" ></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">핸드폰 번호</td>    
						<td><input type="text" id="phone" name="phone" value="${user.phone }" disabled="disabled"></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">이메일</td>    
						<td><input type="text" id="email" name="email" value="${user.email }" ></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">주소</td>    
						<td><input type="text" id="addr" name="addr" value="${user.addr }" ></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">간단 소개</td>    
						<td><input type="text" id="intro" name="intro" value="${user.intro }" ></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">가입일</td>    
						<td><input type="text" id="createDate" name="createDate" value="${user.createDate }" disabled="disabled"></td>     
					</tr> 
					<tr>  	 
						<td bgcolor="lightgrey" align="center">면허증/자격증</td>    
						<td><input type="text" id="licenseNo" name="licenseNo" value="${user.licenseNo }" disabled="disabled"><input type="button" value="+"> </td>
					</tr> 
					<tr>  	  
						<td bgcolor="lightgrey" align="center">기술</td>    
						<td><input type="text" id="skill" name="skill" value="${user.skill }"></td>     
					</tr>  
					<tr >    
						<td bgcolor="lightgrey" align="center"></td>   
						<td id="selectSalary">   
							<c:if test="${not empty vo.salaryHour}">
								<select id="salType" name="salType" onchange="setSalaryType()">
									<option value="">선택</option> 
									<option value="hour" selected>시급</option> 
									<option value="day">일급</option>  
								</select>
								<input type="text" name="salary_hour" id="salary_hour" size="10"  value="${vo.salaryHour }" > 원 이상  	 
							</c:if>
							<c:if test="${not empty vo.salaryDay}">
								<select id="salType" name="salType" onchange="setSalaryType()">
									<option value="">선택</option>   
									<option value="hour">시급</option>  
									<option value="day" selected>일급</option>  
								</select>
								<input type="text" name="salary_day" id="salary_day" size="10" value="${vo.salaryDay }"> 원 이상 	  
							</c:if>
						</td>   
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