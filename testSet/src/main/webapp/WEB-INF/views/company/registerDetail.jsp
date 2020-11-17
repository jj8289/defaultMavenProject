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
	<script src="${pageContext.request.contextPath}/resources/js/company/registerDetail.js"></script>     
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
</style>    
</head>    
<body>   
	<div id="container">    
		<div class="temp"></div>
		<h2 class="title">조건 등록 상세</h2>    
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
							<select id="term" name="term" onchange="selectTerm()">
								<option value="">선택</option>      
								<c:if test="${reg.workType == 'one'}"><option value="one" selected>일일 알바</option></c:if>
								<c:if test="${reg.workType != 'one'}"><option value="one">일일 알바</option></c:if>
								<c:if test="${reg.workType == 'part'}"><option value="part" selected>장/단기 알바</option></c:if>
								<c:if test="${reg.workType != 'part'}"><option value="part">장/단기 알바</option></c:if>
								<c:if test="${reg.workType == 'sat'}"><option value="sat" selected>고정 토요 알바</option></c:if>
								<c:if test="${reg.workType != 'sat'}"><option value="sat">고정 토요 알바</option></c:if>
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
							<select id="salType" name="salType" onchange="selectSalaryType()">
								<c:if test="${reg.salaryHour != ''}"><option value="hour" selected>시급</option><option value="day">일급</option></c:if>
								<c:if test="${reg.salaryDay != ''}"><option value="hour">시급</option><option value="day" selected>일급</option></c:if>
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
								<c:forEach var="i" begin="0" end="23">
									<c:if test="${workStHour ==  i}"><option value="${i }" selected>${i>9?i:'0' }${i>9?'':i }</option></c:if>
									<c:if test="${workStHour !=  i}"><option value="${i }">${i>9?i:'0' }${i>9?'':i }</option></c:if>  
								</c:forEach>  
							</select>   
							<div style="padding: 5px;"> : </div>  
							<select id="start_min" name="start_min">  
								<option value=""></option> 
								<c:forEach var="i" begin="0" end="55" step="5">
									<c:if test="${workStMin ==  i}"><option value="${i }" selected>${i>9?i:'0' }${i>9?'':i }</option></c:if>  
									<c:if test="${workStMin !=  i}"><option value="${i }">${i>9?i:'0' }${i>9?'':i }</option></c:if>  
								</c:forEach>        
							</select> 
							<div style="padding: 5px;"> ~ </div>
							<select id="end_hour" name="end_hour">  
								<option value=""></option> 
								<c:forEach var="i" begin="0" end="23">
									<c:if test="${workEnHour ==  i}"><option value="${i }" selected>${i>9?i:'0' }${i>9?'':i }</option></c:if>  
									<c:if test="${workEnHour !=  i}"><option value="${i }">${i>9?i:'0' }${i>9?'':i }</option></c:if>  
								</c:forEach>        
							</select> 
							<div style="padding: 5px;"> : </div>       
							<select id="end_min" name="end_min"> 
								<option value=""></option>  
								<c:forEach var="i" begin="0" end="55" step="5">
									<c:if test="${workEnMin ==  i}"><option value="${i }" selected>${i>9?i:'0' }${i>9?'':i }</option></c:if>     
									<c:if test="${workEnMin !=  i}"><option value="${i }">${i>9?i:'0' }${i>9?'':i }</option></c:if>     
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
									<c:if test="${reg.job eq item.key }"><option id="${item.key }" value="${item.key }" selected>${item.value }</option></c:if>
									<c:if test="${reg.job ne item.key }"><option id="${item.key }" value="${item.key }" >${item.value }</option></c:if>
								</c:forEach>    
							</select>   
						</td>  
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">성별</td>
						<td id="sexBox"> 
							<select id="sex" name="sex">
								<c:choose>
									<c:when test="${reg.sex eq ''}">
										<option value="" selected>성별 무관</option>
										<option value="F" >여</option>
										<option value="M" >남</option>
									</c:when>
									<c:when test="${reg.sex eq 'F' }">
										<option value="" >성별 무관</option>
										<option value="F" selected>여</option>
										<option value="M" >남</option>
									</c:when>
									<c:otherwise>
										<option value="" >성별 무관</option>
										<option value="F" >여</option>
										<option value="M" selected>남</option>
									</c:otherwise>
								</c:choose>
							</select>    
						</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">나이</td>
						<td id="ageBox"> 
							<select id="age" name="age">
								
								<c:if test="${reg.age == ''}"><option value="" selected>나이 무관</option></c:if>
								<c:if test="${reg.age != ''}"><option value="">나이 무관</option></c:if>
								<c:forEach var="i" begin="20" end="40" step="10">
									<c:if test="${reg.age == i}"><option value="${i }" selected>${i }대</option></c:if>
									<c:if test="${reg.age != i}"><option value="${i }">${i }대</option></c:if>
								</c:forEach> 
								<c:if test="${reg.age == '50'}"><option value="50" selected>50대 이상</option></c:if> 
								<c:if test="${reg.age != '50'}"><option value="50">50대 이상</option></c:if> 
							</select>    
						</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">경력</td>
						<td id="careerBox"> 
							<select id="career" name="career">
								<c:if test="${reg.career == ''}"><option value="" selected>경력 무관</option></c:if> 
								<c:if test="${reg.career != ''}"><option value="">경력 무관</option></c:if> 
								<c:if test="${reg.career == '1'}"><option value="1" selected>1년차만</option></c:if> 
								<c:if test="${reg.career != '1'}"><option value="1">1년차만</option></c:if> 
								<c:forEach var="i" begin="2" end="10" step="1"> 
									<c:if test="${reg.career == i}"><option value="${i }" selected>${i }년차 이상</option> </c:if>
									<c:if test="${reg.career != i}"><option value="${i }">${i }년차 이상</option> </c:if>
								</c:forEach>    
							</select>   
						</td>  
					</tr>   
					<tr><td>근무 조건<td></tr>  
					<tr class="forPT"> 
						<td bgcolor="lightgrey" align="center">구분</td>
						<td id="kindBox" onchange="selectKind()"> 
							<c:if test="${reg.workFlag eq 'os'}">
								<label><input type="radio" name="kind" value="os" checked="checked"> OS</label>
								<label><input type="radio" name="kind" value="ns"> NS</label>
							</c:if>  
							<c:if test="${reg.workFlag eq 'ns'}">
								<label><input type="radio" name="kind" value="os"> OS</label>
								<label><input type="radio" name="kind" value="ns" checked="checked"> NS</label>
							</c:if> 
						</td>  
					</tr> 
					<tr> 
						<td bgcolor="lightgrey" align="center">업무</td>
						<td id="workBox" onchange="selectPtWork()">  
							<div id="osWork" class="forOS ptWork">
								<label><input type="checkbox" name="workOS" value="1"> 통증 치료</label>
								<label><input type="checkbox" name="workOS" value="2"> 심플</label>
								<label><input type="checkbox" name="workOS" value="3"> 10분 메뉴얼</label>
								<label><input type="checkbox" name="workOS" value="4"> 도수 치료(30분 이상)</label>
								<label><input type="checkbox" name="workOS" value="5"> 운동 치료</label>
							</div>
							<div id="nsWork" class="forNS ptWork">
								<label><input type="checkbox" name="workNS" value="0"> 신경계 치료</label>
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
									<c:if test="${lunchStHour ==  i}"><option value="${i }" selected>${i}</option></c:if>
									<c:if test="${lunchStHour !=  i}"><option value="${i }">${i}</option></c:if>
								</c:forEach>       
							</select>   
							<div style="padding: 5px;"> : </div>      
							<select id="lunch_start_min" name="lunch_start_min"> 
								<option value=""></option> 
								<c:forEach var="i" begin="0" end="55" step="5">
									<c:if test="${lunchStMin ==  i}"><option value="${i }" selected>${i<10?'0':i }${i<10?i:'' }</option>   </c:if>
									<c:if test="${lunchStMin !=  i}"><option value="${i }">${i}</option></c:if>
								</c:forEach>       
							</select>    
							<div style="padding: 5px;"> ~ </div>
							<select id="lunch_end_hour" name="lunch_end_hour">  
								<option value=""></option> 
								<c:forEach var="i" begin="11" end="15">
									<c:if test="${lunchEnHour ==  i}"><option value="${i }" selected>${i}</option></c:if>
									<c:if test="${lunchEnHour !=  i}"><option value="${i }">${i}</option></c:if>  
								</c:forEach>      
							</select> 
							<div style="padding: 5px;"> : </div>       
							<select id="lunch_end_min" name="lunch_end_min"> 
								<option value=""></option>  
								<c:forEach var="i" begin="0" end="55" step="5">
									<c:if test="${lunchEnMin ==  i}"><option value="${i }" selected>${i<10?'0':i }${i<10?i:'' }</option></c:if>
									<c:if test="${lunchEnMin !=  i}"><option value="${i }">${i}</option></c:if>   
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
				</table> 
				<p class="but" align="center" >
					<input type="button" value="홈으로" onclick="goHome()">
					<button id="back" value="뒤로가기" type="button" onclick="history.back()" class="btn">뒤로가기</button>  
					<button id="reg" value="수정" type="button" onclick="setParam()" class="btn">수정</button> 
				</p>    
			</form>     
		</div>  
	</div>  
<script type="text/javascript"> 
	var companyNo = "${reg.companyNo}";
	var regNo = "${reg.regNo}"; 
	var salaryHour = "${reg.salaryHour}";
	var salaryDay = "${reg.salaryDay}";
	var dowList = [];
	var ptWorkList = [];
	var time = "";
	var lunchFlag = "";
	var frm = "";
	
	var workDate = "${reg.workDate}"; 
	var workStart = "${reg.workStart}";
	var workType = "${reg.workType}";
	var salType = $("#salType option:selected").val();
	var job = $("#job option:selected").val();
	var ptFlag = "${reg.workFlag}";
	var lunch = "${lunchStHour}"; 
	var dows = "${reg.workDow}";
	var work = "${reg.work}";
	var worksPt = "${reg.workPt}";
	var detailWorkPt = "${reg.detailWorkPt}";
	var ptDetailList = [];
	var detailWork = "${reg.detailWork}";
	var $insenFlag = "${reg.insenFlag}"; 
	var $peerCnt = "${reg.peerCnt}"; 
	var $avgCnt = "${reg.avgCnt}";  
	var $etc = "${reg.etc}";   
	var isPT = "";
	
	console.log(detailWorkPt); 
	console.log(ptDetailList);
	console.log(isPT); 
// 	console.log(salType); 
 	console.log("${reg}"); 
	
	 function clickNoLunch(){
		lunchFlag = $("#lunchFlag:checked").val();
		
		if(lunchFlag == "1"){
			$("#lunchTimeBox select").val(""); 
			$("#lunchTimeBox select").prop("disabled", true); 
		} else {
			$("#lunchTimeBox select").prop("disabled", false); 
			lunchFlag = ""; 
		}  
	} 
	 /*
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
				} else if(frm.job.value != "PT"){
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
		
		if(dowList.length == "1" && dowList[0] == "6" && frm.term.value == "part"){
			var d1= $("#datepicker").val();
			var d2 = $("#datepicker_start").val();
			
			$("select[name=term]").val("sat").prop("checked", true);  
			$("#datepicker").val(d1);
			$("#datepicker_start").val(d2);
		}  
		
		if(frm.datepicker.value )
			$('#datepicker').datepicker('setDate', 'today');
		
		//register(frm); 
		setParam();  
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
 		if($("#job").val() == "PT" && $("#kindBox input:checked").val() == "os"){
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
	} */
	
</script>	
</body>
</html>