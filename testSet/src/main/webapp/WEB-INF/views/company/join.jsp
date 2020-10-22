<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head> 
	<jsp:include page="../common/common.jsp" />    
	<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
	<meta charset="UTF-8">
	<title>회원가입</title> 
<style type="text/css">
	body { 
		margin: 0; 
		padding: 0;
	}
	 
	#container {
		
	}
	
	.temp {
		height: 50px;
	}
	
	.minicon {
		width: 725px;
		margin: 0 auto; 
	}   
	
	.title { 
		width: 100%; 
		margin: 0;
		height: 45px;
		font-size: 30px;
		text-align: center;
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
	
	.but input {
		border: none;
		background-color: #424242;
		color: white;
		width: 100px;
		height: 30px;
	}
	
	button {
		border: none;
		background-color: #424242;
		color: white;
		width: 100px;
		height: 30px;
	}  
	 
	table {
		width: 800px;
		height: 180px
	}
	
	label {
		/* background-color: lightgrey; */ 
	}    
	
	.sigungu {
		display: flex;
		align-content: space-around;
		align-items: center;
	}   
	
	.item {
		margin: 3px; 
	}    
	
	.btnSearch { 
		border: none;
		background-color: gray; 
		color: white; 
		width: 50px; 
		height: 30px;  
	}  
	
	#selectList{
		display: flex;
	}   
	
</style> 
</head> 
<body> 
	<div id="container">
		<div class="temp"></div>
		<h2 class="title">회원가입</h2>  
		<div class="temp"></div>
		<div class="minicon"> 
			<form id="joinForm" name="joinForm">
			<!-- 	https://data.gg.go.kr/portal/data/service/selectServicePage.do?page=1&rows=10&sortColumn=&sortDirection=&infId=6T98794V0223GQQ9O1P42484027&infSeq=3
				병원 api (시 이름으로 가능)
				https://data.gg.go.kr/portal/data/service/selectServicePage.do?page=1&rows=10&sortColumn=&sortDirection=&infId=9091L96FYGLU9J9I8UC52153092&infSeq=3&order=&loc=&BIZPLC_NM=&BSN_STATE_NM=&REFINE_ROADNM_ADDR=
				의원 api (시 이름으로 가능)
				json으로 다운받으면 ==> 데이터 에시)
				{"SIGUN_NM":"김포시","BIZPLC_NM":"미소가인피부과의원","LICENSG_DE":"20090401","BSN_STATE_NM":"영업중","CLSBIZ_DE":"","SICKBD_CNT":"0","MEDINST_SPCS_NM":"","MEDSTAF_CNT":"3","HOSPTLRM_CNT":"0","TREAT_SBJECT_CONT":"114","TOT_AR":"226.63","REFINE_ROADNM_ADDR":"경기도 김포시 사우중로 51, 메가라인 3층 303,304호 (사우동)","REFINE_LOTNO_ADDR":"경기도 김포시 사우동 932번지 메가라인","REFINE_ZIPNO":"10108","REFINE_WGS84_LAT":"37.6196617594","REFINE_WGS84_LOGT":"126.7188262506"}
				
				api 이용 시에는 
				req : SIGUN_CD(시군코드) 또는 SIGUN_NM(시군명)
				response : SIGUN_CD(시군코드), SIGUN_NM(시군명), BIZPLC_NM(사업장명), BSN_STATE_NM(영업중인지), REFINE_LOTNO_ADDR(주소), WGS84위도, WGS84경도, TOT_PSN_CNT(총인원수), TREAT_SBJECT_CONT(진료과목내용) 등등 가져올 수 있음. --> 
				<table cellspacing="3"> 
				<colgroup> 
   					<col width="20%"/>  
    				<col width=""/>    
 				</colgroup>   
					<tr>  
						<td bgcolor="lightgrey" align="center">관리자 아이디</td>	
						<td><input size="15" type="text" name="managerId" id="managerId"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr> 
					<tr>  
						<td bgcolor="lightgrey" align="center">관리자 비밀번호</td>  
						<td><input size="15" type="password" name="managerPw"  id="managerPw"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>  
					<tr> 
						<td bgcolor="lightgrey" align="center">관리자 이름</td> 
						<td><input type="text" name="managerNm" id="managerNm"></td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">관리자 핸드폰</td>
						<td><input type="text" name="phone" id="phone"> ex) 01012345678</td>
					</tr> 
					<tr> 
						<td bgcolor="lightgrey" align="center">주소</td>   
						<td class="sigungu">
							<!-- <input size="70" type="text" name="sigungu" id="sigungu"> -->
							<label class="item">시도</label>  
							<select id="sido" class="item"  style="width: 100px;" onchange="getSigunguList()">  
								<option value="">선택</option>  
								<%-- <c:set var="i" value="0" />
									<c:forEach items="${sdList }" var="sd"> 
										<option value="${i }">${sdList[i].sdNm }</option>   
										<c:set var="i" value="${i + 1 }" /> 
									</c:forEach>  --%>
								<option value="${dto.sdNm }">${dto.sdNm }</option>  
							</select>  
							<label class="item">시군구</label>  
							<!-- <select id="sigun" class="item"  style="width: 125px;" onchange="getDongList()"> -->    
							<select id="sigun" class="item"  style="width: 125px;" onchange="changeSigungu()">    
								<option value="">선택</option> 
								<%-- <option value="${dto.sgNm }">${dto.sgNm }</option>   --%>
							</select>    
							<div id="dongCon" style="display: flex; justify-content: middle;"> 
								<label class="item">동읍면</label>   
								<select id="dong" name="dong" class="item" style="width: 95px;"></select>  
							</div>   
							<div class="item"><button id="search" value="찾기" type="button" onclick="getBigHospitalList()" class="btnSearch">찾기</button></div>
						</td>    
					</tr> 
					<tr> 
						<td bgcolor="lightgrey" align="center">병원/의원 선택</td>
						<td onchange="whatkind()"> 
							<input type="radio" name="kind" id="kind1" value="1" > 병원
							<input type="radio" name="kind" id="kind2" value="2" > 의원 
						</td>  
					</tr>  
					<tr> 
						<td bgcolor="lightgrey" align="center">병원 선택</td>
						<td id="selectList">
							<!-- <div class="item"><button id="searchHospial" value="찾기" type="button" onclick="getBigHospitalList()" class="btnSearch">찾기</button></div> -->
							<div id="bigList" class="item" >
								<select id="bigListSelect" onchange="changeBigList()" onmousedown="getBigHospitalList()">
									<option value="">선택</option>
									<option value="no">목록에 없음</option>
								</select>   
							</div>
							<div id="smallList" class="item">
								<select id="smallListSelect" onchange="changeSmallList()" onmousedown="getSmallHospitalList()">
									<option value="">선택</option>
									<option value="no">목록에 없음</option>
								</select> 
							</div>
							<div class="item"><input type="text" name="inputHospital" id="inputHospital"></div>
						</td> 
					</tr>  
					<tr>
						<td bgcolor="lightgrey" align="center">병원 주소</td> 
						<td><input size="70" type="text" name="addr" id="addr"></td>
					</tr>
					<tr id="telTd">
						<td bgcolor="lightgrey" align="center">병원 전화번호</td> 
						<td><input size="70" type="text" name="tel" id="tel"></td> 
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">관리자 이메일</td>
						<td><input size="70" type="text" name="email" id="email"></td>
					</tr> 
					<tr>
						<td bgcolor="lightgrey" align="center">병원 간단 소개</td>
						<td><input size="70" type="text" name="intro" id="intro"></td>
					</tr>
				</table>

				<p class="but" align="center" >
					<button id="join" value="가입하기" type="button" onclick="joinChk()" class="btn">가입하기</button> 
					<input type="reset" value="리셋"> 
					<input type="button" value="홈으로" onclick="goHome()">
					<input type='hidden' id='lat'>
					<input type='hidden' id='logt'>
				</p> 
			</form>
		</div>  
	</div> 
<script type="text/javascript">
		var CONTEXT_PATH = "/jj";	
		
		var list = [];
		
		var totCnt = 0;
		
		var addrList = [];
		var sido = "";
		var sigun = "";
		var gu = "";
		var dong = ""; 
		
		var hospitalName = "";		// 병원명					BIZPLC_NM
		var deleteDate = ""; 		// 폐업일 					BSN_STATE_NM 폐업 / 휴업 / 영업중   		CLSBIZ_DE==null?폐업 : 영업
     	var sickBedCnt = "";		// 병상수					SICKBD_CNT
     	var medStaffCnt = "";		// 의료인수 				MEDSTAF_CNT
     	var fullAddr = "";
     	var addr = "";	 			// 주소(시도/시군구/동읍면 ..) REFINE_LOTNO_ADDR(지번주소)			REFINE_ROADNM_ADDR(도로명주소)
     	var tel = "";				// 전화번호 				LOCPLC_FACLT_TELNO
     	var sigunCd = "";			// 시군코드				SIGUN_CD
     	var sigunNm = "";			// 시군명					SIGUN_NM
     	var start_date = "";		// 인허가 일자				LICENSG_DE	
     	var treatSubjects = []; 	// 진료과목 				TREAT_SBJECT_CD_INFO(한글)			TREAT_SBJECT_CONT(코드)
     	var lat = "";				// WGS84위도 				REFINE_WGS84_LAT
     	var logt = "";				// WGS84경도 				REFINE_WGS84_LOGT
     	var existYn = "";
     	
     	var existCnt = 0;
     	
     	var sgList = [];
     	var dnList = [];
     	
     	var selectObj = {};
	
		$("#bigList").hide();
		$("#smallList").hide(); 
		$("#inputHospital").hide();   
		$("#dongCon").hide();
		$("#telTd").hide();
		
		function goHome() {
			location.href = CONTEXT_PATH + "/";
		} 
		 
		function joinChk() {  
			//alert(sido + " | " + sigun + " | " + dong);  
			
	        var frm = document.joinForm;
	        if (!frm.managerId.value) { //아이디를 입력하지 않으면.
	            alert("아이디를 입력하세요.");
	            frm.managerId.focus();
	            return;
	        } else if (!frm.managerPw.value) { //패스워드를 입력하지 않으면.
	            alert("패스워드를 입력하세요.");
	            frm.managerPw.focus(); 
	            return;
	        } else if (!frm.managerNm.value) { //패스워드를 입력하지 않으면.
	            alert("이름을 입력하세요.");
	            frm.managerNm.focus(); 
	            return;
	        } else if (!frm.phone.value) { //패스워드를 입력하지 않으면.
	            alert("핸드폰을 입력하세요.");
	            frm.phone.focus(); 
	            return;
	        } else if (!frm.addr.value) { //패스워드를 입력하지 않으면.
	            alert("주소를 입력하세요.");
	            frm.addr.focus(); 
	            return;
	        } else if (!frm.email.value) { //패스워드를 입력하지 않으면.
	            alert("이메일을 입력하세요.");
	            frm.email.focus(); 
	            return; 
	        } else if (!frm.sido.value) { //패스워드를 입력하지 않으면.
	            alert("시도를 선택하세요.");
	            return; 
	        } else if (!frm.sigun.value) { //패스워드를 입력하지 않으면.
	            alert("시군구를 선택하세요.");
	            return; 
	        }  else if (!frm.dong.value) { //패스워드를 입력하지 않으면.
	            alert("동읍면을 선택하세요.");
	            return; 
	        }  
	         
	        if(frm.kind.value == ""){
	        	console.log(frm.kind.value);
	        	alert("병원/의원을 선택해주세요.");
	        	return;  
	        }else {
	        	if(frm.kind.value == "1"){
	        		if(frm.bigListSelect.value == ""){
        				alert("병원을 선택하세요");
        				return; 
	        		} 
	        		if(frm.bigListSelect.value == "no"){
	        			if($("#inputHospital").val() == ""){
	        				alert("병원을 입력하세요");
	        				return; 
	        			} 
	        			else { 
	        				hospitalName = $("#inputHospital").val();
	        			}
	        			
	        			console.log($("#sido").val());
	        			if($("#sido").val() == ""){
	        				alert("시도를 선택헤주세요");
	        				return; 
	        			} 
	        			if($("#sigun").val() == ""){
	        				alert("시군구를 선택헤주세요");
	        				return; 
	        			} 
	        			if($("#dong").val() == ""){
	        				alert("동읍면을 선택헤주세요");
	        				return; 
	        			} 
	        			
	        			sido = $("#sido").val();
	        			sigun = $("#sigun").val();
	        			dong = $("#dong").val();
	        		} 
	        	}
	        	if(frm.kind.value == "2"){
	        		if(frm.smallListSelect.value == ""){
        				alert("의원을 선택하세요");
        				return; 
	        		} 
	        		if(frm.smallListSelect.value == "no"){
	        			if($("#inputHospital").val() == ""){
	        				alert("의원을 입력하세요");
	        				return; 
	        			} 
	        			else { 
	        				hospitalName = $("#inputHospital").val();
	        			}
	        		} 
	        	}  
	        } 
	        
	        
	       /*  if(!frm.smallListSelect.value || !frm.bigListSelect.value){
	        	if(!frm.smallListSelect.value)
	        	 
	        	console.log("!!!!!!!!!!!!!!");
	        	console.log(frm.kind.value);
	        	console.log(frm.smallListSelect.value);
	        	console.log(frm.bigListSelect.value); 
	        	alert("병원을 선택하세요"); 
	        	return; 
	        } */ 
	        /*if(hospitalName == ""){
	        	if(!frm.inputHospital.value){
	        		alert("병원을 입력하세요.");
		            frm.inputHospital.focus(); 
	        	} else {
	        		alert("병원을 선택하세요.");
	        	}
	        	 
	            return;
	        }*/ 
	         
	        join();    
	    }       
	     
	    function join(){
	    	
	    	if(hospitalName == ""){ 
	    		hospitalName = $("#inputHospital").val();
	    		fullAddr = ""; 
	    		sido = "";
	    		sigungu = "";
	    		dong = "";
	    	}    
	    	 
	    	var formData = {
	    		  managerId : $("#managerId").val()
	    		, managerPw : $("#managerPw").val()
	    		, managerNm : $("#managerNm").val()
	    		, managerPhone : $("#phone").val()
	    		, kind : $('input[name=kind]:checked').val()
	    		, hospitalNm : hospitalName
	    		, sido : sido
	    		, sigungu : sigun
	    		, dong : dong 
	    		, addr : fullAddr
	    		, tel : tel
	    		, managerEmail : $("#email").val() 
	    		, intro : $("#intro").val()
	    	};
	    	
	    	console.log(formData); 
	    	
	    	/*
	    	$.ajax({
	    		url : CONTEXT_PATH + "/join/joinChk", 
	    		type: "POST",  
	    		data: formData,
	    		success: function(data){
	    			console.log("join");  
	    			
	    			if(data == 'success'){
	        			location.href = CONTEXT_PATH + "/";  
	    			} else {  
	    				alert("ID 또는 PW를 확인해주세요.");
	    				location.href = CONTEXT_PATH + "/join";
	    			} 
	    		},
	    		error: function(data){ 
	    		   		location.href = CONTEXT_PATH + "/join";
	    		   		console.log("error");
	    		}
	    	});   */
	    }
	    
	    
	    //api 호출 및 콜백 
	    // jsonp ==> 크로스도메인 문제를 깔끔하게 해결 (json으로 콜백 받을 수 있음)
	    function getBigHospitalList(){
			var v1 = $("#sido").val();
			var v2 = $("#sigun").val();
			
			var v4 = "";					// 고양시 덕양구 같이 시 구로 되어 있는 시군구
			var v5 = "";					// XX시 
			
			
			if(v2 == "" || v1 == ""){
				return;
			} 
			
			console.log("getBigHospitalList()"); 
			console.log(v1 + "/" + v2); 
			console.log("v2.length : " + v2.length);
			
			if(v2.length > 4){		// 시군구 : 시군 구 
				v4 = v2.split(" ")[0]; 
			} 
			 
			if(v4 == ""){
    			v5 = v2;
    		} else { 
    			v5 = v4;   
    		}
			
	    	$.ajax({
	    		url : "https://openapi.gg.go.kr/GgHosptlM?KEY=1efad1ae8d5643228c419435ee3aec8e&Type=json&pIndex=1&pSize=100&SIGUN_NM="+v5,
	    		type: "GET", 
	    		dataType: 'jsonp',
	    		success: function(data){   
	    			totCnt = data.GgHosptlM[0].head[0].list_total_count;
	    			list = data.GgHosptlM[1].row;
	    			existCnt = 0; 							// 영업중인 병원만 +1
	    			console.log(list); 
	    			$("#bigListSelect").empty(); 
	    			$("#bigListSelect").append("<option value=''>선택</option>"); 
	    			$("#bigListSelect").append("<option value='no'>목록에 없음</option>");  
	    			for(var i=0; i < totCnt; i++){
	    				 
	    				if(list[i]){ 
		    				hospitalName = list[i].BIZPLC_NM;			//병원명
		    				existYn = list[i].BSN_STATE_NM;				//null : 폐업 , !null : 영업
		    				sickBedCnt = list[i].SICKBD_CNT;			//병상수
		    				medStaffCnt = list[i].MEDSTAF_CNT;			//의료인수
		    			 	fullAddr = list[i].REFINE_LOTNO_ADDR;
		    				addrList = fullAddr.split(" "); 
		    				sido = addrList[0];
		    				tel = list[i].LOCPLC_FACLT_TELNO;			//전화번호
		    				lat = list[i].REFINE_WGS84_LAT;
		    				logt = list[i].REFINE_WGS84_LOGT;
		
		    				if(v4 != ""){
		    					sigun = addrList[1];
		    					gu = addrList[2];
		    					dong = addrList[3];
		    					
		    					if(existYn == "영업중" && sigun + " " + gu == v2){ 
			    					$("#bigListSelect").append("<option>"+ hospitalName +"</option>"); 
			    					//console.log(hospitalName + " / " + existYn + " / " + addr + "("+ sido + "/" + sigun + " " + gu + "/" + dong +")"); 
			    					  
			    					existCnt++;   
			    				} 
			     
		    					
		    				} else {
		    					sigun = addrList[1];
		    					gu = "";
			    				dong = addrList[2];
			    				 
			    				if(existYn == "영업중" && sigun == v2){
			    					$("#bigListSelect").append("<option>"+ hospitalName +"</option>"); 
			    					//console.log(hospitalName + " / " + existYn + " / " + "("+ sido + "/" + sigun + "/" + dong +")"); 
			    					 
			    					existCnt++;  
			    				}
		    				}
		    				
		    				//addr = fullAddr.substring(0, 11);			//주소(시도/시군구/동읍면 ..)   
		    				//sido = addr.substring(0,3);  
		    				//sigun = addr.substring(4,7);
		    				//dong = addr.substring(8,11);  
		    				
		    				
		    				
		    				//console.log(addrList);  
		    				/* console.log(addrList);  
		    				console.log(sido + sigun + dong);  
		    				console.log(typeof addr);  */ 
		    				//console.log(list[i]);     //병원 전체 정보     
		    				
	    				} 
	    			}   
	    			
	    			console.log("totCnt : " + totCnt);  
	    			console.log("existCnt : " + existCnt); 
	    			console.log("success!!");   
	    			  
	    		},
	    		error: function(data){ 
	    			console.log(data); 
    				console.log("error");
    		   		//location.href = CONTEXT_PATH + "/join";
	    		}
	    	});
	    }
	    
	    function getSmallHospitalList(){
	    	var v1 = $("#sido").val();
			var v2 = $("#sigun").val();
			
			var v4 = "";					// 고양시 덕양구 같이 시 구로 되어 있는 시군구
			var v5 = "";					// XX시
			
			if(v2 == "" || v1 == ""){
				return;
			} 
			
			console.log("getSmallHospitalList()"); 
			console.log(v1 + "/" + v2); 
			console.log("v2.length : " + v2.length);
			
			if(v2.length > 4){		// 시군구 : 시군 구 
				v4 = v2.split(" ")[0]; 
			} 
			
			if(v4 == ""){
				v5 = v2;
			} else { 
				v5 = v4;   
			}
	    	/* var hospitalName = "";		// 병원명					BIZPLC_NM
			var deleteDate = ""; 		// 폐업일 					BSN_STATE_NM 폐업 / 휴업 / 영업중
	     	var sickBedCnt = "";		// 병상수					SICKBD_CNT
	     	var medStaffCnt = "";		// 의료인수 				MEDSTAF_CNT
	     	var addr = "";	 			// 주소(시도/시군구/동읍면 ..) REFINE_LOTNO_ADDR(지번주소)			REFINE_ROADNM_ADDR(도로명주소)
	     	var tel = "";				// 전화번호 				LOCPLC_FACLT_TELNO
	     	var sigunCd = "";			// 시군코드				SIGUN_CD
	     	var sigunNm = "";			// 시군명					SIGUN_NM
	     	var start_date = "";		// 인허가 일자				LICENSG_DE	
	     	var treatSubjects = []; 	// 진료과목 				TREAT_SBJECT_CD_INFO(한글)			TREAT_SBJECT_CONT(코드)
	     	var lat = "";				// WGS84위도 				REFINE_WGS84_LAT
	     	var logt = "";				// WGS84경도 				REFINE_WGS84_LOGT */
	     	
	    	$.ajax({
	    		url : "https://openapi.gg.go.kr/PrivateHospital?KEY=1efad1ae8d5643228c419435ee3aec8e&Type=json&pIndex=1&pSize=100&SIGUN_NM="+v5, 
	    		type: "GET",
	    		dataType: 'jsonp',
	    		success: function(data){   
	    			totCnt = data.PrivateHospital[0].head[0].list_total_count;
	    			list = data.PrivateHospital[1].row;
	    			existCnt = 0;
	    			
 	 				console.log(list); 
 	 				
 	 				$("#smallListSelect").empty(); 
 					$("#smallListSelect").append("<option value=''>선택</option>"); 
 					$("#smallListSelect").append("<option value='no'>목록에 없음</option>");
 	 				
	    			for(var i=0; i < totCnt; i++){
	    				
	    				if(list[i]){
	    					 
		    				hospitalName = list[i].BIZPLC_NM;			//병원명 
		    				existYn = list[i].BSN_STATE_NM;				//폐업 / 휴업 / 영업중
		    				sickBedCnt = list[i].SICKBD_CNT;			//병상수
		    				medStaffCnt = list[i].MEDSTAF_CNT;			//의료인수
		    				fullAddr = list[i].REFINE_LOTNO_ADDR;
							addrList = fullAddr.split(" "); 
							sido = addrList[0];
		    				/* addr = list[i].REFINE_LOTNO_ADDR.substring(0,11);			//주소(시도/시군구/동읍면 ..) 
		    				sido = addr.substring(0,3);
		    				sigun = addr.substring(4,7);
		    				dong = addr.substring(8,11);  */ 
		    				   
		    				//console.log(list[i]);     //병원 전체 정보    
		    				
							if(v4 != ""){
								sigun = addrList[1];
								gu = addrList[2];
								dong = addrList[3];
								
								if(existYn == "영업중" && sigun + " " + gu == v2){ 
									$("#smallListSelect").append("<option>"+ hospitalName +"</option>"); 
									  
									existCnt++;   
								} 
							} else {
								sigun = addrList[1];
								gu = "";
								dong = addrList[2];
								 
								if(existYn == "영업중" && sigun == v2){
									$("#smallListSelect").append("<option>"+ hospitalName +"</option>"); 
									//console.log(hospitalName + " / " + existYn + " / " + "("+ sido + "/" + sigun + "/" + dong +")"); 
									 
									existCnt++;  
								}
							}
		    				
		    				/* if(existYn == "영업중"){
		    					$("#smallListSelect").append("<option>"+ hospitalName +"</option>");
		    					console.log(hospitalName + " / " + existYn + " / " + sickBedCnt + " / " + medStaffCnt + " / " + addr + "("+ sido + "/" + sigun + "/" + dong +")");
		    					
		    					existCnt++; 
		    				} */
	    				} 	
	    			}     
	    			
	    			console.log("existCnt : " + existCnt);
	    			console.log("success!!");  
	    			  
	    		},
	    		error: function(data){ 
	    			console.log(data); 
    				console.log("error");
    		   		//location.href = CONTEXT_PATH + "/join";
	    		}
	    	});
	    } 
	    
	    function whatkind(){ 
	    	var val = $('input[name=kind]:checked').val();
	    	
	    	console.log("병원? 의원? : " + val); 
	    	
	    	$("#addr").val("");  
	    	$("#inputHospital").hide(); 
	    	 
	    	if(val == "1"){
	    		$("#bigList").show();
	    		$("#smallList").hide();
	    		getBigHospitalList();
	    	} else {
	    		$("#bigList").hide(); 
	    		$("#smallList").show();  
	    		 
	    		$("#tel").val("");
	    		tel = "";
		    	$("#telTd").hide();  
		    	 
	    		getSmallHospitalList(); 
	    	}
	    } 
	    
	    function changeBigList(){
	    	console.log("changeBigList()");
			var val = $("select[id=bigListSelect]").val();
			var obj = {};  
			
			console.log("병원명 : " + val); 
			
			if(val == "no"){ 
	    		$("#inputHospital").show(); 
	    		hostitalName = "";
	    		fullAddr = ""; 
	    		sido = "";
	    		sigun = ""; 
	    		gu = "";
	    		dong = ""; 
	    		
	    	} else {
	    		$("#inputHospital").hide(); 
	    		$("#dong").empty();
 
	    		hospitalName = val; 
	    		
				for(var i=0; i < totCnt; i++){
    				//console.log(list[i].BIZPLC_NM + "/ " + hospitalName);
    				//console.log(list[i].BIZPLC_NM);   
    				if(list[i].BIZPLC_NM == hospitalName){ 
    					//console.log("no["+ i +"]");    
    					
    					obj = list[i];
    					selectObj = obj;
    					
    					hospitalName = obj.BIZPLC_NM;			//병원명 
    					existYn = obj.BSN_STATE_NM;				//폐업 / 휴업 / 영업중
    					sickBedCnt = obj.SICKBD_CNT;			//병상수
    					medStaffCnt = obj.MEDSTAF_CNT;			//의료인수
    					fullAddr = obj.REFINE_LOTNO_ADDR;
    					addrList = fullAddr.split(" "); 
    					sido = addrList[0];
    					sigun = addrList[1];
    					dong = addrList[2];
    					lat = obj.REFINE_WGS84_LAT;
    					logt = obj.REFINE_WGS84_LOGT;
    					tel = obj.LOCPLC_FACLT_TELNO;
    						
    					console.log(lat + " | " + logt); 
    					
    					if(dong.includes('구') && !dong.includes('동')){  
    						gu = addrList[2];
    						dong = addrList[3];
    					} else {
    						gu = "";
    					} 
    					console.log(dong);    
    					//alert(dong);   
    					//$("select[id=dong]").val(dong).prop("disabled", true);
    					getDongList(dong); 
    					console.log($("select[id=dong]").val());  
    					console.log(hospitalName + "/" + existYn + "/" + sickBedCnt + "/" + medStaffCnt + "/" + fullAddr + "/" + sido + "/" + sigun + "/" + dong);   
    					//$("#dong").val(dong).prop("disabled", true);
    					$("#dongCon").show();       
    					console.log(hospitalName + "/" + existYn + "/" + sickBedCnt + "/" + medStaffCnt + "/" + fullAddr + "/" + sido + "/" + sigun + "/" + dong);   
    					//$("#dong").val(dong).prop("selected", true);  
    					//$("#dong").val(dong).prop("disabled", true); 
    					
    					$("#addr").val(fullAddr);    
    					 
    					$("#tel").empty(); 
    					$("#tel").val(tel);
    					$("#telTd").show(); 
    					
    					console.log(val); 
    					break; 
	    				 
    				} 	
    			}  
				//console.log(hospitalName + " / " + existYn + " / " + sickBedCnt + " / " + medStaffCnt + " / " + addr + "("+ sido + "/" + sigun + "/" + dong +")");
	    	} 
	    	//console.log("hospitalName : " + hospitalName);
	    }
	     
	    function changeSmallList(){
	    	console.log("changeSmallList()");
	    
	    	var val = $("select[id=smallListSelect]").val();
	    	var obj = {};
	    	
	    	console.log("병원명 : " + val); 
	    	
	    	if(val == "no"){ 
	    		$("#inputHospital").show(); 
	    		hostitalName = "";
	    		fullAddr = ""; 
	    		sido = "";
	    		sigun = "";
	    		gu = "";
	    		dong = "";
	    		 
	    	} else {
	    		$("#inputHospital").hide(); 
	    		$("#dong").empty();
	    		
	    		hospitalName = val;
	    		
				for(var i=0; i < totCnt; i++){
					console.log(list[i].BIZPLC_NM + "/ " + hospitalName);
					console.log(list[i].BIZPLC_NM); 
					
    				if(list[i].BIZPLC_NM == hospitalName){
    					//console.log("no["+ i +"]");    
    					
    					obj = list[i];
    					selectObj = obj; 
    					
    					hospitalName = obj.BIZPLC_NM;			//병원명 
    					existYn = obj.BSN_STATE_NM;				//폐업 / 휴업 / 영업중
    					sickBedCnt = obj.SICKBD_CNT;			//병상수
    					medStaffCnt = obj.MEDSTAF_CNT;			//의료인수
    					fullAddr = obj.REFINE_LOTNO_ADDR;
    					addrList = fullAddr.split(" "); 
    					sido = addrList[0];
    					sigun = addrList[1]; 
    					dong = addrList[2];  
    					lat = obj.REFINE_WGS84_LAT;
    					logt = obj.REFINE_WGS84_LOGT;
    					
    					//console.log(lat + " | " + logt); 
    					
    					if(dong.includes('구')){ 
    						gu = addrList[2];
    						dong = addrList[3];
    					} else { 
    						gu = "";
    					} 
    					console.log(dong);    
    					
    					getDongList(dong);
    					
    					//console.log($("select[id=dong]").val());  
    					console.log(hospitalName + "/" + existYn + "/" + sickBedCnt + "/" + medStaffCnt + "/" + fullAddr + "/" + sido + "/" + sigun + "/" + dong);   
    					
    					$("#dongCon").show();       
    					 
    					$("#addr").val(fullAddr);   
    					 
    					break; 
    				} 	
    			}   
				//console.log(hospitalName + " / " + existYn + " / " + sickBedCnt + " / " + medStaffCnt + " / " + addr + "("+ sido + "/" + sigun + "/" + dong +")");
	    	} 
	    	//console.log("hospitalName : " + hospitalName); 
	    }
	    
	    function getSigunguList(){
	    	$("#sigun").empty(); 
	    	$("#dong").empty(); 
	    	$("#dongCon").hide(); 
	    	
	    	$("#sigun").append("<option value=''>선택</option>");

	    	$("#addr").val("");
	    	$("#tel").val("");
	    	$("#telTd").hide(); 
	    	
	    	$("#bigListSelect").empty();
	    	$("#smallListSelect").empty();  
	    	$("#bigListSelect").append("<option value=''>선택</option>"); 
			$("#smallListSelect").append("<option value=''>선택</option>"); 
	    	$("#bigListSelect").val("").prop("selected", true); 
	    	$("#smallListSelect").val("").prop("selected", true); 
	    	 
	    	var param = { 
	    		sdNm : $("#sido").val()
	    	}
	    	
	    	//exceptionDong(dong); 
	    	
			var splitSg = "";

	    	console.log("getSigunguList()");  
	    	console.log("선택한 시도 : " + param.sdNm);  
	    	  
	    	if(param.sdNm != ""){ 
				$.ajax({
		    		url : CONTEXT_PATH + "/sigungu", 
		    		type: "POST",
		    		data: param,  
		    		success: function(data){
		    			console.log(param.sdNm + "의 시군구 개수 : " + data.length); 
		    			 
		    			for(var i = 0; i < data.length; i++){
		    				sgList[i] = data[i].sgNm;
 		    				 
		    				$("#sigun").append("<option value='"+ sgList[i] +"'>" + sgList[i] +"</option>"); 
		    			}       
		    		},
		    		error: function(data){
		    			console.log("error");  
		    		}
		    	});
	    	}
	    }
	    
	function getDongList(dong){

			console.log("getDongList()"); 
			
	    	dnList = [];
	    	
	    	$("#dong").empty(); 
	    	$("#dong").append("<option value=''>선택</option>");
	    	 
	    	var param = {
	    		sgNm : $("#sigun").val()
	    	}; 
	    	    
	    	console.log(param); 
	    	
	    	//예외처리
	    	if(dong.includes('1동') || dong.includes('2동') || dong.includes('3동') || dong.includes('4동')){
	    		dong = dong.replace(/[0-9]/g, "");
				//alert("숫자 포함"); 
			}    
	    	if(dong == "" && $("#sigun").val() == "시흥시"){
	    			dong = "정왕동";
    		} 	
	    	  
	    	console.log("동 : " + dong); 
	    	 
	    	
	    	if(param.dnNm != ""){ 
				$.ajax({
		    		url : CONTEXT_PATH + "/dong", 
		    		type: "POST",
		    		data: param,   
		    		success: function(data){
		    			/* console.log(data.length); 
		    			console.log(data); 
		    			console.log(dnList); 
		    			console.log(dong);  */
		    			for(var i = 0; i < data.length; i++){ 
		   					 
		    				dnList[i] = data[i].dnNm;   
		    				
		    				if(dong == dnList[i]){
		    					$("#dong").append("<option value='"+ dnList[i] +"' selected='selected'>" + dnList[i] +"</option>");  
		    				} else {   
		    					$("#dong").append("<option value='"+ dnList[i] +"'>" + dnList[i] +"</option>"); 
		    					
		    				}
		    				    
		    				//$("#dong").val(dong).prop("selected", true);   
	    					//$("#dong").val(dong).prop("disabled", true); 
		    			}       
		    		},
		    		error: function(data){
		    			console.log("error");  
		    		}
		    	});
				
				$("#dong").val(dong).prop("disabled", true);  
	    	}
	    }
	
		function setHospitalList(){
			var val1 = $("#sido").val();
			var val2 = $("#sigun").val();
			var val3 = $("input[name=kind]").val();
			  
			console.log("setHospitalList()");
			//console.log(v1 + " / " + v2 + " / " + v3); 
			console.log($("input[name=kind]").val());     
			
			if(val3 == 1){ 
				getBigHospitalList();
			} 
			if(val3 == 2){
				getSmallHospitalList();
			} 
			 
			if(val1 == ""){  
				return;
			}
			if(val2 == ""){
				return;
			}
			if(val3 == ""){ 
				return;
			}
		} 
		
		function changeSigungu(){
	    	$("#dong").empty(); 
	    	$("#dongCon").hide();
	    	
	    	$("#addr").val("");
	    	$("#tel").val("");
	    	$("#telTd").hide(); 
	    	
	    	$("#bigListSelect").val("").prop("selected", true);
	    	$("#smallListSelect").val("").prop("selected", true); 
		}
		
</script>
</body>
</html>