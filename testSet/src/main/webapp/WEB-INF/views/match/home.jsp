<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
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
 
.banner1 {
	height: 60px; 
	background-color: yellow;   
}

.banner2 {
	height: 60px; 
	background-color: yellow; 
	text-align: center;   
} 

h2 {
	text-align: center;
} 

.context {
	display: flex; 
	justify-content: center;
}
 
.left_context {
	display: flex; 
	flex-direction:column;
}  
 
.right_context {
	display: flex; 
}     

/*.context > div {
	flex: 1;     
}
 */  
 .left_context > div {
	flex : 1;
	text-align:center;
	vertical-align:middle; 
} 
 
.right_context > div {
	flex : 1;
	text-align:center;
	vertical-align:middle; 
}    
     
.con {
	background-color: white;   
	border: 3px ridge;   
	height: 100px;   
	text-align:center;
	vertical-align:middle;  
}
      
.box {  
	background-color: rgb(207,232,220);
	border: 3px ridge;      
}  
 
tr { 
	width : 300px;
} 

td { 
	height: 70px; 
	text-align: center;  
	marginL: auto; 
}   
  
.label{
	width: 100px; 
	background-color: rgb(207,232,220); 
}     
 
.word {
	vertical-align:middle;  
	text-align: center; 
	height: 200px; 
} 

.box > img {
	width: 150px;
	vertical-align:middle; 
	display: flex;
	flex-direction:column; 
	justify-content: center; 
}  
  
.box > .top .bot {
	height: 100px;
}     

.box > .shoe { 
	height: 70px;  
}       

.select {  
	text-align: center; 
	display: flex; 
	justify-content: center; 
	height: 40px;   
	vertical-align: middle; 
	align-items: center; 
}    

label {
	width: 40px;
}  

.table-body {
	display: flex;
	justify-content: center;  
} 

.space {
	height: 50px;
}

.card { 
	height: 400px; 
}

button {
	border: none;
	background-color: #424242;
	font-weight: bold; 
	font-size: 30px; 
	color: white;
	width: 150px;
	height: 150px;  
}   

.match_btn {
	display: flex; 
	justify-content: center;
	align-items: center;   
	height: 300px;   
} 
</style> 
<body>
	<div class="menu_bar"> 
		<div class="menu today" onclick="location.href='/jj/'">today</div>
		<div class="menu tomorrow" onclick="location.href='/jj/tomorrow'">tomorrow</div>  
		<div class="menu join" onclick="location.href='/jj/join'">join</div>   
		<div class="menu login" onclick="location.href='/jj/login'">login</div>
		<div class="menu match" onclick="location.href='/jj/match'">match</div>       
	</div>  
	<div class="space"></div>        
	<h2>        
		matching system (${userId }님) 
	</h2>               
	<div class="space"></div>          
	<%-- <div class="select">   
		<label for="" class="">City</label>
		<div class="select1">
			<select name="selectCity">
				<c:set var="i" value="0"></c:set>
				<c:forEach var="city" items="${cityList }">
					<c:set var="i" value="${i + 1 }"></c:set> 
					<option value="${i }">${city }</option>   
				</c:forEach>      
			</select>       
		</div>   
		<div style="width: 10px;"></div>     
		<label for="" class="">Sex</label>
		<div class="select2">  
			<select name="selectSex">
				<option value="1">Female</option>
				<option value="2">Male</option> 
			</select>    
		</div>    
	</div>  --%>      
	
	<div class="card">
		<div class="table-header">
			<div class="left" id="cnt">
			</div>
		</div>
		<div class="table-body"> 
			<table id="listTable" class="table-border table-hover">
				<colgroup>
					<col style="width: 150px">
					<col style="width: 150px">
					<col style="width: 150px"> 
					<col style="width: 150px">  
				</colgroup>      
				<thead>            
					<tr>  
						<th scope="col">매칭 대기 인원</th>
						<th scope="col">매칭 대기 job</th>
						<th scope="col">매칭 중</th>
						<th scope="col">매칭 완료</th>
					</tr>  
					<tr>  
						<th scope="col">100</th>
						<th scope="col">100</th>
						<th scope="col">30</th>
						<th scope="col">200</th>
					</tr> 
				</thead> 
				<tbody id="listBody">
				</tbody> 
			</table>
		</div>
		<div class="match_btn">
			<button id="match1" value="matching" type="button" onclick="matching()" class="btn">match</button>
			<p></p>
		</div> 
		<div class="page-navi">
		</div>
	</div>
	<div class="word">   
		<div class="banner2"> banners </div>
		<div class="banner2"> banners </div>     
		<div class="banner2"> banners </div>         
	</div>  
</body>
<script type="text/javascript">

	function matching() {
		
	}
</script>
</html>