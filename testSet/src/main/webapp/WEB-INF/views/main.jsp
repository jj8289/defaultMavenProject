<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head> 
<jsp:include page="\/common/common.jsp" />                 
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

.hi {
	color: white;
    cursor: pointer; 
	font-size: 15px; 
	font-weight: normal;
	text-align: center;
	display: block;
	line-height: 40px;  
	height: 40px;
	margin-left: 20px;  
}   
</style> 
</head>
<body> 
<c:choose>
	<c:when test="${empty usrlogin and empty mglogin }">  
		<div class="menu_bar"> 
			<div class="menu join" onclick="location.href='/jj/common/join'">join</div>   
			<div class="menu login" onclick="location.href='/jj/common/login'">login</div>  
		</div>   
	</c:when>     
	<c:otherwise>    
		<div class="menu_bar">
			<c:if test="${not empty usrlogin }">
				<div class="menu login" onclick="logout()">logout</div>
				<c:if test="${reg == null}"><div class="menu register" onclick="location.href='/jj/user/register'">register</div></c:if>
				<div class="menu mypage" onclick="location.href='/jj/user/mypage'">mypage</div>  
				<div class="menu match" onclick="match()">match</div>   
				<div class="hi" >반갑습니다~ 유저 ${usrlogin } 님</div>    
			</c:if>   
			<c:if test="${not empty mglogin }">  
				<div class="menu login" onclick="logout()">logout</div>
				<%-- <c:if test="${reg == null}"><div class="menu register" onclick="location.href='/jj/user/register'">register</div></c:if>
				<div class="menu mypage" onclick="location.href='/jj/user/mypage'">mypage</div>  
				<div class="menu match" onclick="match()">match</div>    --%> 
				<div class="hi" >반갑습니다~ 관리자 ${mglogin } 님</div> 
			</c:if>   
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
	
	function logout(){
		location.href = "/jj/common/logout";
	} 
	

</script>
</html>