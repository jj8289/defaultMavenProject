<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<link rel="shortcut icon" type="image/x-icon" href="/jj/resources/favicon.ico">   
</head> 
<style>
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
	/* width: 100px; */ 
	text-align:center;
	vertical-align:middle;  
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
</style>    
<body>        
	<h1>   
		title  
	</h1>     
	<div class="context"> 
		<div class="left_context"> 
			<div class="con">   
				<table>  
					<tr>
						<td class="label">time</td>
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
			</div>  
			<div class="box box2">
				<div class="a">clothes2</div> 
				<img alt="" src="/jj/resources/c1.png">  
			</div>    
			<div class="box box3"> 
				<div class="a">clothes3</div>  
				<img alt="" src="/jj/resources/c1.png">        
			</div>          
		</div>    
	</div>	
	<div class="word"> 
		<p>Word of the day : It is good weather!! Have a good day~~~~</p>   
	</div>     
</html>  
  