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
	height: 40px; 
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
 	width: 1100px;      
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
	width: 80px; 
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

tr{
	height: 50px; 
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
			<h2 class="title">매치</h2>   
			<div class="temp"></div> 
			<div class="regCon">   
				<table id="listTable">
				<c:if test="${not empty regList }">
					<caption style="height: 50px;">조건 등록 리스트  [ 총 개수 : ${pageVO.rowCount } ]</caption> 
					<colgroup>     
						<col style="width: 40px">
						<col style="width: 190px">    
						<col style="width: 150px"> 
						<col style="width: 130px"> 
						<col style="width: 170px"> 
						<col style="width: 200px">
						<col style="width: 130px"> 
						<col style="width: 130px">  
						<col style="width: 130px">    
						<%-- <col style="width: 60px">   --%>
						<col style="width: 120px">  
					</colgroup>   
					<thead>             
						<tr>
							<th scope="col">No</th>
							<th scope="col">직종</th>
							<th scope="col">근무 기간</th>
							<th scope="col">시급/일급</th>
							<th scope="col">근무(시작)일</th> 
							<th scope="col">근무 시간</th>
							<th scope="col">성별</th>
							<th scope="col">나이</th>
							<th scope="col">경력</th>
							<!-- <th scope="col">매칭</th> -->
							<th scope="col">매칭 상태</th>
						</tr>
					</thead>
					<tbody id="listBody"> 
						<c:forEach items="${regList }" var="reg">
							<tr>      
								<td>
									<c:out value="${reg.rowNum }" />
									<input type="hidden" id="regNo${reg.regNo }"  value="${reg.regNo }">
								</td>
								<td>
									<c:forEach items="${jobList }" var="job">
										<%-- <c:out value="${job.key }" /> 
										<c:out value="${job.value }" />
										<c:out value="${reg.job }" /> --%> 
										<c:if test="${job.key == reg.job }">	
											<c:out value="${job.value }" /><c:if test="${job.key == '1' }">(${reg.workFlag })</c:if>
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
									<c:out value="${reg.workStTime }" />~<c:out value="${reg.workEnTime }" />
									(<c:out value="${reg.calWorkTime }" />h) 
								</td>   
								<td>
									<c:if test="${reg.sex == 'F' }">여자</c:if>
									<c:if test="${reg.sex == 'M' }">남자</c:if> 
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
								<!-- <td>
									<p class="but"><input type="button" id="matchBtn" onclick="#" value="매칭" class="btn"></p>  
								</td> --> 
								<td id="switch_td" style="padding-left: 13px; text-align: center; display: flex; align-content:space-between; align-items: center; margin-top: 7px;">   
									<div style="width: 40px;"><p id="off${reg.regNo}" style="padding: 5px;">OFF</p></div>
										<label class="switch" style="text-align: center;">      
										    <c:if test="${reg.matchFlag == 'Y' }"><input type="checkbox" id="switchBtn${reg.regNo}" onclick="toggle(this, ${reg.regNo}, '${reg.matchFlag}')" onload="toggle(this, ${reg.regNo}, '${reg.matchFlag}')" checked></c:if>
										    <c:if test="${reg.matchFlag == 'N' }"><input type="checkbox" id="switchBtn${reg.regNo}" onclick="toggle(this, ${reg.regNo}, '${reg.matchFlag}')" onload="toggle(this, ${reg.regNo}, '${reg.matchFlag}')"> </c:if>
										    <span class="slider round"></span>  
										</label>  
									<div style="width: 40px;"><p id="on${reg.regNo}" style="padding: 5px;">ON</p></div>
								</td>     
							</tr> 
						</c:forEach>  
						</c:if>	
						<c:if test="${empty regList }">
							<div style="text-align: center;"><p>등록된 매칭 조건이 없습니다.</p></div>
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

var dataList = $("#listBody").find("tr");
var len = dataList.length;
var stat = "";

$(dataList).each(function(i, obj){
	var check = $(obj).find("input[id^=switchBtn]").is(":checked");	//체크여부 (true/false)
	var regNo = $(obj).find("input[id^=regNo]").val();
	
	console.log(regNo); 
	
	if(check){
		$("#off" + regNo).hide();
	} else {
		$("#on" + regNo).hide(); 
	}
}); 

function toggle(item, regNo, flag) {
	console.log(regNo); 
	console.log(flag);
	
	var rslt = ""; 
	
	if(item.checked == true){
		rslt = confirm("매칭하시겠습니까?");
		if(rslt){
			stat = item
			updateMatchStatus(regNo, 'Y');
 			$("#on" + regNo).show(); 
 			$("#off" + regNo).hide();
			return;
		} else{
			alert("매칭이 취소되었습니다.");
			$("#"+item.id).prop("checked", false); 
 			$("#on" + regNo).hide();
 			$("#off" + regNo).show();
 			return;
		}
	} else {  
		rslt = confirm("매칭 취소하시겠습니까?");
		if(rslt){
			updateMatchStatus(regNo, 'N');
			$("#on" + regNo).hide();
			$("#off" + regNo).show();
			return;
		} else {
			$("#"+item.id).prop("checked", true);  
		}
	} 
} 

//페이지 이동
function fn_movePage(val){
	$("input[name=pageNo]").val(val);
    $("form[name=frm]").attr("method", "get");
    $("form[name=frm]").attr("action", CONTEXT_PATH + "/company/match").submit(); 
}  

function updateMatchStatus(no, flag){
	var param = {
		  regNo: no
		, matchFlag: flag
	};
	
	$.ajax({
		url : CONTEXT_PATH + "/company/match/updateMatchStat", 
		type: "POST",
		data: param,     
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success: function(data){
			console.log("update MatchFlag!");  
			if(data == "success"){
				alert("상태 업데이트 완료!");
				//location.href = CONTEXT_PATH + "/company/mypage"; 
			}  else {
				alert("업데이트 실패"); 
			}
		},   
		error: function(data){   
		   		console.log("error");
		   		console.log(data.errmsg);  
		}
	});   
}
</script>	
</body>
</html>