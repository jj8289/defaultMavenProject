<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="shortcut icon" type="image/x-icon" href="/jj/resources/favicon.ico">   
</head> 
<style>
.menu_bar {
	height: 50px; 
	background-color: black;  
	display: flex;
}

.menu { 
	color: white;
	font-size: 22px;
	font-weight: bold; 
	padding: 8px;     
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

h1 {
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
/* 
.button_base {
    margin: 0;
    border: 0;
    font-size: 16px;
    position: relative;
    top: 50%;
    left: 200%;
    margin-top: -25px; 
    margin-left: -70px;  
    width: 100px;
    height: 50px; 
    text-align: center;
    box-sizing: border-box; 
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

.button_base:hover {
    cursor: pointer;
}

button {
    color: #000000;
    border: #000000 solid 1px;
    background-color: #ffffff;
}     
 
button:hover {
    color: #ffffff; 
    background-color: #000000;
} */
 
</style>        
<body>    
	<div class="menu_bar"> 
		<div class="menu today" onclick="location.href='/jj/'">today</div>
		<div class="menu tomorrow" onclick="location.href='/jj/tomorrow'">tomorrow</div> 
		<!-- <div class="menu today"><button class="button_base"  onclick="location.href='/jj/'">today</button></div>
		<div class="menu tomorrow"><button class="button_base" onclick="location.href='/jj/tomorrow'">tomorrow</button></div>  --> 
	</div>       
	<h1>       
		What to wear tomorrow? ;)  
	</h1>        
	<div class="banner1"></div>      
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
  