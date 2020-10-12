<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
</head>  
<body>
	<div id="container">
		<div class="temp"></div>
		<h2 class="title">조건 등록</h2>
		<div class="temp"></div>
		<div class="minicon">
			<form id="regForm" name="regForm">
				<table cellspacing="3" style="height: 60px;">
					<!-- <colgroup> 
	   					<col width="30%"/>
	    				<col width="30%"/> 
	 				</colgroup> --> 
	 				<tr> 
						<td bgcolor="lightgrey" align="center">근무기간</td> 
						<td>
							<select id="term" name="term" onchange="setTerm()">
								<option value="">선택</option>  
								<option value="one">일일 알바</option>
								<option value="date">기간으로 설정</option> 
								<option value="dow">요일 설정</option>  
							</select> 
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
							<input type="text" name="salary_day" id="salary_day" size="10"> 원 이상  
						</td> 
					</tr>  
					<tr id="for_one">  
						<td bgcolor="lightgrey" align="center">날짜</td>
						<td>
							<input type="text" id="datepicker">
						</td>
					</tr>
					<tr id="for_date">
						<td bgcolor="lightgrey" align="center">기간</td> 
						<td onchange="setDatepicker()">
							<input type="text" id="datepicker_start">~<input type="text" id="datepicker_end"> 
						</td>
						<td> 또는 </td> 
						<td><input type="text" id="month" size="2">개월  </td> 
					</tr> 
					<tr id="for_dow">
						<td bgcolor="lightgrey" align="center">요일</td>
						<td>
							<label><input type="checkbox" name="dow" value="mon"> 월요일</label>
							<label><input type="checkbox" name="dow" value="mon"> 화요일</label>
							<label><input type="checkbox" name="dow" value="mon"> 수요일</label>
							<label><input type="checkbox" name="dow" value="mon"> 목요일</label>
							<label><input type="checkbox" name="dow" value="mon"> 금요일</label>
							<label><input type="checkbox" name="dow" value="mon"> 토요일</label>
							<label><input type="checkbox" name="dow" value="mon"> 일요일</label>
						</td> 
					</tr> 
					<tr> 
						<td bgcolor="lightgrey" align="center">시간</td> 
						<td>
							<select id="time" name="time">
								<option value="1">상관없음</option>
								<option value="2">오전</option>
								<option value="3">오후</option> 
								<option value="4">하루</option>
							</select>
						</td>   
					</tr>  
				</table> 
				<p class="but" align="center" > 
					<button id="login" value="로그인" type="button" onclick="registerChk()" class="btn">등록</button>  
					<input type="reset" value="리셋">  
					<input type="button" value="홈으로" onclick="goHome()">
				</p> 
			</form>    
		</div>  
	</div>  
<script type="text/javascript">
	var CONTEXT_PATH = "/jj";
	 
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
		$('#datepicker_end').datepicker();  
		       
		//초기값을 오늘 날짜로 설정 
        //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후) 
	});  
	 

	function registerChk() {
		var type = $("select[name=search_type]").val(); // 선택된 값
		var params = {
				
				
		}; 
		
		$.ajax({
    		url : CONTEXT_PATH + "/register/registerChk", 
    		type: "POST",  
    		data: params,
    		success: function(data){
    			console.log("registerChk");  
    			console.log(data.list);
    			console.log(data.type);
    			console.log(data.size);
    		},
    		error: function(data){ 
   		   		console.log("error");
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
		} else if(term == "date"){
			$("#for_one").hide();
			$("#for_date").show();
			$("#for_dow").hide();
		} else if(term == "dow"){
			$("#for_one").hide();
			$("#for_date").hide();
			$("#for_dow").show(); 
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
			$("#salary_hour").show();
			$("#salary_day").hide();
 			
		} else if(salType == "day"){
			$("#salary_hour").hide();  
			$("#salary_day").show();
		}       
	}   
	
	function setDatepicker() {
		
		console.log($("#datepicker_start").val()); 
		console.log($("#datepicker_end").val());  
	}
	
	function goHome(){ 
		location.href = CONTEXT_PATH + "/";
	}
	
</script>	
</body>
</html>