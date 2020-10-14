<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.menu_bar {
	height: 40px; 
	background-color: black;  
	display: flex;
}

.menu {  
	color: white;
	font-size: 22px;
	font-weight: bold; 
	padding: 5px;      
    cursor: pointer;
} 
</style>
</head>
<body> 
<c:choose>
	<c:when test="${empty user.userId }">
		<div class="menu_bar"> 
			<div class="menu join" onclick="location.href='/jj/join'">join</div>   
			<div class="menu login" onclick="location.href='/jj/login'">login</div>
		</div>  
	</c:when>  
	<c:otherwise>  
		<div class="menu_bar">  
			<div class="menu login" onclick="location.href='/jj/logout'">logout</div>
			<c:if test="${reg == null}"><div class="menu register" onclick="location.href='/jj/register'">register</div></c:if>
			<div class="menu mypage" onclick="location.href='/jj/mypage'">mypage</div>  
			<div class="menu match" onclick="match()">match</div>    
		</div>	 
	</c:otherwise>      
</c:choose>  	         
</body>  
<script type="text/javascript">  
	var user = "${user.userId}";   
	var req = "${reg.reqNo}";   
	
	function match(){    
		if(req == ""){
			alert("조건을 먼저 등록해주세요.");
		} else { 
			console.log(req);  
			goMatch(); 
		}
	}    
  
	function goMatch(){ 
		location.href='/jj/match';
	}

</script>
</html>