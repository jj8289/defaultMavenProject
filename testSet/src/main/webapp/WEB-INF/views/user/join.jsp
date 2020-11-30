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
		padding: 0;
	}
	 
	#container {
		
	}
	
	.temp {
		height: 50px;
	}
	
	.minicon {
		width: 500px;
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
		height: 25px; 
	} 
	
	.but input {
		border: none;
		background-color: #424242;
		color: white;
		width: 100px;
		height: 30px;
	}
	
	input, select { 
		height: 22px;
	}
	
	button {
		border: none;
		background-color: #424242;
		color: white;
		width: 100px;
		height: 30px;
	}  
	 
	table {
		width: 850px;  
		height: 180px;
		margin-left: -100px; 
	}
	
	td {
		height: 25px;
	}
	
	#addCareer, #delCareer{
		border: none;
		background-color: #d3d3d3;
		color: black;
		width: 25px;
		height: 25px; 
	}
</style>
</head>
<body> 
	<div id="container">
		<div class="temp"></div>
		<h2 class="title">회원가입</h2>
		<div class="temp"></div>
		<div class="minicon"> 
			<form id="joinForm" name="joinForm" enctype="multipart/form-data" method="post"> 
				<table cellspacing="3">
				<colgroup> 
   					<col width="15%"/> 
    				<col width=""/> 
 				</colgroup> 
					<tr>  
						<td bgcolor="lightgrey" align="center">아이디</td>	
						<td><input size="15" type="text" name="userId" id="userId"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">비밀번호</td>
						<td><input size="15" type="password" name="userPw"  id="userPw"> 4~12자의 영문 대소문자와 숫자로만 입력</td>
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">이름</td>
						<td><input type="text" name="userNm" id="userNm"></td>
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">나이</td>
						<td><input type="text" name="age" id="age"> ex) 27</td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">직업</td>
						<td>
							<select id="job">
								<option value="">선택</option>
								<c:forEach var="item" items="${jobList }">
									<option id="${item.key }" value="${item.key }">${item.value }</option>
								</c:forEach>  
							</select>  
						</td> 
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">성별</td>
						<td>
							<input type="radio" name="sex" id="sex1" value="F" > 여
							<input type="radio" name="sex" id="sex2" value="M" > 남
						</td> 
					</tr> 
					<tr id="careerTr">
						<td bgcolor="lightgrey" align="center">경력</td>
						<td><input type="text" name="career" id="career" size="2" onchange="createAddBtn()">년 <input type="button" id="addCareer" onclick="add()" value="+" hidden="true"></td>    
					</tr>  
					<tr> 
						<td bgcolor="lightgrey" align="center">핸드폰</td>  
						<td><input type="text" name="phone" id="phone"> ex) 01012345678</td>
					</tr>
					<tr id="hiddenAddr"> 
						<td bgcolor="lightgrey" align="center">주소</td>   
						<td class="sigungu">
							<label class="item">시도</label>  
							<select id="sido" class="item"  style="width: 100px;" >  
							</select>   
							<label class="item">시군구</label>  
							<select id="sigun" class="item"  style="width: 125px;">    
							</select>     
							<label class="item">동읍면</label>    
							<select id="dong" name="dong" class="item" style="width: 95px;"></select>  
						</td>    
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">주소</td>   
						<td class="sigungu" > 
							<input size="73" type="text" name="addr" id="addr" onclick="openPopup()">   
							<button id="findAddrBtn" value="검색" type="button" onclick="openPopup()" class="but">검색</button>
							<!-- <div class="item"><button id="findAddrBtn" value="검색" type="button" onclick="openPopup()">검색</button></div>   -->
						</td>     
					</tr>
					<tr> 
						<td bgcolor="lightgrey" align="center">이메일</td>
						<td><input size="70" type="text" name="email" id="email"></td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">간단 소개</td>
						<td><input size="70" type="text" name="intro" id="intro"></td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">스킬</td>
						<td><input size="70" type="text" name="skill" id="skill"></td>
					</tr>
					<tr>
						<td bgcolor="lightgrey" align="center">면허증</td> 
						<td><input type="file" name="file" id="imageFileOpenInput" accept="image/*"></td> 
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
	var sido = $("select[id=sido]").val();
	var sigun = $("select[id=sigun]").val();         //""
	var dong = $("select[id=dong]").val();			 //null	
	var kind = $("input[name=kind]:checked").val();  //undefined
	
	var sgList = [];
 	var dnList = [];
 	 
 	$("#hiddenAddr").hide(); 
 	
 	function jusoCallBack(roadFullAddr, siNm, sggNm, emdNm){		// 파라미터 : full주소, 동읍면이름
 		 // 2017년 2월 제공항목이 추가되었습니다. 원하시는 항목을 추가하여 사용하시면 됩니다.
 		 console.log(roadFullAddr); 
 		 console.log(typeof roadFullAddr); 
 		 console.log(emdNm);  
 		  
 		 document.joinForm.addr.value = roadFullAddr;
 		 addr = roadFullAddr;  
 		 sido = siNm;
 		 sigun = sggNm; 
 		 dong = emdNm; 
 		 
 		 console.log(addr); 
 		 
 		 $("#addr").val(addr);   
 		 console.log("addr :  " + $("#addr").val()); 
 		 $("#sido").append("<option value='"+ siNm +"' selected>"+ siNm +"</option>");
 		 $("#sigun").append("<option value='"+ sggNm +"' selected>"+ sggNm +"</option>");
 		 $("#dong").append("<option value='"+ emdNm +"' selected>"+ emdNm +"</option>");
 		 $("#sido").val(siNm).prop("disabled", true);  
 		 $("#sigun").val(sggNm).prop("disabled", true);  
 		 $("#dong").val(emdNm).prop("disabled", true);  
 		 //$("#dongCon").show();  
 		 //$("#dong").show();   
 		 
 		$("#hiddenAddr").show(); 
 		 // 시군구의 동list 에  emdNm이 있는지 체크해야 함!
 	}  
	
	function createAddBtn(){
		console.log($("#career").val());  
		if($("#career").val() == "0"){ 
			$("#addCareer").prop("hidden", true);
		} else { 
			$("#addCareer").prop("hidden", false);
		}
	}
	
	function add(){
		var html = "";
		
		html += "<tr name='addTr'>";
		html += "<td bgcolor='" + "lightgrey" +"' align='" + "center" +"'>경력 상세</td>";
		html += "<td> 직장명 <input type='text' id='companyNm' name='companyNm' style='height:18px'>   직급 <input type='text' id='lev' name='lev' style='height:18px' size='3'>   기간 <input type='text' id='workPeriod' name='workPeriod' style='height:18px' size='3'>개월</td>";
		html += "<td><button type='button' id='" + "delCareer' class='delCareer' onclick='del()'>-</button></td>"; 
		html += "</tr>";  
		  
		$("#careerTr").after(html);
		 
		/* if (addCnt == 1) {
			$("#careerTr").after(html);
		}else {  
			$("#addTr"+ (addCnt-1)).after(html); 
		} */
	} 
	
	function del(){ 
		var target = $(event.target).parent().parent(); 
		console.log(target); 
		 
		target.remove(); 
		/* $(".delCareer").on("click", function(e){
			console.log("!!"); 
			var tr = $(e.target).parent().parent();
			console.log(tr);  
			//$(e.target)	
		}); */
	}
	
	
	
	/* function del(obj){
		console.log(obj);
		console.log(typeof(obj)); 
		
		console.log(obj.parent()); 
		 
	} */
	/*function uploadFile(){
		 var form = $('#joinForm')[0];
         var formData = new FormData(form);
         formData.append("fileObj", $("#joinForm")[0].files[0]);

         $.ajax({
             url: '',
             processData: false,
             contentType: false,
             data: formData,
             type: 'POST',
             success: function(result){
                 alert("업로드 성공!!");
             }
         });

	}*/
	
		function joinChk() {  
	        var frm = document.joinForm;
	        console.log("!!!!");
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
	        } else if ($("select option:checked").val() == "") { //패스워드를 입력하지 않으면.
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
	        console.log("1111111"); 
	        join();  
	    }       
	     
	    function join(){
	    	console.log("join()");
	    	var formData = {
	                userId: $('#userId').val()
	              , userPw: $('#userPw').val()
	              , userNm: $('#userNm').val()
	              , age: $('#age').val()
	              , jobNm: $('#job').val()
	              , sex: $('input[name=sex]:checked').val()
	              , career: $('#career').val()
	              , phone: $('#phone').val()
	              , addr: $('#addr').val() 
	              , email: $('#email').val()
	              , intro: $('#intro').val()
	              , skill: $('#skill').val()
	    	}; 
	    	
	    	console.log(formData); 
	    	 
	    	$.ajax({
	    		url : CONTEXT_PATH + "/user/join/joinChk", 
	    		type: "POST",  
	    		data: formData,
	    		success: function(data){
	    			console.log("join");  
	    			
	    			if(data == 'success'){
	    				alert("가입 완료!");
	        			location.href = CONTEXT_PATH + "/";  
	    			} else {  
	    				alert("ID 또는 PW를 확인해주세요.");
	    				location.href = CONTEXT_PATH + "/user/join";
	    			} 
	    		},
	    		error: function(data){ 
	    		   		location.href = CONTEXT_PATH + "/user/join";
	    		   		console.log("error");
	    		}
	    	});   
	    }
</script>
</body>
<script src="${pageContext.request.contextPath}/resources/js/user/join.js"></script>
</html>