<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="shortcut icon" type="image/x-icon" href="/jj/resources/favicon.ico">   
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
</style>         
<body>   
	<div class="menu_bar"> 
		<div class="menu today" onclick="location.href='/jj/'">today</div>
		<div class="menu tomorrow" onclick="location.href='/jj/tomorrow'">tomorrow</div> 
	</div>        
	<h2>      
		What to wear today? ;) 
	</h2>               
	<div class="banner1"></div>
	<div class="select"> 
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
	</div>      
	<div class="context">    
		<div class="left_context"> 
			<div class="con">   
				<table>  
					<tr>
						<td class="label">time </td>
						<td>2020-10-06  12:00</td> 
					</tr>  
					<tr> 
						<td class="label">temp</td>
						<td>22°</td>  
					</tr>   
					<tr>   
						<td class="label">feels</td>
						<td>21°</td>   
					</tr>   
					<tr>   
						<td class="label">weather</td>
						<td>sunny</td>    
					</tr>     
					<tr>  
						<td class="label">weather</td>
						<td><img alt="" src="/jj/resources/favicon.ico"> </td>     
					</tr>    
				</table>   
			</div>     
		</div>   
		<div class="right_context">  
			<div class="box box1">    
				<div class="a">clothes1</div> 
				<img alt="" src="/jj/resources/c1.png">  
				<img alt="" src="/jj/resources/jean.jpg"> 
				<img class="shoe" alt="" src="/jj/resources/vans.jpg"> 
			</div>  
			<div class="box box2"> 
				<div class="a">clothes2</div>   
				<img alt="" src="/jj/resources/c1.png"> 
				<img alt="" src="/jj/resources/jean.jpg">   
				<img class="shoe" alt="" src="/jj/resources/vans.jpg"> 
			</div>    
			<div class="box box3"> 
				<div class="a">clothes3</div>    
				<img class="top" alt="" src="/jj/resources/c1.png">   
				<img class="bot" alt="" src="/jj/resources/jean.jpg">       
				<img class="shoe" alt="" src="/jj/resources/vans.jpg"> 
			</div>                
		</div>       
	</div>	 
	<div class="word">  
		<p>Word of the day : It is good weather!! Have a good day~~~~!</p>  
		<div class="banner2"> banners </div>
		<div class="banner2"> banners </div>     
		<div class="banner2"> banners </div>         
	</div>       
</html>  
  