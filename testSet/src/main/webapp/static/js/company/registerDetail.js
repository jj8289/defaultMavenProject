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
	setInsenFlag();
	setIsPT(); 
	setLunch();
 	/*    
	 if(lunch == ''){ 
		 $("#lunchFlag").prop("checked", true);
		 clickNoLunch();  
	 }  
	 console.log("${reg}"); */
} 	

function setIsPT(){
	if($("select[id=job]").val() == "PT"){
		isPT = "Y";
		setPtFlag();  
		selectKind();
		setWorkPt();  
		setPtDetailWork(); 
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
		
		//$("#kindBox radio:checked").val("${reg.workFlag}"); 
		
	} else if(sel == 'ns'){
		$(".forOS").hide(); 
		$(".forNS").show();
		$("input[name=workNS]").prop("checked", true); 
		$("input[name=workNS]").prop("disabled", true);  
		ptWorkList.push("0"); 
	}   
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
	$("#micro").val(ptDetailList[0]).prop("checked", true); 
	$("#eswt").val(ptDetailList[1]).prop("checked", true); 
	$("#knee").val(ptDetailList[2]).prop("checked", true); 
	$("#sh").val(ptDetailList[3]).prop("checked", true); 
	$("#ion").val(ptDetailList[4]).prop("checked", true); 
}  

function setInsenFlag(){
	//$("input:radio[name='insentive']:radio[value='"+insenFlag+"']").prop("checked", true);
	$("#insentiveBox input").val($insenFlag).prop("checked", true);
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
				for(var k = 1; k<len-1; k++){
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

///////////////////////////////////////////////////////////
/* param 정리 */
function setParam(){ 
	//고정 값 : companyNo, regNo, dowList, ptWorkList, lunchFlag(점심시간 유무)
	var salaryHour = "${reg.salaryHour}";
	var salaryDay = "${reg.salaryDay}";
	var dowList = [];
	var ptWorkList = [];
	var lunchFlag = "";		// 1: 점심시간 없음 , "": 점심시간 있음
	frm = document.regForm; 	 
	 
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
	
	/////////// 
	var workStHour = frm.start_hour.value.length == "1"? "0"+frm.start_hour.value : frm.start_hour.value;
	var workStMin = frm.start_min.value.length == "1"? "0"+frm.start_min.value : frm.start_min.value;
	workEnHour = frm.end_hour.value.length == "1"? "0"+frm.end_hour.value : frm.end_hour.value; 
	 workEnMin = frm.end_min.value.length == "1"? "0"+frm.end_min.value : frm.end_min.value; 
	 lunchStHour = frm.lunch_start_hour.value.length == "1"? "0"+frm.lunch_start_hour.value : frm.lunch_start_hour.value; 
	 lunchStMin = frm.lunch_start_min.value.length == "1"? "0"+frm.lunch_start_min.value : frm.lunch_start_min.value; 
	 lunchEnHour = frm.lunch_end_hour.value.length == "1"? "0"+frm.lunch_end_hour.value : frm.lunch_end_hour.value; 
	 lunchEnMin = frm.lunch_end_min.value.length == "1"? "0"+frm.lunch_end_min.value : frm.lunch_end_min.value; 
	 workStTime = "";
	 workEnTIme = "";
	 lunchStTime = "";
	 lunchEnTime = "";
	 calWorkTime = ((Number(frm.end_hour.value) * 60 + Number(frm.end_min.value)) - (Number(frm.start_hour.value) * 60 + Number(frm.start_min.value)))/60;
	 calSalaryHour = 0; 
	 calSalaryDay = 0;
	
	 time = setTime(Number(workStHour), Number(workEnHour));   
	 console.log(workStHour + " / " + workStMin + "/" + workEnHour + "/" + workEnMin);
	 alert("setParam"); 
}  


function setTime(st, en){
	var val = "";
	time = "";
	
	if(st < 12) {
		if(en <= 13){
			val = "1";
		} else {
			val = "3";
		}
	} else {
		val = "2";
	}
	
//	var st_hour = Number($("#start_hour").val());
//	var en_hour =  Number($("#end_hour").val());
//	time = ""; 	// 오전(1), 오후(2) , 하루(3) 
//	 
//	if(st_hour < 12) {
//		if(en_hour <= 13){
//			val = "1";
//		} else {
//			val = "3";
//		}
//	} else {
//		val = "2";
//	}
//	
//	return val;
}