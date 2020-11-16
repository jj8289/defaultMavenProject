<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="../common/common.jsp" />    
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/page.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage.css" media="screen"/> 
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<title>마이페이지</title> 
<style type="text/css">
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

#listBody{
	text-align: center;
}	

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
 
.subtitle {
	width: 100%;
	margin: 0;
	font-size: 20px;
	height: 30px; 
	text-align: center; 
	margin-top: 10px;    
}    
 
.infocon {
	display: flex;
	justify-content: center; 
}
 
.regCon {
 	margin: 0 auto;
 	margin-top: 30px;    
} 
 
table { 
	margin: 0 auto;   
}  

form {
	margin: 20px;
}
 
.but {
	display: flex;
	align-items: center; 
	justify-content: center; 
	text-align: center;  
	/* margin: 35px; */
	height: 80px;
} 
.btn {
	border: none;
	background-color: #424242;
	color: white;
	width: 100px;
	height: 30px;
	margin: 0 5px; 
} 

#on_off_match {
	margin-left: 10px;
}  
  
#location {
	display: flex; 
} 
  
.noReg {
	text-align: center; 
	margin-top: 15px; 
}

#salary_hour, #salary_day{
	height: 24px; 
}   

.page-navi {
 	height: 70px;   
 	text-align: center;  
 	display: flex;
 	align-items: center; 
 	justify-content: center; 
}      
 
</style>         
</head>    
<body>   
	<div id="container">  
		<form name="frm">    
			<!-- //페이지 번호 -->
            <input type="hidden" name="pageNo" />
            <input type="hidden" name="regNo" />
			<div class="temp"></div>
			<h2 class="title">마이페이지</h2>   
			<div class="temp"></div>   
			<div class="infocon"><input type="button" value="내 정보 수정" onclick="location.href='${pageContext.request.contextPath}/user/myinfo'"></div>
			<div class="temp"></div>   
			<h3 class="subtitle">상태</h3>    
			<div>  
				<table> 
					<tr style="height: 50px">      
						<td>매칭 상태</td> 
						<td id="switch_td" style="text-align: center; width: 150px;">    
							<label class="switch">
							    <input type="checkbox" id="switchBtn" onclick="toggle(this)"> 
							    <span class="slider round"></span>
							</label>   
							<p id="on_off_match"></p> 
						</td>       
						<!-- <td><button id="save" value="저장" type="button" onclick="saveChk()" class="btn" style="width: 50px;">저장</button></td> -->
					</tr>      
				</table>     
			</div>
			<div style="height: 30px"></div>    
			<!-- <h3 class="subtitle">매칭 조건</h3>   -->
			<div class="regCon">
				<table id="listTable">
					<caption style="height: 50px;">매칭 조건 리스트  [ 총 개수 : ${pageVO.rowCount } ]</caption> 
					<colgroup>   
						<col style="width: 60px">
						<col style="width: 130px">    
						<col style="width: 130px">
						<col style="width: 130px">
						<col style="width: 160px">
						<col style="width: 200px">
						<col style="width: 130px"> 
						<col style="width: 130px"> 
						<col style="width: 130px">    
						<col style="width: 120px">   
					</colgroup>  
					<thead>            
						<tr>
							<th scope="col">No</th>
							<th scope="col">직종</th>
							<th scope="col">근무 기간</th>
							<th scope="col">시급/일급</th>
							<th scope="col">근무 날짜(시작일)</th>
							<th scope="col">근무 시간</th>
							<th scope="col">성별</th>
							<th scope="col">나이</th>
							<th scope="col">경력</th>
							<th scope="col">상세 및 수정</th>
						</tr>
					</thead>
					<tbody id="listBody"> 
						<c:if test="${not empty regList }">
						<c:forEach items="${regList }" var="reg">
							<tr style="height: 40px;">  
								<td><c:out value="${reg.rowNum }" /></td>
								<td> 
									<c:forEach items="${jobList }" var="job">
										<c:if test="${job.key == reg.job }">	
											<c:out value="${job.value }" />
										</c:if>
									</c:forEach>    
								</td> 
								<td> 
									<c:forEach items="${workList }" var="work">
										<c:if test="${work.key == reg.workType }">	
											<c:out value="${work.value }" />
										</c:if>
									</c:forEach>    
								</td> 
								<%-- 일급 입력 ==> 시급 계산해서 보여줌 / 시급 등록 ==> 일급 계산해서 보여줌 
								<td>
									<c:if test="${reg.calSalaryHour != '0' }"><c:out value="${reg.calSalaryHour }" />/hour</c:if>
									<c:if test="${reg.calSalaryDay != '0' }"><c:out value="${reg.calSalaryDay }" />/day</c:if>
								</td> --%>  
								<td> 
									<c:if test="${reg.salaryHour != '' }"><c:out value="${reg.salaryHour }" />/hour</c:if>
									<c:if test="${reg.salaryDay != '' }"><c:out value="${reg.salaryDay }" />/day</c:if>
								</td>  
								<td>
									<c:if test="${reg.workDate != '' }"><c:out value="${reg.workDate }" /></c:if>
									<c:if test="${reg.workStart != '' }"><c:out value="${reg.workStart }" /></c:if>
								</td> 
								<td>
									<c:out value="${reg.workStTime }" /> ~ <c:out value="${reg.workEnTime }" />
									(<c:out value="${reg.calWorkTime }" />h) 
								</td>  
								<td>
									<c:if test="${reg.sex == 'F' }">여자만</c:if>
									<c:if test="${reg.sex == 'M' }">남자만</c:if> 
									<c:if test="${reg.sex == '' }">성별 무관</c:if>
								</td> 
								<td>
									<c:if test="${reg.age != '' }"><c:out value="${reg.age }" />대</c:if>
									<c:if test="${reg.age == '' }">나이 무관</c:if>
								</td> 
								<td>
									<c:if test="${reg.career != '' }"><c:out value="${reg.career }" />년 이상</c:if>
									<c:if test="${reg.career == '' }">경력 무관</c:if>
								</td>  
								<td><input type="button" value="상세" onclick="gotoRegDetail(${reg.regNo})"></td> 
							</tr> 
						</c:forEach> 
						</c:if>
						<c:if test="${empty regList }">
							등록된 매칭 조건이 없습니다.
						</c:if>
					</tbody>
				</table>
			</div>  
			<div class="page-navi">
				<c:if test="${pageVO.pageNo != 0}"> 
					<c:if test="${pageVO.pageBlock > 1}">
						<a href="javascript:fn_movePage(1)">맨앞 </a>
					</c:if>
					<c:if test="${pageVO.prevBlockPage != 0}">
						<a href="javascript:fn_movePage(${pageVO.prevBlockPage})">이전</a>
					</c:if>	
					<span>
		            <c:forEach var="i" begin="${pageVO.pageBegin}" end="${pageVO.pageEnd}" step="1">
		                <c:choose>
		                    <c:when test="${i eq pageVO.pageNo}">
		                        <a href="javascript:fn_movePage(${i})">
		                            <font style="font-weight: bold;">${i}</font>
		                        </a>
		                    </c:when>
		                    <c:otherwise>
	                        	<a href="javascript:fn_movePage(${i})">${i}</a>
		                    </c:otherwise>
		                </c:choose> 
		            </c:forEach>
		        	</span>
		        	<c:if test="${pageVO.nextBlockPage != 0 }"> 
						<a href="javascript:fn_movePage(${pageVO.nextBlockPage})">다음</a>
					</c:if>	
					<c:if test="${pageVO.pageBlock < pageVO.pageBlockCount }">	
						<a href="javascript:fn_movePage(${pageVO.pageCount})">맨뒤</a>
					</c:if>
				</c:if>	 
			</div> 
			<p class="but" align="center" > 
				<input class="btn" type="button" value="홈으로" onclick="goHome()">
			</p> 
		</form>
	</div>        
<script type="text/javascript">
	var regNo = ${regList[0].regNo};
	var workList = "${workList}";
	var calWorkTime = ${regList[0].calWorkTime};
	var curPage = ${pageVO.pageNo};
	
	console.log(regNo);
	console.log(workList);        
	console.log(calWorkTime);      
	console.log("curPage : " + curPage);  
	//calWorkTime = "${regList[0].workStTime }"
	  
	//$('div.page-navi').empty().html($.pageUtil.paging("gotoPage", $pageNo, "10", cnt)); //paging 
	 
	$(window).on('popstate', function(event) {
		console.log(event.originalEvent.state); 
		if(event.originalEvent.state == null) {
			location.href = CONTEXT_PATH + "/company/mypage"
		} else { 
			loadHistoryBack(event.originalEvent.state);	 
		}
	}); 
	  
	function loadHistoryBack(paramVo){
		console.log("loadHistoryback : " + paramVo.pageNo); 
		getData({pageNo: paramVo.pageNo});  
	}  

	
	function gotoPage(pageNo) {
		 
		 history.pushState({pageNo: pageNo}, null, CONTEXT_PATH + "/company/mypage?pageNo=" + pageNo);  

		 getData({pageNo:pageNo});   
	} 
	
	//페이지 이동
	function fn_movePage(val){
		$("input[name=pageNo]").val(val);
	    $("form[name=frm]").attr("method", "get");
	    $("form[name=frm]").attr("action", CONTEXT_PATH + "/company/mypage").submit(); 
	}  
	
	function gotoRegDetail(regNo){
		console.log(regNo); 
		
	/* 	$("input[name=pageNo]").val(curPage);*/
		$("input[name=regNo]").val(regNo);   
	    $("form[name=frm]").attr("method", "get");
	    $("form[name=frm]").attr("action", CONTEXT_PATH + "/company/mypage/regDetail").submit();  
	}

	/* var salaryHour = "${vo.salaryHour }";
	var salaryDay = "${vo.salaryDay }";
	var dowList = ${dowList};
	var locList = ${locList}; 
	var locLen = locList.length;  
	var frm = document.regForm;     
	var reg = "${vo}";    
	var matchStat = "${user.matchStatus}"; 
	
	console.log(salaryHour + " | " + salaryDay); 
	
	$(document).ready(function () {    
		$("#for_one").hide();
		$("#for_date").hide();
		$("#for_dow").hide();
		
		//$("#salaryDayBox").show();
		
		
		if(salaryHour != ""){
			$("#salaryHourBox").show();
			$("#salaryDayBox").hide();
			$("#hour").prop("selected", true);
		} else if(salaryDay != ""){
			$("#salaryDayBox").show();
			$("#salaryHourBox").hide();
			$("#day").prop("selected", true);
		}  
		
		for(var i = 0; i<locLen; i++){ 
			document.getElementById("loc"+locList[i]).checked = true; 
		}  
		   
		if(dowList[0] != '""'){
			for(var i = 0; i<dowList.length; i++){ 
				document.getElementById("dow"+dowList[i]).checked = true; 
			}   
		}   
		
		if(matchStat == 'N'){
			document.getElementById("switchBtn").checked = false; 
			$("#on_off_match").append("OFF");
			
		} else {
			document.getElementById("switchBtn").checked = true;
			$("#on_off_match").append("ON");  
		} 
		
		init(); 
	});    
	
	function init(){
		var term = $("#term").val(); 
		
		if(term == "one"){ 
			$("#for_one").show(); 
			$("#for_date").hide();  
			$("#for_dow").hide();
			document.getElementById("datepicker").value = "${vo.searchDate}";   
		}else if(term == "part" || term == "sat") {
			$("#for_one").hide();
			$("#for_date").show(); 
			$("#for_dow").show();
			document.getElementById("datepicker_start").value = "${vo.searchStart}".substr(0, 10);   
			
			if(term == "sat"){
				$("input[name=dow]").prop("disabled", true);   
			} 
		}   
	}    
	  
	function setTerm(){
		var term = $("#term").val(); 
		
		$("input[name=dow]").prop("disabled", false); 
		$("input[name=dow]").prop("checked", false);
		document.getElementById("datepicker").value =""; 
		document.getElementById("datepicker_start").value = ""; 
		
		if(term == "one"){ 
			$("#for_one").show(); 
			$("#for_date").hide();  
			$("#for_dow").hide();
		}else {
			$("#for_one").hide();
			$("#for_date").show(); 
			$("#for_dow").show();
			
			if(term == "sat"){
				$("input[id=dow6]").prop("checked", true);  
				$("input[name=dow]").prop("disabled", true);     
			}       
		}            
	} 
      
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
		console.log("!!");
		console.log(frm.time.value);
		console.log(frm.salType.value); 
		
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
					//if(dowList.length == 0){
					if(!frm.time.value){
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
		     
		//console.log(params);
		   
		$.ajax({
    		url : CONTEXT_PATH + "/user/require/requireChk", 
    		type: "POST",
    		data: JSON.stringify(params),     
    		dataType: 'json',   
    		contentType:"application/json;charset=UTF-8",
    		success: function(data){
    			alert("변경 완료!"); 
    			location.href = CONTEXT_PATH + "/";  
    		}, 
    		error: function(data){   
   		   		console.log("error");
   		   		//console.log(data.errmsg);  
   		   		//console.log(data.param); 
    		} 
    	}); 
		  
	} 
	
	function setSalaryType() {
		var salType = $("select[name=salType]").val(); // 선택된 값
		console.log($("select[name=salType]").val());   
		if(salType == "hour"){  
			$("#salaryBox").text("원 이상");
			$("#salaryHourBox").show();
			$("#salaryDayBox").hide();
		} else if(salType == "day"){
			$("#salaryBox").text("원 이상");
			$("#salaryHourBox").hide();
			$("#salaryDayBox").show();
		} else { 
			$("#salaryBox").text("");
			$("#salaryHourBox").hide();
			$("#salaryDayBox").hide();
		}    
	}   
	
	function setDatepicker() { 
		
		//console.log($("#datepicker_start").val()); 
	} 
	
	 
	function selectDow(){ 
		var obj = document.getElementsByName("dow");
		var len = obj.length;
		 
		dowList = []; 
		
		for(var i = 0; i<len; i++){
			if(obj[i].checked == true){
				
				if(obj[i].value == "0"){
					for(var k = 1; k<len-1; k++){
						obj[k].checked = false;
					}
				}
				  
				dowList.push(obj[i].value);
			}   
		}  
		 
		//console.log(dowList); 
		
	} 
	
	function selectLoc(){
		var obj = document.getElementsByName("loc");
		var len = obj.length;	
		locList = [];
		
		for(var i = 0; i<len; i++){
			if(obj[i].checked == true){
				 
				if(obj[i].value == "0"){
					for(var k = 1; k<len; k++){
						obj[k].checked = false;
					}
				}  
				
				locList.push(obj[i].value);
			}   
		}
		//sconsole.log(locList);
	}
	
	// matchStatus on/off 스위치 버튼 click 이벤트
	function toggle(item) {
		if(item.checked == true){
			matchStat = 'Y';
			$("#on_off_match").empty();
			$("#on_off_match").append("ON");
		} else {
			matchStat = 'N';
			$("#on_off_match").empty();
			$("#on_off_match").append("OFF");
		} 
	} 
	
	function saveChk(){
		var result = confirm("저장하시겠습니까?");		
		
		if(result){
			save();
		} else{
			alert("취소되었습니다.");
		}
	}
	
	function save(){
		$.ajax({
    		url : CONTEXT_PATH + "/require/requireChk", 
    		type: "POST",
    		data: JSON.stringify(params),     
    		dataType: 'json',   
    		contentType:"application/json;charset=UTF-8",
    		success: function(data){
    			console.log("requireChk");  
    			alert("저장 완료");
    			console.log(data.list); 
    			//location.href = CONTEXT_PATH + "/";  
    		}, 
    		error: function(data){  
   		   		console.log("error");
   		   		alert("오류"); 
   		   		console.log(data.errmsg);  
   		   		console.log(data.param); 
    		}
    	}); 
	} */
</script>	
</body>
</html>