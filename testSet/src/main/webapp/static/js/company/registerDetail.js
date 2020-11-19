"use strict";

$(document).ready(function(){
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
	
	initSet();  
	
	$("#peerCnt").val($peerCnt);  
	$("#avgCnt").val($avgCnt); 
	$("#etc").val($etc);
}); 


/* init */
function initSet(){
	setTerm(); 
	setDow(); 
	setSalaryType();
	setIsPT(); 
	setLunch();
} 	

function setIsPT(){
	if($("select[id=job]").val() == "PT"){
		isPT = "Y";
		setPtFlag();  
		selectKind();
		setWorkPt();  
		setJobPt();
	} else if($("select[id=job]").val() != "PT") {
		isPT = "N";
		setWork(); 
		setJobOthers(); 
	} 
	$("#detailWork").val(detailWork);  
}

function setTerm() {
	var term = $("select[name=term]").val(); // 선택된 값
	
	dowList = []; 
	
	$("#datepicker").val("");
	$("#datepicker_start").val("");
	 
	if(term == "one"){
		console.log("one!!!");   
		$("#for_one").show();
		$("#for_date").hide();
		$("#for_dow").hide(); 
		$("#datepicker").val(workDate);   
	} else if(term == "part"){
		$("#for_one").hide();
		$("#for_date").show();
		$("#for_dow").show();
		$("#datepicker_start").val(workStart);
	} else if(term == "sat"){ 
		$("#for_one").hide();
		$("#for_date").show();
		$("#for_dow").hide();
		$("#datepicker_start").val(workStart);
	} else { 
		$("#for_one").hide();
		$("#for_date").hide();
		$("#for_dow").hide(); 
	}   
}

function setDow(){
	 $("#dayofweekend").prop("checked", false);
	 dowList = dows.split("/");
	 console.log(dowList);
	 
	 for(var dow in dowList){
		 $("#dayofweekend input[value='"+dowList[dow]+"']").prop("checked", true); 
	 }
}

function setSalaryType() {
	salType = $("#salType option:selected").val();
	
	$("#salary_hour").val(""); 
	$("#salary_day").val(""); 
	
	if(salType == "hour"){
		$("#salaryBox").text("원");
		$("#salary_hour").val(salaryHour); 
		$("#salary_hour").show(); 
		$("#salary_day").hide();
	} else if(salType == "day"){
		$("#salaryBox").text("원");  
		$("#salary_hour").hide();  
		$("#salary_day").val(salaryDay); 
		$("#salary_day").show();   
	} else {  
		$("#salaryBox").text("");  
	}
	
	$("#salaryBox").show();
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
		ptFlag = "os";
		
		//$("#kindBox radio:checked").val("${reg.workFlag}"); 
		
	} else if(sel == 'ns'){
		$(".forOS").hide(); 
		$(".forNS").show();
		$("input[name=workNS]").prop("checked", true); 
		$("input[name=workNS]").prop("disabled", true);  
		ptWorkList.push("0");
		ptDetailList = [];
		ptFlag = "ns";
	}   
	setPtDetailWork(); 
	selectPtDetailWork();  
} 

function setJobOthers(){
	$("#kindBox").hide(); 
	$(".forPT").hide();
	$(".forOS").hide();  
	$(".forNS").hide();
	$("#otherWork").show(); 
}

function setJobPt(){
	$("#kindBox").show(); 
	$(".forPT").show();  
	$("#otherWork").hide();
}

function setPtFlag(){
	if(ptFlag == 'os'){
		$("input:radio[name='kind']:radio[value='os']").prop("chcked", true);
		if(ptDetailList[0] == ""){ 
			$("#micro").val("N").prop("checked", true); 
			$("#eswt").val("N").prop("checked", true); 
			$("#knee").val("N").prop("checked", true); 
			$("#sh").val("N").prop("checked", true); 
			$("#ion").val("N").prop("checked", true); 
		}  
	}else if(ptFlag == 'ns'){
		$("input:radio[name='kind']:radio[value='ns']").prop("chcked", true);
	}  
}

function setWorkPt(){
	 $("#workBox").prop("checked", false);
	 $("#otherWork input").val("");
	 
	 ptWorkList = worksPt.split("/");
	 console.log(ptWorkList);
	 
	 for(var work in ptWorkList){
		 $("#workBox input[value='"+ptWorkList[work]+"']").prop("checked", true); 
	 } 
}

function setPtDetailWork(){ 
	$("#selectPT").prop("checked", false); 
	ptDetailList = detailWorkPt.split("/");
	
	if(ptFlag == "os" && ptDetailList[0] == ""){ 
		$("#micro").val("N").prop("checked", true); 
		$("#eswt").val("N").prop("checked", true); 
		$("#knee").val("N").prop("checked", true); 
		$("#sh").val("N").prop("checked", true); 
		$("#ion").val("N").prop("checked", true); 
	} else {
		$("#micro").val(ptDetailList[0]).prop("checked", true); 
		$("#eswt").val(ptDetailList[1]).prop("checked", true); 
		$("#knee").val(ptDetailList[2]).prop("checked", true); 
		$("#sh").val(ptDetailList[3]).prop("checked", true); 
		$("#ion").val(ptDetailList[4]).prop("checked", true); 
	}
}    

function setWork(){
	$("#otherWork input").val(work);
}

function setLunch(){
	if(lunch == ''){ 
		 $("#lunchFlag").prop("checked", true);
		 clickNoLunch();  
	 }  
}

function setTime(st, en){
	if(st < 12) {
		if(en <= 14){
			time = "1";
		} else {
			time = "3";
		}
	} else {
		time = "2";
	} 
}  

/////////////////////////////////////////////////////////////////////////////
/* 클릭 이벤트 */
function selectPtWork(){
	var obj = document.getElementsByName("workOS");
	var objNS = document.getElementsByName("workNS");
	var len = obj.length;	
	ptWorkList = [];
	 
	if($("input[name=kind]:checked").val() == "ns"){
		ptWorkList.push("0");
	} else { 
		for(var i = 0; i<len; i++){
			if(obj[i].checked == true){
				ptWorkList.push(obj[i].value);
			}   
		}
	}
	    
	console.log(ptWorkList);  
}

function selectTerm(){
	var term = $("select[name=term]").val(); // 선택된 값
	workType = term;
	dowList = []; 
	$("#datepicker").val("");
	$("#datepicker_start").val("");
	
	if(term == "one"){
		$("#for_one").show();
		$("#for_date").hide();
		$("#for_dow").hide(); 
		$("#datepicker").val(workDate);   
	} else if(term == "part"){
		$("#for_one").hide();
		$("#for_date").show();
		$("#for_dow").show();
		$("#datepicker_start").val(workStart);
		selectDow();
	} else if(term == "sat"){ 
		$("#for_one").hide();
		$("#for_date").show();
		$("#for_dow").hide();
		$("#datepicker_start").val(workStart);
		dowList.push("6");   
	} else { 
		$("#for_one").hide();
		$("#for_date").hide();
		$("#for_dow").hide(); 
	}
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

function setDatepicker() {
	workDate = $("#datepicker").val();
	workStart = $("#datepicker_start").val();
}  

function selectSalaryType(){
	setSalaryType();
	
	if(salType == 'hour'){
		salaryDay = "";
	} else {
		salaryHour = ""; 
	}
} 

function selectJob(){
	 ptWorkList = [];
	 ptDetailList = [];
	 insenFlag = ""; 
	 work = ""; 
	  
	 job = $("select[name=job]").val(); 
	
	 if($("select[name=job]").val() == 'PT'){
		isPT = "Y";
		setPtFlag();  
		selectKind(); 
		setWorkPt();  
		setJobPt();
	 } else { 
		isPT = "N";
		setWork(); 
		setJobOthers(); 
	 }
}

function selectInsen(){
	insenFlag = $("#insentiveBox input:checked").val();
}
  
function selectPtDetailWork(){
	ptDetailList = [];
	
	var val = job == "PT" ? $("#kindBox input:checked").val() : "";
	
	if(val == "os"){
		ptDetailList.push($("#micro").val());
		ptDetailList.push($("#eswt").val());
		ptDetailList.push($("#knee").val());
		ptDetailList.push($("#sh").val());
		ptDetailList.push($("#ion").val());
	} else {
		ptDetailList = [];
	} 
} 

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

///////////////////////////////////////////////////////////
/* param 정리 */
function setParam(){ 
	frm = document.regForm; 	
	
	workStHour = frm.start_hour.value.length == "1"? "0"+frm.start_hour.value : frm.start_hour.value;
	workStMin = frm.start_min.value.length == "1"? "0"+frm.start_min.value : frm.start_min.value;
	workEnHour = frm.end_hour.value.length == "1"? "0"+frm.end_hour.value : frm.end_hour.value; 
	workEnMin = frm.end_min.value.length == "1"? "0"+frm.end_min.value : frm.end_min.value; 
	lunchStHour = frm.lunch_start_hour.value.length == "1"? "0"+frm.lunch_start_hour.value : frm.lunch_start_hour.value; 
	lunchStMin = frm.lunch_start_min.value.length == "1"? "0"+frm.lunch_start_min.value : frm.lunch_start_min.value; 
	lunchEnHour = frm.lunch_end_hour.value.length == "1"? "0"+frm.lunch_end_hour.value : frm.lunch_end_hour.value; 
	lunchEnMin = frm.lunch_end_min.value.length == "1"? "0"+frm.lunch_end_min.value : frm.lunch_end_min.value; 
	setTime(Number(workStHour), Number(workEnHour));    
	calWorkTime = ((Number(frm.end_hour.value) * 60 + Number(frm.end_min.value)) - (Number(frm.start_hour.value) * 60 + Number(frm.start_min.value)))/60;

	if(lunchFlag == "1"){
		calWorkTime = ((Number($("#end_hour").val()) * 60 + Number($("#end_min").val())) - (Number($("#start_hour").val()) * 60 + Number($("#start_min").val())))/60;
	} else {
		calWorkTime = ((Number($("#end_hour").val()) * 60 + Number($("#end_min").val())) - (Number($("#start_hour").val()) * 60 + Number($("#start_min").val())))/60 - 1;
	}   
	
	//장단기 알바, 토요일만 체크시 자동으로 토요 고정  타입으로 변경
	if(dowList.length == "1" && dowList[0] == "6" && frm.term.value == "part"){ 
		workType = "sat";
		dowList = [];
		dowList.push("6"); 
		$("#term").val("sat").prop("checked", true);
		$("#for_dow").hide();  
	}      
	
	param = {
		  companyNo : companyNo	
		, regNo : regNo  
	    , workType : workType	
	    , salaryHour : frm.salary_hour.value			// 시급
		, salaryDay : frm.salary_day.value 				// 일급
		, workDate : workDate							// 근무 날짜(일일 알바)
		, workStart : workStart							// 근무 시작 날짜 (장단기, 토요 고정 알바)
		, dowList : JSON.stringify(dowList)
		, timeFlag : time		
		, workStTime : workStHour == "" || workStMin == "" ? "" : workStHour + ":" + workStMin 
		, workEnTime : workEnHour == "" || workEnMin == "" ? "" : workEnHour + ":" + workEnMin 
		, job : job
		, sex : $("#sex").val() 
		, age : $("#age").val()
		, career : $("#career").val()
		, workFlag : job == "PT" ? $("#kindBox input:checked").val() : ""
		, work : $("#work").val()
		, workPtList : JSON.stringify(ptWorkList)	
		, detailWorkPtList : JSON.stringify(ptDetailList)		//PT 세부 업무 YN(obj[0]: 초음파YN, obj[1]: eswtYN, obj[2]: CPM(knee)YN, obj[3]: CPM(sh)YN, obj[4]: ionYN)
		, insenFlag : insenFlag  // 인센티브 유무 (Y , N)
		, detailWork : $("#detailWork").val()
		, lunchStTime : lunchFlag == "1" || lunchStHour == "" || lunchStMin == "" ? "" : lunchStHour + ":" + lunchStMin							// 점심 시작 시간
		, lunchEnTime : lunchFlag == "1" || lunchEnHour == "" || lunchEnMin == "" ? "" : lunchEnHour + ":" + lunchEnMin	
		, peerCnt : $("#peerCnt").val() 
		, avgCnt : $("#avgCnt").val()
		, etc : $("#etc").val() 
		, calWorkTime : calWorkTime + "" 
		, calSalaryHour : salType == "day" ? Math.floor(Number(frm.salary_day.value)/calWorkTime) : 0
		, calSalaryDay : salType == "hour" ? Number(frm.salary_hour.value) * calWorkTime : 0
	};
	 
	vaildationChk(param);
}   

function vaildationChk(param){
	console.log("validationChk()"); 
	console.log(param.companyNo);  
	
	if(param.workType == ""){
		console.log("11111"); 
		alert("근무기간을 선택해주세요.");
		frm.term.focus();
		return; 
	} else if(param.workType == "one" && param.workDate == ""){
		console.log("22222"); 
		alert("근무 날짜를 선택해주세요.");
		frm.datepicker.focus();
		return; 
	} else if(param.workType == "sat" && param.workStart == ""){
		alert("근무 시작 날짜를 선택해주세요.");
		frm.datepicker_start.focus();
		return;  
	} else if(param.workType == "part" && param.workStart == ""){
		alert("근무 시작 날짜를 선택해주세요.");
		frm.datepicker_start.focus();
		return;  
	} else if(param.workType == "part" && dowList == ""){
		alert("요일를 선택해주세요."); 
		return;    
	}  else if(salType == "hour" && param.salaryHour == ""){
		alert("시급을 입력해주세요."); 
        frm.salary_hour.focus();
        return;  
	} else if(salType == "day" && param.salaryDay == ""){
		alert("일급을 입력해주세요.");
        frm.salary_day.focus();
        return;   
	} else if(param.workStTime == "" || param.workEnTime == ""){
		alert("근무 시간을 선택해주세요.");
		frm.start_hour.focus();
		return;
	} else if(param.job == ""){
		alert("직종을 선택해주세요.");
		frm.job.focus();
		return;
	}  
	console.log("33333"); 
	if(param.job == "PT"){
		if(param.workFlag == undefined){
			alert("구분을 선택해주세요.");
			return;
		} else if(workPtList == ""){
			alert("업무를 선택해주세요.");
			return; 
		} else if(param.insenFlag == ""){
			alert("인센티브 유무를 선택해주세요.");
			return;
		}   
	} else { 
		if(param.work == ""){
			alert("업무를 입력해주세요.");
			frm.work.focus(); 
			return;
		}
	}
	console.log("44444"); 
	
	if(lunchFlag != "1"){
		if(param.lunchStTime == "" || param.lunchEnTime == ""){
			alert("점심시간을 선택해주세요.");
			frm.lunch_start_hour.focus(); 
			return;
		} 
	} else if(param.peerCnt == ""){
		alert("근무자 수를 입력해주세요.");
		frm.peerCnt.focus(); 
		return;
	} else if(param.avgCnt == ""){
		alert("일 평균 환자수를 입력해주세요.");
		frm.avgCnt.focus(); 
		return;
	}
	console.log("@"); 
	var conf = confirm("수정하시겠습니까?");
	if(conf == true){
		updateReg(param); 
	} else {
		alert("취소되었습니다.");
		return;
	}
} 

function updateReg(param){
	$.ajax({
		url : CONTEXT_PATH + "/company/mypage/regDetail/updateReg", 
		type: "POST",
		data: param,     
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success: function(data){
			console.log("updateReg()");
			if(data == "success"){
				location.href = CONTEXT_PATH + "/";  
			}  
		},   
		error: function(data){   
		   		console.log("error");
		   		console.log(data.errmsg);  
		}
	});   
}