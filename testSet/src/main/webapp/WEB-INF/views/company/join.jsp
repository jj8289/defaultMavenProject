<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
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
		width: 650px;
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
		margin: 5px; 
	}   
	
	.btnSearch {
		border: none;
		background-color: gray; 
		color: white; 
		width: 50px; 
		height: 30px;  
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
				https://data.gg.go.kr/portal/data/service/selectServicePage.do?page=1&rows=10&sortColumn=&sortDirection=&infId=6T98794V0223GQQ9O1P42484027&infSeq=3
				병원 api (시 이름으로 가능)
				https://data.gg.go.kr/portal/data/service/selectServicePage.do?page=1&rows=10&sortColumn=&sortDirection=&infId=9091L96FYGLU9J9I8UC52153092&infSeq=3&order=&loc=&BIZPLC_NM=&BSN_STATE_NM=&REFINE_ROADNM_ADDR=
				의원 api (시 이름으로 가능)
				json으로 다운받으면 ==> 데이터 에시)
				{"SIGUN_NM":"김포시","BIZPLC_NM":"미소가인피부과의원","LICENSG_DE":"20090401","BSN_STATE_NM":"영업중","CLSBIZ_DE":"","SICKBD_CNT":"0","MEDINST_SPCS_NM":"","MEDSTAF_CNT":"3","HOSPTLRM_CNT":"0","TREAT_SBJECT_CONT":"114","TOT_AR":"226.63","REFINE_ROADNM_ADDR":"경기도 김포시 사우중로 51, 메가라인 3층 303,304호 (사우동)","REFINE_LOTNO_ADDR":"경기도 김포시 사우동 932번지 메가라인","REFINE_ZIPNO":"10108","REFINE_WGS84_LAT":"37.6196617594","REFINE_WGS84_LOGT":"126.7188262506"}
				
				api 이용 시에는 
				req : SIGUN_CD(시군코드) 또는 SIGUN_NM(시군명)
				response : SIGUN_CD(시군코드), SIGUN_NM(시군명), BIZPLC_NM(사업장명), BSN_STATE_NM(영업중인지), REFINE_LOTNO_ADDR(주소), WGS84위도, WGS84경도, TOT_PSN_CNT(총인원수), TREAT_SBJECT_CONT(진료과목내용) 등등 가져올 수 있음. 
				<table cellspacing="3"> 
				<colgroup> 
   					<col width="20%"/>  
    				<col width=""/>  
 				</colgroup>  
					<tr>  
						<td bgcolor="lightgrey" align="center">관리자 아이디</td>	
						<td><input size="15" type="text" name="userId" id="userId"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr> 
					<tr>  
						<td bgcolor="lightgrey" align="center">관리자 비밀번호</td>  
						<td><input size="15" type="password" name="userPw"  id="userPw"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>  
					<tr> 
						<td bgcolor="lightgrey" align="center">관리자 이름</td> 
						<td><input type="text" name="userNm" id="userNm"></td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">관리자 핸드폰</td>
						<td><input type="text" name="phone" id="phone"> ex) 01012345678</td>
					</tr> 
					<tr> 
						<td bgcolor="lightgrey" align="center">주소</td>   
						<td class="sigungu">
							<!-- <input size="70" type="text" name="sigungu" id="sigungu"> -->
							<label class="item">시군구</label>  
							<select class="item" style="width: 150px;">  
								<option>선택</option>
								<option>김포시</option>
							</select>   
							<label class="item">동읍면</label> 
							<select class="item" style="width: 150px;">
								<option>선택</option>
								<option>감정동</option>
								<option>감정동</option>
								<option>감정동</option>
								<option>감정동</option>
								<option>감정동</option> 
								<option>감정동</option>
								<option>감정동</option>
							</select> 
							<div class="item"><button id="search" value="찾기" type="button" onclick="" class="btnSearch">찾기</button></div>
						</td>    
					</tr> 
					<tr>
						<td bgcolor="lightgrey" align="center">병원 주소</td>
						<td><input size="70" type="text" name="addr" id="addr"></td>
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
				</p> 
			</form>
		</div>  
	</div> 
<script type="text/javascript">
		var CONTEXT_PATH = "/jj";	
	
		function goHome() {
			location.href = CONTEXT_PATH + "/";
		} 
		 
		function joinChk() {  
	        var frm = document.joinForm;
	        if (!frm.userId.value) { //아이디를 입력하지 않으면.
	            alert("아이디를 입력하세요.");
	            frm.userId.focus();
	            return;
	        } else if (!frm.userPw.value) { //패스워드를 입력하지 않으면.
	            alert("패스워드를 입력하세요.");
	            frm.userPw.focus(); 
	            return;
	        } else if (!frm.userNm.value) { //패스워드를 입력하지 않으면.
	            alert("이름을 입력하세요.");
	            frm.userNm.focus(); 
	            return;
	        } else if (!frm.age.value) { //패스워드를 입력하지 않으면.
	            alert("나이를 입력하세요.");
	            frm.age.focus(); 
	            return;
	        } else if (!frm.job.value) { //패스워드를 입력하지 않으면.
	            alert("직업을 입력하세요.");
	            frm.job.focus(); 
	            return;
	        } else if (!frm.sex.value) { //패스워드를 입력하지 않으면.
	            alert("성별을 선택하세요.");
	            frm.sex.focus(); 
	            return;
	        } else if (!frm.career.value) { //패스워드를 입력하지 않으면.
	            alert("경력을 입력하세요.");
	            frm.career.focus(); 
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
	        }
	        
	        join();  
	    }       
	     
	    function join(){
	    	var formData = {
	                userId: $('#userId').val()
	              , userPw: $('#userPw').val()
	              , userNm: $('#userNm').val()
	              , age: $('#age').val()
	              , job: $('#job').val()
	              , sex: $('input[name=sex]:checked').val()
	              , career: $('#career').val()
	              , phone: $('#phone').val()
	              , addr: $('#addr').val() 
	              , email: $('#email').val()
	              , intro: $('#intro').val()
	              , skill: $('#skill').val()
	    	};
	    	 
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
	    	});   
	    }
</script>
</body>
</html>