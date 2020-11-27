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
			<h2 class="title">매치</h2>   
			<div class="temp"></div>    
			<p class="but"><input type="button" id="matchBtn" onclick="#" value="매칭" class="btn" style="height: 100px;"></p>
			<div class="temp"></div>    
			<h3 class="subtitle">매칭 상태</h3>    
			<div style="margin: 0 auto;">   
				<table> 
					<tr style="height: 50px">      
						<td id="switch_td" style="padding-left: 13px; text-align: center;">
							<p id="off">OFF</p>       
							<label class="switch" style="text-align: center;"> 
							    <input type="checkbox" id="switchBtn" onclick="toggle(this)"> 
							    <span class="slider round"></span>
							</label> 
							<p id="on">ON</p>  
						</td>       
					</tr>      
				</table>     
			</div>
			<div style="height: 30px"></div>    
			<div class="regCon">
				<table id="listTable">
					<caption style="height: 50px;">매칭 결과 리스트  [ 총 개수 : ${pageVO.rowCount } ]</caption> 
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
$("#on").hide();
$("#off").hide();

function toggle(item) {
	if(item.checked == true){
		//matchStat = 'Y';
		$("#on").show();
		$("#off").hide();
	} else {
		//matchStat = 'N';
		$("#on").hide();
		$("#off").show(); 
	} 
} 
</script>	
</body>
</html>