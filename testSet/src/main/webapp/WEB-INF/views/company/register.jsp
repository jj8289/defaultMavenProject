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
.hasDatepicker{cursor: pointer; height: 28px;} 

.timeBox, #timeSetBox {
	display: flex; 
}     

#selectSalary { 
	height: 30px; 
	display: flex; 
}

#selectPT, #selectOrder{
	height: 30px; 
	display: flex; 
	/* justify-content: space-around; */
	column-gap: 10px; 
}
 
.temp {
	height: 30px; 
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

td, select {
	padding-left: 3px;
	height: 30px;      
} 

.ptWork, #otherWork, #detailBox {
	height: 30px;   
} 
  
#work, #detailWork {
	height: 22px;   
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
					<!-- <colgroup>  
	   					<col width="30%"/>
	    				<col width="30%"/> 
	 				</colgroup> -->  
	 				<tr><td>알바조건<td></tr>  
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
						<td bgcolor="lightgrey" align="center">근무 날짜</td>
						<td onchange="setDatepicker()"> 
							<input type="text" id="datepicker" name="datepicker">
						</td>
					</tr> 
					<tr id="for_date">
						<td bgcolor="lightgrey" align="center">근무 시작 날짜</td> 
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
							<div style="padding-left: 3px; height: 30px">
								<input type="text" name="salary_hour" id="salary_hour" size="10" style="height: 24px">
								<input type="text" name="salary_day" id="salary_day" size="10" style="height: 24px"> 
							</div> 	   
							<div id="salaryBox"></div>   
						</td>    
					</tr>   
					<tr>  
						<td bgcolor="lightgrey" align="center">근무 시간</td> 
						<td id="workTimeBox" class="timeBox">
							<select id="start_hour" name="start_hour" onchange="selectStartHour()"> 
								<option value=""></option> 
								<c:forEach var="i" begin="6" end="24">
									<option value="${i }">${i>9?i:'0' }${i>9?'':i }</option>  
								</c:forEach>      
							</select> 
							<div style="padding: 5px;"> : </div>  
							<select id="start_min" name="start_min"> 
								<option value=""></option> 
								<c:forEach var="i" begin="0" end="55" step="5">
									<option value="${i }">${i<10?'0':i }${i<10?i:'' }</option>   
								</c:forEach>       
							</select> 
							<div style="padding: 5px;"> ~ </div>
							<select id="end_hour" name="end_hour">  
								<option value=""></option> 
								<c:forEach var="i" begin="6" end="24">
									<option value="${i }">${i>9?i:'0' }${i>9?'':i }</option>  
								</c:forEach>       
							</select> 
							<div style="padding: 5px;"> : </div>       
							<select id="end_min" name="end_min"> 
								<option value=""></option>  
								<c:forEach var="i" begin="0" end="55" step="5">
									<option value="${i }">${i<10?'0':i }${i<10?i:'' }</option>   
								</c:forEach>       
							</select> 
							<!-- 
							<select id="time" name="time"> 
								<option value="1">상관없음</option>
								<option value="2">오전</option>
								<option value="3">오후</option> 
								<option value="4">하루</option>
							</select>
							<div id="timeSetBox">
								<input type="text" name="time_start" id="time_start" size="10"> ~ 
								<input type="text" name="time_end" id="time_end" size="10">
						 	</div>  -->
						</td>     
					</tr> 
					<tr>
						<td bgcolor="lightgrey" align="center">직종</td>
						<td>
							<select id="job" name="job" onchange="selectJob()">
								<option value="">선택</option>
								<c:forEach var="item" items="${jobList }">
									<option id="${item.key }" value="${item.key }">${item.value }</option>
								</c:forEach>
							</select>   
						</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">성별</td>
						<td id="sexBox"> 
							<select id="sex" name="sex">
								<option value="">성별 무관</option>
								<option value="F">여</option>
								<option value="M">남</option>
							</select>   
						</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">나이</td>
						<td id="ageBox"> 
							<select id="age" name="age">
								<option value="">나이 무관</option>
								<c:forEach var="i" begin="20" end="40" step="10">
									<option value="${i }">${i }대</option> 
								</c:forEach>
								<option value="50">50대 이상</option> 
							</select>   
						</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">경력</td>
						<td id="careerBox"> 
							<select id="career" name="career">
								<option value="">경력 무관</option>
								<option value="1">1년차만</option>   
								<c:forEach var="i" begin="2" end="10" step="1">
									<option value="${i }">${i }년차 이상</option> 
								</c:forEach>   
							</select>   
						</td>  
					</tr>   
					<tr><td>근무 조건<td></tr>  
					<tr class="forPT"> 
						<td bgcolor="lightgrey" align="center">구분</td>
						<td id="kindBox" onchange="selectKind()"> 
							<label><input type="radio" name="kind" value="os"> OS</label>
							<label><input type="radio" name="kind" value="ns"> NS</label>
						</td>  
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">업무</td>
						<td id="workBox" onchange="selectWork()"> 
							<div id="osWork" class="forOS ptWork">
								<label><input type="checkbox" name="workOS" value="B"> 통증 치료</label>
								<label><input type="checkbox" name="workOS" value="C"> 심플</label>
								<label><input type="checkbox" name="workOS" value="D"> 10분 메뉴얼</label>
								<label><input type="checkbox" name="workOS" value="E"> 도수 치료(30분 이상)</label>
								<label><input type="checkbox" name="workOS" value="F"> 운동 치료</label>
							</div>
							<div id="nsWork" class="forNS ptWork">
								<label><input type="checkbox" name="workNS" value="A"> 신경계 치료</label>
							</div>       
							<div id="otherWork" class="forOther"><input size="70" type="text" name="work" id="work"></div>
						</td> 
					</tr>
					<tr class="forOS">   
						<td bgcolor="lightgrey" align="center">세부 업무</td>
						<td id="selectPT">  
							<label style="background-color: lightgrey; text-align: center;">초음파</label>   
							<select id="micro">     
								<option value="N">X</option>  
								<option value="Y">O</option>
							</select>  
							<label style="background-color: lightgrey; text-align: center;">ESWT</label>    
							<select id="eswt">    
								<option value="N">X</option> 
								<option value="Y">O</option>
							</select>  
							<label style="background-color: lightgrey;">CPM(Knee)</label>    
							<select id="knee">   
								<option value="N">X</option> 
								<option value="Y">O</option>
							</select>  
							<label style="background-color: lightgrey;">CPM(Shoulder)</label>    
							<select id="sh">   
								<option value="N">X</option> 
								<option value="Y">O</option>  
							</select>      
							<label style="background-color: lightgrey;">이온치료</label>  
							<select id="ion">
								<option value="N">X</option> 
								<option value="Y">O</option>
							</select>
						</td>    
					</tr>
					<tr class="forPT">  
						<td bgcolor="lightgrey" align="center">인센티브</td>
						<td id="insentiveBox"> 
							<label><input type="radio" name="insentive" value="Y"> 유</label> 
							<label><input type="radio" name="insentive" value="N"> 무</label>
						</td>   
					</tr> 
					<tr>
						<td bgcolor="lightgrey" align="center">업무 관련 추가 설명</td>
						<td id="detailBox"><textarea name="detailWork" id="detailWork"  rows="5" cols="50" style="margin: 0px; width: 478px; height: 80px;" placeholder="사용하는 기계, 자세한 업무 설명, 알바에게 원하는 기술 등"></textarea></td> 
					</tr> 
					<tr>  
						<td bgcolor="lightgrey" align="center">점심 시간</td> 
						<td id="lunchTimeBox" class="timeBox">
							<select id="lunch_start_hour" name="lunch_start_hour" onchange="selectLunchStartHour()"> 
								<option value=""></option> 
								<c:forEach var="i" begin="11" end="15">
									<option value="${i }">${i>9?i:'0' }${i>9?'':i }</option>  
								</c:forEach>      
							</select>   
							<div style="padding: 5px;"> : </div>      
							<select id="lunch_start_min" name="lunch_start_min"> 
								<option value=""></option> 
								<c:forEach var="i" begin="0" end="55" step="5">
									<option value="${i }">${i<10?'0':i }${i<10?i:'' }</option>   
								</c:forEach>       
							</select> 
							<div style="padding: 5px;"> ~ </div>
							<select id="lunch_end_hour" name="lunch_end_hour">  
								<option value=""></option> 
								<c:forEach var="i" begin="11" end="15">
									<option value="${i }">${i>9?i:'0' }${i>9?'':i }</option>  
								</c:forEach>      
							</select> 
							<div style="padding: 5px;"> : </div>       
							<select id="lunch_end_min" name="lunch_end_min"> 
								<option value=""></option>  
								<c:forEach var="i" begin="0" end="55" step="5">
									<option value="${i }">${i<10?'0':i }${i<10?i:'' }</option>   
								</c:forEach>        
							</select>
							<label style="padding-left: 20px; text-align: center; vertical-align: center;"><input type="checkbox" id="lunchFlag" name="lunchFlag" value="1" onchange="clickNoLunch()"> 점심시간 없음</label> 
						</td>      
					</tr>  
					<tr>  
						<td bgcolor="lightgrey" align="center">근무자 수</td>
						<td><input size="2" type="text" name="peerCnt" id="peerCnt">명</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">일 평균 환자수</td>
						<td><input size="2" type="text" name="avgCnt" id="avgCnt">명      <a style="color: red; font-size: 12px;">* 거짓일 경우 이 서비스에서 영구 제명 가능.</a></td>  
					</tr>   
					<tr>
						<td bgcolor="lightgrey" align="center">기타 복지 및 소개글</td> 
						<td><textarea name="etc" id="etc"  rows="5" cols="50" style="margin: 0px; width: 478px; height: 80px;" placeholder="유니폼 또는 가운 제공, 간식 제공 등 설명글 추가"></textarea></td>  
					</tr>   
					<tr><td>채용 정보<td></tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">채용 연결 핸드폰</td> 
						<td><input size="20" type="text" name="matchPhone" id="matchPhone" ></td>
					</tr> 
					<tr>
						<td bgcolor="lightgrey" align="center">채용 구분</td> 
						<td>
							<select id="hireFlag" name="hireFlag" onchange="selectHireFlag()">
								<option value="">선택</option>
								<option id="uncontact" value="1">매칭 자동 채용</option>
								<option id="contact" value="2">면접 후 채용</option> 
							</select> 
						</td>
					</tr>   
					<tr class="forContact">
						<td bgcolor="lightgrey" align="center">매칭완료 후 면접 날짜</td> 
						<td onchange="setDatepickerContact()"> 
							<input type="text" id="datepicker_contact" name="datepicker_contact">
						</td>
					</tr>
					<tr class="forContact">
						<td bgcolor="lightgrey" align="center">매칭완료 후 안내메세지</td> 
						<td><textarea name="matchMsg" id="matchMsg" rows="5" cols="50" style="margin: 0px; width: 478px; height: 80px;" placeholder="안녕하세요. 지원해주셔서 감사합니다. 채용되신 것을 축하드립니다. 등등 "></textarea></td> 
					</tr> 
					<tr class="forUncontact">
						<td bgcolor="lightgrey" align="center">매칭완료 후 출근 날짜</td> 
						<td>  
							<input type="text" id="datepicker_work" name="datepicker_work">
						</td> 
					</tr>
					
					 
					<!-- <tr><td>우선순위<td></tr>    
					<tr>
						<td bgcolor="lightgrey" align="center">순위</td>
						<td id="selectOrder">
						<label style="background-color: lightgrey; text-align: center;">1순위</label>
						<select id="order1" onchange="selectOrder1()">    
							<option value="">선택</option> 
							<option value="pay">시급/일급</option> 
							<option value="period">근무기간</option> 
							<option value="time">근무시간</option> 
							<option value="sex">성별</option> 
							<option value="age">나이</option> 
							<option value="career">경력</option> 
							<option value="loc">인근 거주자</option> 
						</select>     
						<label style="background-color: lightgrey; text-align: center;">2순위</label>
						<select id="order2">      
							<option value="">선택</option>
							<option value="pay">시급/일급</option> 
							<option value="period">근무기간</option> 
							<option value="time">근무시간</option> 
							<option value="sex">성별</option> 
							<option value="age">나이</option> 
							<option value="career">경력</option> 
							<option value="loc">인근 거주자</option> 
						</select>     
						</td>     
					</tr>  -->
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
	var companyNo = "${companyNo}";
	var salaryHour = "";
	var salaryDay = "";
	var dowList = [];
	var ptWorkList = [];
	var time = "";
	var lunchFlag = "";
	var frm = "";
	
	var hireFlag = "";
	
	$(document).ready(function () {
		$("#for_one").hide();
		$("#for_date").hide();
		$("#for_dow").hide();
		$("#salary_hour").hide();
		$("#salary_day").hide();
		//$("#ptWork").hide();
		$(".forPT").hide();
		$(".forOS").hide();
		$(".forNS").hide();
		$(".forContact").hide();
		$(".forUncontact").hide(); 
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
		$('#datepicker_contact').datepicker(); 
		$('#datepicker_work').datepicker(); 
		       
		//초기값을 오늘 날짜로 설정 
        //$('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	});  
	 
	function clickNoLunch(){
		lunchFlag = $("#lunchFlag:checked").val();
		
		if(lunchFlag == "1"){
			$("#lunchTimeBox select").val(""); 
			$("#lunchTimeBox select").prop("disabled", true); 
		} else {
			$("#lunchTimeBox select").prop("disabled", false); 
		}  
	} 
	
	function selectStartHour(){
		var sel = Number($("select[id=start_hour]").val());
		
		$("select[id=end_hour]").children().remove();  
		$("select[id=end_hour]").append("<option value=''></option>"); 
		for(var i = sel+1; i<24 + 1; i++){ 
			$("select[id=end_hour]").append("<option value='"+i+"'>"+i+"</option>");
		} 
	}  
	
	function selectLunchStartHour(){
		var sel = Number($("select[id=lunch_start_hour]").val());
		
		$("select[id=lunch_end_hour]").children().remove();  
		$("select[id=lunch_end_hour]").append("<option value=''></option>"); 
		for(var i = sel+1; i<17; i++){ 
			$("select[id=lunch_end_hour]").append("<option value='"+i+"'>"+i+"</option>");
		}    
	} 
	
	function selectOrder1(){
		var sel = $("select[id=order1]").val();
		
		if(sel != ""){
			$("select[id=order2] option[value='"+ sel +"']").prop('disabled', true);  
			$("select[id=order2] option[value!='"+ sel +"']").prop('disabled', false);   
		} else {
			$("select[id=order2]").children('option').prop('disabled', false);   
		} 
	}    
	
	function selectKind(){
		var sel = $("input[name=kind]:checked").val();
		
		$("#work").val(""); 
		ptWorkList = []; 
		
		if(sel == 'os'){
			$("input[name=workOS]").prop("checked", false); 
			$("input[name=workOS]").prop("disabled", false);  
			$(".forOS").show(); 
			$(".forNS").hide();
		} else if(sel == 'ns'){
			$(".forOS").hide();
			$(".forNS").show();
			$("input[name=workNS]").prop("checked", true); 
			$("input[name=workNS]").prop("disabled", true);  
			ptWorkList.push("A"); 
		}  
	}  
	 
	function selectJob(){
		//var sel = $("#job option:selected").val();
		var sel = $("select[id=job]").val(); 
		
		$("input[name=kind]").prop("checked", false); 
		$("input[name=work]").prop("checked", false); 
		
		if(sel == "1"){   
			//$("#ptWork").show();
			$(".forPT").show(); 
			$("#otherWork").hide();
		} else { 
			//$("#ptWork").hide();
			$(".forPT").hide();
			$(".forOS").hide();
			$(".forNS").hide();
			$("#otherWork").show();
		} 
		 
		console.log(sel); 
		
	}
	
	function selectWork(){
		var obj = document.getElementsByName("workOS");
		var objNS = document.getElementsByName("workNS");
		var len = obj.length;	
		ptWorkList = [];
		
		if($("input[name=kind]:checked").val() == "ns"){
			ptWorkList.push("A");
		} else {
			for(var i = 0; i<len; i++){
				if(obj[i].checked == true){
					 
					/* if(obj[0].value == "0"){
						for(var k = 1; k<len; k++){
							obj[k].checked = false;
						} 
					}   */
					 
					ptWorkList.push(obj[i].value);
				}   
			}
		}	
		 
		console.log(ptWorkList); 
		//sconsole.log(locList);
	}
	
	function calDate(mon){
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMont() + 1;
		var yyyy = today.getFullYear();
		
		
	}
	
	function validationChk(){
		frm = document.regForm; 		
		
		//알바조건
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
		 
		//근무조건
		if(frm.start_hour.value == ""|| frm.start_min.value == ""|| frm.end_hour.value == "" || frm.end_min.value == ""){
			alert("근무시간을 입력해주세요.");  
			return;
		} else {
			if(!frm.job.value){
				alert("직종을 선택해주세요."); 
				frm.job.focus();
				return;
			} else {
				// PT
				if(frm.job.value == "PT"){
					if(!frm.kind.value){
						alert("OS 또는 NS 구분을 선택해주세요.");
						return;
					} else {
						if(ptWorkList.length == 0){ 
							alert("업무를 선택해주세요.");
							return;
						} else if(!frm.insentive.value){
							alert("인센티브 유무를 선택해주세요.");
							return;
						} else if((frm.lunch_start_hour.value == ""|| frm.lunch_start_min.value == ""|| frm.lunch_end_hour.value == "" || frm.lunch_end_min.value == "") && $("#lunchFlag:checked").val() != 1){
							alert("점심시간을 입력해주세요.");   
							return; 
						} else {
							if(!frm.peerCnt.value){
								alert("근무자 수를 입력해주세요.");
								return;
							} else if(!frm.avgCnt.value){
								alert("일 평균 환자수를 입력해주세요.");
								return;
							}
						}
					}
				//PT 외 다른 직종
				} else if(frm.job.value != "1"){
					if(!frm.work.value){
						alert("업무 내용을 작성해주세요.");
						return;
					} else if((frm.lunch_start_hour.value == ""|| frm.lunch_start_min.value == ""|| frm.lunch_end_hour.value == "" || frm.lunch_end_min.value == "") && $("#lunchFlag").val() != 1){
						alert("점심시간을 입력해주세요.");  
						return; 
					} else {
						if(!frm.peerCnt.value){
							alert("근무자 수를 입력해주세요.");
							return;
						} else if(!frm.avgCnt.value){
							alert("일 평균 환자수를 입력해주세요.");
							return;
						}
					}
				}	
			} 
		} 
		
		//채용 정보 validation
		if(frm.matchPhone.value == ""){
			alert("채용 연결 핸드폰을 입력해주세요.");
			frm.matchPhone.focus();
			return;
		}else if(hireFlag == ""){
			alert("채용 구분을 선택해주세요.");
			frm.hireFlag.focus();
			return;
		}
		
		if(hireFlag == "1" && frm.datepicker_work.value == ""){
			alert("매칭 완력 후 출근 날짜를 선택해주세요.");
			frm.datepicker_work.focus();
			return;
		} 
		if(hireFlag == "2" && frm.datepicker_contact.value == ""){
			alert("매칭 완력 후 면접 날짜를 선택해주세요.");
			frm.datepicker_work.focus();
			return;
		} 
		
		if(dowList.length == "1" && dowList[0] == "6" && frm.term.value == "part"){
			var d1= $("#datepicker").val();
			var d2 = $("#datepicker_start").val();
			
			$("select[name=term]").val("sat").prop("checked", true);  
			$("#datepicker").val(d1);
			$("#datepicker_start").val(d2);
		}  
		
		//if(frm.datepicker.value )
			//$('#datepicker').datepicker('setDate', 'today');
		register(frm);  
	}   
	
	function setTime(){
		var st_hour = $("#start_hour").val();
		var en_hour = $("#end_hour").val();
		time = ""; 	// 오전(1), 오후(2) , 하루(3) 
		
		if(st_hour < 12) {
			if(en_hour <= 13){
				val = "1";
			} else {
				val = "3";
			}
		} else {
			val = "2";
		}
		
		return val;
	}
	
	function register(frm) {
		var params = {};		
		
		var ptDetailList = [];
		
		var workStHour = $("#start_hour").val().length == "1"? "0"+$("#start_hour").val() : $("#start_hour").val();	
		var workStMin = $("#start_min").val().length == "1"? "0"+$("#start_min").val() : $("#start_min").val()
		var workEnHour = $("#end_hour").val().length == "1"? "0"+$("#end_hour").val() : $("#end_hour").val();
		var workEnMin = $("#end_min").val().length == "1"? "0"+$("#end_min").val() : $("#end_min").val();
		
		var workStTime = "";
		var workEnTIme = "";
		
		var lunchStHour = $("#lunch_start_hour").val().length == "1"? "0"+$("#lunch_start_hour").val() : $("#lunch_start_hour").val();	
		var lunchStMin = $("#lunch_start_min").val().length == "1"? "0"+$("#lunch_start_min").val() : $("#lunch_start_min").val();
		var lunchEnHour = $("#lunch_end_hour").val().length == "1"? "0"+$("#lunch_end_hour").val() : $("#lunch_end_hour").val();
		var lunchEnMin = $("#lunch_end_min").val().length == "1"? "0"+$("#lunch_end_min").val() : $("#lunch_end_min").val();
		
		var lunchStTime = "";
		var lunchEnTime = "";
		
		var calWorkTime = ((Number($("#end_hour").val()) * 60 + Number($("#end_min").val())) - (Number($("#start_hour").val()) * 60 + Number($("#start_min").val())))/60;
		var calSalaryHour = 0;
		var calSalaryDay = 0;
		
		if($("select[name=salType]").val() == "hour"){
			salaryDay = "";
			salaryHour = $("#salary_hour").val();
			calSalaryDay = Number($("#salary_hour").val()) * calWorkTime;
		} else if($("select[name=salType]").val() == "day"){
			salaryHour = "";
			salaryDay = $("#salary_day").val();
			calSalaryHour = Math.floor(Number($("#salary_day").val())/calWorkTime); 
		}
		
		if($("#term").val() == "sat"){
			console.log("sat!!!");
			dowList[0] = "6";
		}
		if($("#term").val() == "one"){
			console.log("one!!!");
			dowList = []; 
		} 
 		if($("#job").val() == "1" && $("#kindBox input:checked").val() == "os"){
			ptDetailList.push($("#micro").val());
			ptDetailList.push($("#eswt").val());
			ptDetailList.push($("#knee").val());
			ptDetailList.push($("#sh").val());
			ptDetailList.push($("#ion").val());
 		} 
 		
 		time = setTime();
 		
 		if(time == "3"){
 			calWorkTime = ((Number($("#end_hour").val()) * 60 + Number($("#end_min").val())) - (Number($("#start_hour").val()) * 60 + Number($("#start_min").val())))/60 - 1;
 		}
 		
 		
 		workStTime = workStHour + ":" + workStMin;
		workEnTime = workEnHour + ":" + workEnMin;
 		
 		lunchStTime = $("#lunchFlag:checked").val() == "1"? "" : (lunchStHour + ":" + lunchStMin);
 		lunchEnTime = $("#lunchFlag:checked").val() == "1"? "" : (lunchEnHour + ":" + lunchEnMin);
 		
 		if(lunchStTime != "" && lunchEnTime != ""){
 			calWorkTime = ((Number($("#end_hour").val()) * 60 + Number($("#end_min").val())) - (Number($("#start_hour").val()) * 60 + Number($("#start_min").val())))/60 - 1;
 		} else {
 			calWorkTime = ((Number($("#end_hour").val()) * 60 + Number($("#end_min").val())) - (Number($("#start_hour").val()) * 60 + Number($("#start_min").val())))/60;
 		}
 		
 		
 		
 		
		params = { 
				companyNo : companyNo
			  , workType : $("select[name=term]").val()				// 일일, 장/단기, 토요 고정
			  , salaryHour : salaryHour								// 시급
			  , salaryDay : salaryDay 								// 일급
			  , workDate : $("#datepicker").val()					// 근무 날짜(일일 알바)
			  , workStart : $("#datepicker_start").val()			// 근무 시작 날짜 (장단기, 토요 고정 알바)
			  //, dowList : dowList									// 근무 요일 리스트
			  , dowList : JSON.stringify(dowList)
			  , timeFlag : time					 					// 1: 오전 , 2: 오후, 3: 하루
			  , workStTime : workStTime 
			  , workEnTime : workEnTime
			  , job : $("#job").val()
			  , sex : $("#sex").val()
			  , age : $("#age").val()
			  , career : $("#career").val()
			  , workFlag : $("#kindBox input:checked").val()
			  , work : $("#work").val()								//PT 외 다른 직종 업무
			  //, workPtList : ptWorkList
			  //, detailWorkPtList : ptDetailList	
			  , workPtList : JSON.stringify(ptWorkList)				//PT 업무  (0 : 신경계, 1: 통증 치료, 2: 심플, 3: 10분 메뉴얼, 4: 도수치료 , 5: 운동 치료) 
			  , detailWorkPtList : JSON.stringify(ptDetailList)		//PT 세부 업무 YN(obj[0]: 초음파YN, obj[1]: eswtYN, obj[2]: CPM(knee)YN, obj[3]: CPM(sh)YN, obj[4]: ionYN)
			  , insenFlag : $("#insentiveBox input:checked").val()  // 인센티브 유무 (Y , N)
			  , detailWork : $("#detailWork").val()
			  , lunchStTime : lunchStTime							// 점심 시작 시간
			  , lunchEnTime : lunchEnTime							// 점심 종료 시간
			  , peerCnt : $("#peerCnt").val()
			  , avgCnt : $("#avgCnt").val()
			  , etc : $("#etc").val() 
			  , calWorkTime : calWorkTime
			  , calSalaryHour : calSalaryHour
			  , calSalaryDay : calSalaryDay
			  , matchPhone : frm.matchPhone.value
			  , hireFlag : hireFlag
			  , matchWorkDate : $("#datepicker_work").val()
			  , matchInterviewDate : $("#datepicker_contact").val()
			  , matchMsg : $("#matchMsg").val() 
		};   
		
		$.ajax({
    		url : CONTEXT_PATH + "/company/register/registerChk", 
    		type: "POST",
    		data: params,     
    		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    		success: function(data){
    			console.log("registerChk");
    			if(data == "success"){
    				location.href = CONTEXT_PATH + "/";  
    			} else if(data == "duplicate"){
    				alert("해당 직종에 대한 매칭 조건이 이미 등록되어있습니다.");
    			} 
    		},   
    		error: function(data){   
   		   		console.log("error");
   		   		console.log(data.errmsg);  
    		}
    	});  
	}
	 
	function setTerm() {
		var term = $("select[name=term]").val(); // 선택된 값
		console.log($("select[name=term]").val());   
		
		dowList = []; 
		$("#datepicker").val("");
		$("#datepicker_start").val("");
		 
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
		
		// $("#salaryBox").remove();
		
		if(salType == "hour"){
			$("#salaryBox").text("원");  
			$("#salary_hour").show(); 
			$("#salary_day").hide(); 
 			
		} else if(salType == "day"){
			$("#salaryBox").text("원");  
			$("#salary_hour").hide();  
			$("#salary_day").show();  
		} else { 
			$("#salaryBox").text("");  
		} 
	}    
	
	function setDatepicker() {
		
		console.log($("#datepicker").val()); 
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
					for(var k = 1; k<len; k++){
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
	
	function selectHireFlag(){
		$("datepicker_work").val("");
		$("datepicker_contact").val("");
		$("#matchMsg").val("");
		
		if($("#hireFlag").val() == "1"){
			hireFlag = "1";
			$(".forUncontact").show();
			$(".forContact").hide();
		} else if($("#hireFlag").val() == "2"){
			hireFlag = "2";
			$(".forUncontact").hide();
			$(".forContact").show(); 
		} else { 
			hireFlag = "";
			$(".forContact").hide();
			$(".forUncontact").hide();
		}
		
	}
</script>	
</body>
</html>