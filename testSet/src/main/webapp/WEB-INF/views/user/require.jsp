<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="../common/common.jsp" />  
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
	<title>등록</title>
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

.minicon {
 	margin: 0 auto;   
 	width: 800px;
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

label {
	display:inline-block; width:100px; line-height:30px; 
}   

select {
	height: 30px; 
}

input {
	height: 22px;
}
</style>   
</head>    
<body>   
	<div id="container">    
		<div class="temp"></div>
		<h2 class="title">조건 등록</h2>   
		<div class="temp"></div> 
		<div class="minicon">
			<form id="regForm" name="regForm">   
				<table cellspacing="3" style="height: 60px;">
					<colgroup>  
	   					<col width="15%"/> 
	    				<col width="85%"/>  
	 				</colgroup>    
	 				<tr> 
						<td bgcolor="lightgrey" align="center">근무기간</td> 
						<td>
							<select id="term" name="term" onchange="setTerm()">
								<option value="">선택</option>  
								<option value="one">일일 알바</option>
								<option value="part">장/단기 알바</option> 
								<option value="sat">고정 토요 알바</option>  
							</select>  
						</td>     
					</tr>
					<tr id="for_one">  
						<td bgcolor="lightgrey" align="center">날짜</td>
						<td>
							<input type="text" id="datepicker" name="datepicker">
						</td>
					</tr>
					<tr id="for_date">
						<td bgcolor="lightgrey" align="center">원하는 시작일</td> 
						<td onchange="setDatepicker()">
							<input type="text" id="datepicker_start" name="datepicker_start">
						</td>  
					</tr> 
					<tr id="for_dow" onchange="selectDow()">
						<td bgcolor="lightgrey" align="center">요일</td>
						<td id="dayofweekend"> 
							<label><input type="checkbox" name="dow" value="0"> 상관없음</label> 
							<label><input type="checkbox" name="dow" value="1"> 월요일</label>
							<label><input type="checkbox" name="dow" value="2"> 화요일</label>
							<label><input type="checkbox" name="dow" value="3"> 수요일</label>
							<label><input type="checkbox" name="dow" value="4"> 목요일</label>
							<label><input type="checkbox" name="dow" value="5"> 금요일</label>
							<label><input type="checkbox" name="dow" value="6"> 토요일</label>
							<label><input type="checkbox" name="dow" value="7"> 일요일</label>
						</td> 
					</tr> 
					<tr>
						<td bgcolor="lightgrey" align="center">시급/일급</td> 
						<td id="selectSalary"> 
							<select id="salType" name="salType" onchange="setSalaryType()">
								<option value="">선택</option> 
								<option value="hour">시급</option> 
								<option value="day">일급</option>   
							</select>
							<input type="text" name="salary_hour" id="salary_hour" size="10">
							<input type="text" name="salary_day" id="salary_day" size="10">
							<div id="salaryBox"></div>
						</td> 
					</tr>   
					<tr> 
						<td bgcolor="lightgrey" align="center">시간</td> 
						<td>
							<select id="time" name="time">
								<option value="0">상관없음</option>
								<option value="1">오전</option>
								<option value="2">오후</option> 
								<option value="3">하루</option>
							</select>
						</td>   
					</tr> 
					<tr onchange="selectLoc()">
						<td bgcolor="lightgrey" align="center" rowspan="2">동/읍/면</td>  
						<td>   
							<label><input type="checkbox" name="loc" value="0"> 전체</label>
							<c:forEach items="${addrList }" var="dong">
								<label><input type="checkbox" name="loc" value="${dong.addrNo }">${dong.dnNm }</label>
							</c:forEach>
						</td>
					</tr>
					<!-- <tr onchange="selectLoc()"> 
						<td bgcolor="lightgrey" align="center" rowspan="2">동/읍/면</td>  
						<td id="location" rowspan="2">     
							<label><input type="checkbox" name="loc" value="0"> 전체</label>
							<label><input type="checkbox" name="loc" value="1"> 통진읍</label>
							<label><input type="checkbox" name="loc" value="2"> 고촌읍</label>
							<label><input type="checkbox" name="loc" value="3"> 양촌읍</label>
							<label><input type="checkbox" name="loc" value="4"> 대곶면</label>
							<label><input type="checkbox" name="loc" value="5"> 월곶면</label>
							<label><input type="checkbox" name="loc" value="6"> 하성면</label>
							<label><input type="checkbox" name="loc" value="7"> 김포본동</label>
						</td>    
					</tr> 
					<tr onchange="selectLoc()"> 
						<td id="location">   
							<label><input type="checkbox" name="loc" value="8"> 장기본동</label>
							<label><input type="checkbox" name="loc" value="9"> 사우동</label>
							<label><input type="checkbox" name="loc" value="10"> 풍무동</label>
							<label><input type="checkbox" name="loc" value="11"> 장기동</label>
							<label><input type="checkbox" name="loc" value="12"> 구래동</label>
							<label><input type="checkbox" name="loc" value="13"> 마산동</label>
							<label><input type="checkbox" name="loc" value="14"> 운양동</label>
						</td> 
					</tr> -->   
				</table> 
				<p class="but" align="center" > 
					<button id="reg" value="등록" type="button" onclick="validationChk()" class="btn">등록</button>  
					<input type="reset" value="리셋">  
					<input type="button" value="홈으로" onclick="goHome()">
				</p> 
			</form>    
		</div>  
	</div>  
<script type="text/javascript">
	var CONTEXT_PATH = "/jj";
	var salaryHour = "";
	var salaryDay = "";
	var dowList = [];
	var locList = [];
	var frm = "";
	var addrList = "${addrList}";
	
	console.log(addrList);
	
	
	$(document).ready(function () {
		$("#for_one").hide();
		$("#for_date").hide();
		$("#for_dow").hide();
		$("#salary_hour").hide();
		$("#salary_day").hide();
	}); 
 
	$(function() {
		$.datepicker.setDefaults({ 
			 dateFormat: 'yy-mm-dd' //Input Display Format 변경
             ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
             ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
             ,changeYear: true //콤보박스에서 년 선택 가능
             ,changeMonth: true //콤보박스에서 월 선택 가능                
             ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
             ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
             ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
             ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
             ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
             ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
             ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
             ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
             ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
             ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
             ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
		}); 
		     
		$('#datepicker').datepicker();  
		$('#datepicker_start').datepicker();  
		       
		//초기값을 오늘 날짜로 설정 
        //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	});  
	 
	function calDate(mon){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMont() + 1;
		var yyyy = today.getFullYear();
		
		
	}
	
	function validationChk(){
		frm = document.regForm;
		
		if(!frm.term.value){
			alert("근무기간을 선택해주세요.");
            frm.term.focus();
            return; 
		} else {
			if(frm.term.value == "one"){
				if(!frm.datepicker.value){
					alert("날짜를 선택해주세요.");
		            frm.datepicker.focus();
		            return;
				} 
			} else if(frm.term.value == "part" || frm.term.value == "sat")	{
				if(!frm.datepicker_start.value){
					alert("시작 날짜를 선택해주세요.");
		            frm.datepicker_start.focus();
		            return; 
				}
				
				if(frm.term.value == "part"){
					if(dowList.length == 0){ 
						alert("요일을 선택해주세요.");
			            return;	 
					}   
				}
			}	
		}   
		if(!frm.salType.value){
			alert("시급/일급을 선택해주세요.");
            frm.salType.focus();
            return; 
		} else {
			if(frm.salType.value == "hour"){
				if(!frm.salary_hour.value){ 
					alert("원하시는 시급을 입력해주세요.");
		            frm.salary_hour.focus();
		            return;
				}
			}
			if(frm.salType.value == "day"){
				if(!frm.salary_day.value){ 
					alert("원하시는 일급을 입력해주세요.");
		            frm.salary_day.focus();
		            return;
				} 
			}
		} 
		
		if(locList.length == 0){
			alert("동/읍/면을 선택해주세요.");
            return;
		}  
		
		requireChk(frm);
	}  
	 
	function requireChk(frm) {
		var params = {};		
		 
		if($("select[name=salType]").val() == "hour"){
			salaryDay = "";
			salaryHour = $("#salary_hour").val();
		} else if($("select[name=salType]").val() == "day"){
			salaryHour = "";
			salaryDay = $("#salary_day").val();
		}
		
		if($("#term").val() == "sat"){
			console.log("sat!!!");
			dowList[0] = "6";
			console.log(dowList);
		}
		if($("#term").val() == "one"){
			console.log("one!!!");
			dowList[0] = "";
			console.log(dowList);
		}
		
 		 
		params = {
				salaryHour : salaryHour
			  , salaryDay : salaryDay
			  , searchType : $("select[name=term]").val()
			  , salaryHour : salaryHour
			  , salaryDay : salaryDay 
			  , searchDate : $("#datepicker").val()
			  , searchStart : $("#datepicker_start").val()
			  , searchTime : $("select[name=time]").val()
			  , dowList : dowList
			  , locList : locList
		};  
		 
		/* if($("#term").val() != "one"){
			params = $.extend(params, { 
				dowList : dowList
			});
		} */
		
		console.log(params);
		
		 
		/* if(frm.term.value == "dow"){
			params = {
				  	salaryHour : salaryHour
				  , salaryDay : salaryDay
				  , searchType : $("select[name=term]").val()
				  , salaryHour : salaryHour
				  , salaryDay : salaryDay 
				  , searchDate : $("#datepicker").val()
				  , searchStart : $("#datepicker_start").val()
				  , searchEnd : $("#datepicker_end").val()
				  , searchTime : $("select[name=time]").val()
				  , dowList : dowList
				  , locList : locList
			}; 
		} else {
			params = {
				  	salaryHour : salaryHour
				  , salaryDay : salaryDay
				  , searchType : $("select[name=term]").val()
				  , salaryHour : salaryHour
				  , salaryDay : salaryDay 
				  , searchDate : $("#datepicker").val()
				  , searchStart : $("#datepicker_start").val()
				  , searchEnd : $("#datepicker_end").val()
				  , searchTime : $("select[name=time]").val()
				  , locList : locList
			}; 
		}  */
		 
		 
		console.log(JSON.stringify(params));  
		
		$.ajax({
    		url : CONTEXT_PATH + "/user/require/requireChk", 
    		type: "POST",
    		data: JSON.stringify(params),     
    		dataType: 'json',   
    		contentType:"application/json;charset=UTF-8",
    		success: function(data){
    			console.log("requireChk");  
    			console.log(data.list); 
    			location.href = CONTEXT_PATH + "/";  
    		},   
    		error: function(data){  
   		   		console.log("error");
   		   		console.log(data.errmsg);  
   		   		console.log(data.param); 
    		}
    	});   
	}
	 
	function setTerm() {
		var term = $("select[name=term]").val(); // 선택된 값
		console.log($("select[name=term]").val());   
		
		if(term == "one"){
			$("#for_one").show();
			$("#for_date").hide();
			$("#for_dow").hide();
		} else if(term == "part"){
			$("#for_one").hide();
			$("#for_date").show();
			$("#for_dow").show();
		} else if(term == "sat"){
			$("#for_one").hide();
			$("#for_date").show();
			$("#for_dow").hide(); 
		} else { 
			$("#for_one").hide();
			$("#for_date").hide();
			$("#for_dow").hide(); 
		}   
		 
	}
	  
	function setSalaryType() {
		var salType = $("select[name=salType]").val(); // 선택된 값
		//console.log($("select[name=salType]").val());   
		console.log(salType);   

		if(salType == "hour"){
			$("#salaryBox").text("원 이상");  
			$("#salary_hour").show(); 
			$("#salary_day").hide(); 
 			
		} else if(salType == "day"){
			$("#salaryBox").text("원 이상"); 
			$("#salary_hour").hide();  
			$("#salary_day").show();  
		} else { 
			$("#salaryBox").text("");  
		}    
	}   
	
	function setDatepicker() {
		
		console.log($("#datepicker_start").val()); 
	}
	
	function selectDow(){
		var obj = document.getElementsByName("dow");
		var len = obj.length;
		 
		dowList = [];
		
		for(var i = 0; i<len; i++){
			if(obj[i].checked == true){
				console.log(obj[i].value); 
				
				if(obj[i].value == "0"){
					for(var k = 1; k<len-1; k++){
						obj[k].checked = false;
					}
				}
				  
				dowList.push(obj[i].value);
			}   
		}  
		 
		console.log(dowList);   
	}
	
	function selectLoc(){
		var obj = document.getElementsByName("loc");
		var len = obj.length;	
		locList = [];
		
		console.log(len);
		
		for(var i = 0; i<len; i++){
			if(obj[i].checked == true){
				console.log(obj[i].value); 
				 
				if(obj[i].value == "0"){
					for(var k = 1; k<len-1; k++){
						obj[k].checked = false;
					}
				}
				
				locList.push(obj[i].value);
			}   
		}
		console.log(locList);
	}
	
	function goHome(){ 
		location.href = CONTEXT_PATH + "/";
	}
	
</script>	
</body>
</html>