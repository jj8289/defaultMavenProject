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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
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

.temp1 {
	height: 70px;  
}

.temp2 {
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
 
.reqCon {
 	margin: 0 auto;
 	margin-top: 30px;  
 	width: 1200px;    
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
	/* height: 80px; */ 
} 
.btn {
	border: none;
	background-color: #424242;
	color: white;
	/* width: 100px; */ 
	margin: 0 15px;
	padding: 5px;   
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
 
/*  
.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal.modal-center {
  text-align: center;
}

/* @media screen and (min-width: 768px) {
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
} */
 
.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
} 

.modal-body input {
	/* text-align: center; */ 
}

.match{
	display: flex;
	justify-content: center;
} 

.matchBtn{
	height: 70px; 
	width: 100px; 
} 

p{
	vertical-align: middle;
}

#noBox{
	height: 200px; 
	display: flex; 
	align-items: center; 
	justify-content: center;
}

/* modal */
.modal-header{
	padding:0.7rem;
}
.modal-body{
	padding:0.7rem;
}

.form-control{
	padding: .150rem 0.30rem;
}

.col-form-label{
	padding-bottom: 0px; 
} 

.col-8.col-sm-2{
	padding-right: 0px;  
}

.workPtDetail{
	 display: flex;
	 justify-content: space-around;  
     margin-right: -5px;
     margin-left: -24px;
}

</style>         
</head>    
<body>   
	<div id="container">  
		<form name="frm">    
			<!-- //페이지 번호 -->
            <input type="hidden" name="pageNo" />
            <input type="hidden" name="rowCount" />
			<div class="temp1"></div>
			<h2 class="title">매치</h2>      
			<div class="temp1"></div> 
			<div class="match"> 
				<p class="but"><input type="button" id="matchBtn" onclick="listMatching()" value="리스트 매칭" class="btn matchBtn"></p>
				<p class="but"><input type="button" id="matchBtn2" onclick="oneToOneMatching()" value="1:1 매칭" class="btn matchBtn"></p> 
			</div>      
			<div class="temp2"></div>  
			<div id="noBox" >    
				<c:if test="${empty matchList }">    
					<div style="text-align:center;">
						<p>매칭 진행 중이 아닙니다.</p>
					</div>      
				</c:if>   
			</div>     
			<!-- <h3 class="subtitle">매칭 상태</h3>    
			<div style="margin: 0 auto;">   
				<table> 
					<tr style="height: 50px">       
						<td id="switch_td" style="padding: 5px; text-align: center;"> 
							<p id="off">OFF</p>       
							<label class="switch" style="text-align: center;"> 
							    <input type="checkbox" id="switchBtn" onclick="toggle(this)"> 
							    <span class="slider round"></span>
							</label> 
							<p id="on">ON</p>  
						</td>       
					</tr>      
				</table>     
			</div> -->
			<div style="height: 40px"></div>    
			<div class="reqCon"> 
				<h5 style="text-align: center; padding-bottom: 10px">매칭 리스트  [ 총 개수 : ${pageVO.rowCount } ]</h5> 
				<div class="temp"></div> 
				<table id="listTable">
				<c:if test="${not empty matchList }">  
					<%-- <caption style="height: 50px;">매칭 결과 리스트  [ 총 개수 : ${pageVO.rowCount } ]</caption>  --%>
					<colgroup>           
						<col style="width: 50px">
						<col style="width: 160px">     
						<col style="width: 130px">
						<col style="width: 200px">
						<col style="width: 130px"> 
						<col style="width: 130px">
						<col style="width: 130px">
						<col style="width: 80px">  
						<col style="width: 80px">  
						<col style="width: 80px">       
					</colgroup>   
					<thead>            
						<tr style="text-align: center;"> 
							<th scope="col">No</th>
							<th scope="col">병원명</th>
							<th scope="col">직종</th>
							<th scope="col">업무</th>
							<th scope="col">근무(시작)일</th> 
							<th scope="col">근무 시간</th>
							<th scope="col">시급/일급</th>
							<th scope="col">성별</th> 
							<th scope="col">나이</th>
							<th scope="col">경력</th>
						</tr>
					</thead>
					<tbody id="listBody"> 
						<c:forEach items="${matchList }" var="match">
							<tr style="height: 40px;">  
								<td id="rno${match.rno }">
									<c:out value="${match.rno }" />
									<input type="hidden" id="etc${match.rno }"  value="${match.etc }">
									<input type="hidden" id="addr${match.rno }"  value="${match.compAddr }">
									<input type="hidden" id="peer${match.rno }"  value="${match.peerCnt }">
									<input type="hidden" id="avgCnt${match.rno }"  value="${match.avgCnt }">
									<input type="hidden" id="dow${match.rno }"  value="${match.workDow }">
									<input type="hidden" id="workPt${match.rno }"  value="${match.workPtList }">
									<input type="hidden" id="detailWorkPt${match.rno }"  value="${match.detailWorkPt }">
									<input type="hidden" id="detailWork${match.rno }"  value="${match.detailWork }"> 
									<input type="hidden" id="lunchStTime${match.rno }"  value="${match.lunchStTime }"> 
									<input type="hidden" id="lunchEnTime${match.rno }"  value="${match.lunchEnTime }">
								</td>
								<td id="companyNm${match.rno }"> 
									<%-- <c:out value="${match.companyNm }" /> --%>
									${match.companyNm } 
								</td> 
								<td id="jobNm${match.rno }"> 
									<%-- <c:out value="${jobNm }" />(<c:out value="${match.workFlag }" />) --%>
									${jobNm } 
								</td>
								<c:if test="${match.compJobNo == '1'}"><!-- PT일 때 -->
									<td>   
										<c:set var="sep" value=","/>
										<c:set var="i" value="0" />
										<c:forEach items="${match.workPtList }" var="workPt">
											<c:if test="${i != 0 }">${sep }&nbsp;</c:if><c:out value="${workPt }" />
											<c:set var="i" value="${i+1 }" />     
										</c:forEach> 
									</td>   
								</c:if> 
								<c:if test="${match.compJobNo != '1'}">
									<td id="work${match.rno }">   
										<c:out value="${match.work }" />
									</td> 
								</c:if>  
								<td id="workDate${match.rno }"> 
									<c:if test="${match.workDate != '' }"><c:out value="${match.workDate }" /></c:if>
									<c:if test="${match.workStart != '' }"><c:out value="${match.workStart }" /></c:if>
								</td>  
								<td id="workTime${match.rno }">
									<c:out value="${match.workStTime }" /> ~ <c:out value="${match.workEnTime }" />
								</td>
								<td id="workSal${match.rno }"> 
									<%-- <c:if test="${match.calSalaryHour != '0' }"><c:out value="${match.calSalaryHour }" />/hour</c:if>
									<c:if test="${match.calSalaryDay != '0' }"><c:out value="${match.calSalaryDay }" />/day</c:if> --%>
									<c:if test="${match.reqSalHour != ''}">
										<c:if test="${match.regSalHour == '' }">
											<c:out value="${match.calSalaryHour }" />원/h
										</c:if>
										<c:if test="${match.regSalHour != '' }">
											<c:out value="${match.regSalHour }" />원/h
										</c:if> 
									</c:if>  
									<c:if test="${match.reqSalDay != ''}">
										<c:if test="${match.regSalDay == '' }">
											<c:out value="${match.calSalaryDay }" />원/일
										</c:if>
										<c:if test="${match.regSalDay != '' }">
											<c:out value="${match.regSalDay }" />원/일
										</c:if>
									</c:if>  
								</td>  
								<td id="sex${match.rno }">
									<c:if test="${match.sex == 'F' }">여자</c:if>
									<c:if test="${match.sex == 'M' }">남자</c:if> 
									<c:if test="${match.sex == '' }">성별 무관</c:if>
								</td> 
								<td id="age${match.rno }">
									<c:if test="${match.age != '' and match.age != ' '}"><c:out value="${match.age }" />대</c:if>
									<c:if test="${match.age == '' or match.age == ' '}">나이 무관</c:if>
								</td>  
								<td id="career${match.rno }">
									<c:if test="${match.career != '' and match.career != ' '}"><c:out value="${match.career }" />년 이상</c:if>
									<c:if test="${match.career == '' or match.career == ' '}">경력 무관</c:if>
								</td>
								<c:if test="${match.compJobNo == '1' }">
									<td>
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#matchModalPT" data-compNm="${match.companyNm }" data-rno="${match.rno }">정보보기
									</td>
								</c:if> 
								<c:if test="${match.compJobNo != '1' }">
									<td>
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#matchModal" data-compNm="${match.companyNm }" data-rno="${match.rno }">정보보기
									</td>   
								</c:if>  
								<td><input type="button" value="거절" onclick="goHome()"></td>     
							</tr>  
						</c:forEach>   
						</c:if> 
						<c:if test="${empty matchList }">
							<div style="display:flex; justify-content:center; align-items: center; text-align: center; height: 120px;"><div><p>현재 매칭 조건에 일치하는 병원이 없습니다.</p></div></div>
						</c:if>     
					</tbody>    
				</table>
			</div>  
			<div class="page-navi">
			<c:if test="${not empty matchList}"> 
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


	<!-- modal(PT) -->
	<div class="modal modal-center fade" id="matchModalPT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">     
			<div class="modal-content">   
				<div class="modal-header"> 
					<h5 class="modal-title" id="myModalLabel">Modal title</h5> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
				</div>  
				<div class="modal-body">  
					<div class="row">
						<div class="col-8 col-sm-6">
							<label for="modal-company" class="col-form-label">Company:</label>
            				<input type="text" class="form-control" id="modal-company" readonly="readonly">
						</div>
						<div class="col-8 col-sm-6">
							<label for="modal-job" class="col-form-label">job:</label>
            				<input type="text" class="form-control" id="modal-job" readonly="readonly">
						</div>
					</div> 
					<label for="modal-addr" class="col-form-label">addr:</label>
            		<input type="text" class="form-control" id="modal-addr" readonly="readonly"> 
            		<div class="row"> 
            			<div class="col-8 col-sm-4">
            				<label for="modal-date" class="col-form-label">date:</label>
            				<input type="text" class="form-control" id="modal-date" readonly="readonly">
            			</div>
            			<div class="col-8 col-sm-4">
            				<label for="modal-time" class="col-form-label">time:</label>
            				<input type="text" class="form-control" id="modal-time" readonly="readonly">
            			</div> 
            			<div class="col-8 col-sm-4">
            				<label for="modal-sal" class="col-form-label">sal:</label> 
            				<input type="text" class="form-control" id="modal-sal" readonly="readonly"> 
            			</div>
            		</div>
            		<div class="row">
            			<div class="col-8 col-sm-4">
            				<label for="modal-sex" class="col-form-label">sex:</label>
            				<input type="text" class="form-control" id="modal-sex" readonly="readonly"> 
            			</div>
            			<div class="col-8 col-sm-4">
            				<label for="modal-age" class="col-form-label">age:</label>
            				<input type="text" class="form-control" id="modal-age" readonly="readonly"> 
            			</div> 
            			<div class="col-8 col-sm-4">
            				<label for="modal-career" class="col-form-label">career:</label>
            				<input type="text" class="form-control" id="modal-career" readonly="readonly"> 
            			</div>  
            		</div>  
            		<div class="row">
						<div class="col-8 col-sm-4">
							<label for="modal-peer" class="col-form-label">PeerCnt:</label>
            				<input type="text" class="form-control" id="modal-peer" readonly="readonly"> 
						</div>
						<div class="col-8 col-sm-4">
							<label for="modal-patient" class="col-form-label">patientCnt:</label>
            				<input type="text" class="form-control" id="modal-patient" readonly="readonly"> 
						</div> 
					</div> 
					 
					<label for="modal-workPt" class="col-form-label">workPt:</label>
            		<input type="text" class="form-control" id="modal-workPt" readonly="readonly">
            		
            		<div class="row workPtDetail">
						<div class="col-8 col-sm-2">
							<label for="modal-micro" class="col-form-label">초음파:</label>
            				<input type="text" class="form-control" id="modal-micro" readonly="readonly"> 
						</div>
						<div class="col-8 col-sm-2">
							<label for="modal-eswt" class="col-form-label">ESWT:</label>
            				<input type="text" class="form-control" id="modal-eswt" readonly="readonly"> 
						</div>
						<div class="col-8 col-sm-2">
							<label for="modal-knee" class="col-form-label">CPM(knee):</label>
            				<input type="text" class="form-control" id="modal-knee" readonly="readonly"> 
						</div>
						<div class="col-8 col-sm-2">
							<label for="modal-sh" class="col-form-label">CPM(sh):</label>
            				<input type="text" class="form-control" id="modal-sh" readonly="readonly"> 
						</div> 
						<div class="col-8 col-sm-2"> 
							<label for="modal-ion" class="col-form-label">이온치료:</label>
            				<input type="text" class="form-control" id="modal-ion" readonly="readonly"> 
						</div>
					</div>  
					<div class="row">
						<div class="col-8 col-sm-6">
							<label for="modal-detailWork" class="col-form-label">업무 상세:</label>
		            		<!-- <input type="text" class="form-control" id="modal-etc" readonly="readonly">  -->
		            		<textarea class="form-control" id="modal-detailWork" rows="5" cols="50" style="margin: 0px; width: 370px; height: 80px;" readonly="readonly"></textarea>
						</div>
						<div class="col-8 col-sm-6">
							<label for="modal-etc" class="col-form-label">복지 및 기타:</label>
		            		<!-- <input type="text" class="form-control" id="modal-etc" readonly="readonly">  -->
		            		<textarea class="form-control" id="modal-etc" rows="5" cols="50" style="margin: 0px; width: 370px; height: 80px;" readonly="readonly"></textarea>
						</div> 
					</div> 
				</div>  
				<div class="modal-footer"> 
					<button data-dismiss="modal" class="remodal-close" aria-label="Close" title="닫기">close</button>
					<button type="button" class="btn btn-primary">save</button>   
				</div> 
			</div>	 
		</div>
	</div>
	
	<!-- modal -->
	<div class="modal modal-center fade" id="matchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">    
			<div class="modal-content">   
				<div class="modal-header"> 
					<h5 class="modal-title" id="myModalLabel">Modal title</h5> 
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
				</div>  
				<div class="modal-body"> 
					<div class="row">
						<div class="col-8 col-sm-6">
							<label for="modal-company2" class="col-form-label">Company:</label>
            				<input type="text" class="form-control" id="modal-company2" readonly="readonly">
						</div>
						<div class="col-8 col-sm-6">
							<label for="modal-job2" class="col-form-label">job:</label>
            				<input type="text" class="form-control" id="modal-job2" readonly="readonly">
						</div>
					</div> 
					<label for="modal-addr2" class="col-form-label">addr:</label>
            		<input type="text" class="form-control" id="modal-addr2" readonly="readonly"> 
            		<div class="row"> 
            			<div class="col-8 col-sm-4">
            				<label for="modal-date2" class="col-form-label">date:</label>
            				<input type="text" class="form-control" id="modal-date2" readonly="readonly">
            			</div>
            			<div class="col-8 col-sm-4">
            				<label for="modal-time2" class="col-form-label">time:</label>
            				<input type="text" class="form-control" id="modal-time2" readonly="readonly">
            			</div> 
            			<div class="col-8 col-sm-4">
            				<label for="modal-lunchTime2" class="col-form-label">lunch:</label>
            				<input type="text" class="form-control" id="modal-lunchTime2" readonly="readonly">
            			</div> 
            		</div>
            		<div class="row">
            			<div class="col-8 col-sm-4">
            				<label for="modal-sex2" class="col-form-label">sex:</label>
            				<input type="text" class="form-control" id="modal-sex2" readonly="readonly"> 
            			</div>
            			<div class="col-8 col-sm-4">
            				<label for="modal-age2" class="col-form-label">age:</label>
            				<input type="text" class="form-control" id="modal-age2" readonly="readonly"> 
            			</div> 
            			<div class="col-8 col-sm-4">
            				<label for="modal-career2" class="col-form-label">career:</label>
            				<input type="text" class="form-control" id="modal-career2" readonly="readonly"> 
            			</div>  
            		</div>  
            		<div class="row">
						<div class="col-8 col-sm-4">
							<label for="modal-peer2" class="col-form-label">PeerCnt:</label>
            				<input type="text" class="form-control" id="modal-peer2" readonly="readonly"> 
						</div>
						<div class="col-8 col-sm-4">
							<label for="modal-patient2" class="col-form-label">patientCnt:</label>
            				<input type="text" class="form-control" id="modal-patient2" readonly="readonly"> 
						</div> 
						<div class="col-8 col-sm-4">
            				<label for="modal-sal2" class="col-form-label">sal:</label> 
            				<input type="text" class="form-control" id="modal-sal2" readonly="readonly"> 
            			</div>
					</div> 
					
					<label for="modal-work" class="col-form-label">work:</label>
            		<input type="text" class="form-control" id="modal-work" readonly="readonly">
            		<div class="row">
						<div class="col-8 col-sm-6">
							<label for="modal-detailWork2" class="col-form-label">업무 상세:</label>
		            		<!-- <input type="text" class="form-control" id="modal-etc" readonly="readonly">  -->
		            		<textarea class="form-control" id="modal-detailWork2" rows="5" cols="50" style="margin: 0px; width: 220px; height: 80px;" readonly="readonly"></textarea>
						</div>
						<div class="col-8 col-sm-6">
							<label for="modal-etc2" class="col-form-label">복지 및 기타:</label>
		            		<!-- <input type="text" class="form-control" id="modal-etc" readonly="readonly">  -->
		            		<textarea class="form-control" id="modal-etc2" rows="5" cols="50" style="margin: 0px; width: 220px; height: 80px;" readonly="readonly"></textarea>
						</div>   
					</div> 
				</div>  
				<div class="modal-footer"> 
					<button data-dismiss="modal" class="remodal-close" aria-label="Close" title="닫기">close</button>
					<button type="button" class="btn btn-primary">save</button>   
				</div> 
			</div>	 
		</div>
	</div> 
	
<script type="text/javascript">
var pageVO = "${pageVO}";
var curPage = ${pageVO.pageNo};
var rowCnt = ${pageVO.rowCount}; 
var matchList = "${matchList}";
var user = "${user}";
var userNo = ${user.userNo};
var stat = "${user.matchStatus}"; 
var param = {};  
//var workPtList = "${matchList[0].workPtList}";
/* console.log(pageVO);  
console.log(curPage);  
console.log(rowCnt);   
console.log(matchList);  */
console.log(userNo);  
console.log(stat);

$("#on").hide();
$("#off").hide();

$(document).ready(function(){
	if(stat == "L"){
		//$("#noBox").style.height = "0px"; 
		$("#noBox").css('height', '0px'); 
		$("#noBox").hide();  
		$(".reqCon").show();  
		$(".page-navi").show();
		$(".temp2").hide();
	} else {  
		$(".reqCon").hide(); 
		$(".page-navi").hide(); 
		$(".temp2").show(); 
		//$("#noBox").style.height = "200px";
		$("#noBox").css('height', '200px');
	}
});     
  

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
 
//페이지 이동
function fn_movePage(val){
	$("input[name=pageNo]").val(val);
	$("input[name=rowCount]").val(rowCnt);  
    $("form[name=frm]").attr("method", "get");
    $("form[name=frm]").attr("action", CONTEXT_PATH + "/user/match").submit(); 
}  

$('document').ready(function() { 
	$modal = $(".modal");
	
	$(".modal--open").click(function(){
		$modal.show();
		return false;
	});
	$(".modal--close").click(function(){
		$modal.hide();
	});
});


$('#matchModalPT').on('show.bs.modal', function (event) {  
	  var button = $(event.relatedTarget); // Button that triggered the modal
	  var rno = button.data('rno');
	  
	  var detailWorkList = [];
	  detailWorkList = $("#detailWorkPt"+rno).val().split("/");
	  
	  var workPt = $("#workPt"+rno).val()
	  console.log(workPt);
		  
	  var modal = $(this); 
	  
	  modal.find('.modal-title').text("상세 채용 정보 [" + $("#companyNm"+rno).text().trim() + "]"); 
	  modal.find('#modal-company').val($("#companyNm"+rno).text().trim());    
	  modal.find('#modal-job').val($("#jobNm"+rno).text().trim());   
	  modal.find('#modal-date').val($("#workDate"+rno).text().trim()); 
	  modal.find('#modal-time').val($("#workTime"+rno).text().trim());   
	  modal.find('#modal-sal').val($("#workSal"+rno).text().trim());   
	  modal.find('#modal-sex').val($("#sex"+rno).text().trim());   
	  modal.find('#modal-age').val($("#age"+rno).text().trim());   
	  modal.find('#modal-career').val($("#career"+rno).text().trim());      
	  modal.find('#modal-peer').val($("#peer"+rno).val() + "명"); 
	  modal.find('#modal-patient').val($("#avgCnt"+rno).val() + "명"); 
	  modal.find('#modal-workPt').val($("#workPt"+rno).val().slice(1,$("#workPt"+rno).val().length-1));
	  modal.find('#modal-micro').val(detailWorkList[0] == 'N' ? "X" : "O");
	  modal.find('#modal-eswt').val(detailWorkList[1] == 'N' ? "X" : "O");
	  modal.find('#modal-knee').val(detailWorkList[2] == 'N' ? "X" : "O");
	  modal.find('#modal-sh').val(detailWorkList[3] == 'N' ? "X" : "O");
	  modal.find('#modal-ion').val(detailWorkList[4] == 'N' ? "X" : "O"); 
	  modal.find('#modal-detailWork').val($("#detailWork"+rno).val().replace(/<br\>/g, '\n'));        
	  modal.find('#modal-etc').val($("#etc"+rno).val().replace(/<br\>/g, '\n'));       
	  modal.find('#modal-addr').val($("#addr"+rno).val());
	  modal.find('#modal-lunchTime').val($("#lunchStTime"+rno).val() + "~" + $("#lunchEnTime"+rno).val());  
}); 

$('#matchModal').on('show.bs.modal', function (event) {  
	  var button = $(event.relatedTarget); // Button that triggered the modal
	  var rno = button.data('rno'); 
	  
	  var etc = $("#etc"+rno).val().replace(/<br\>/g, '\n');
	 // var avgCnt = $("#avgCnt").	
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this); 
	  modal.find('.modal-title').text("상세 채용 정보 [" + $("#companyNm"+rno).text().trim() + "]"); 
	  modal.find('#modal-company2').val($("#companyNm"+rno).text().trim());    
	  modal.find('#modal-job2').val($("#jobNm"+rno).text().trim());   
	  modal.find('#modal-date2').val($("#workDate"+rno).text().trim()); 
	  modal.find('#modal-time2').val($("#workTime"+rno).text().trim());   
	  modal.find('#modal-sal2').val($("#workSal"+rno).text().trim());   
	  modal.find('#modal-sex2').val($("#sex"+rno).text().trim());   
	  modal.find('#modal-age2').val($("#age"+rno).text().trim());   
	  modal.find('#modal-career2').val($("#career"+rno).text().trim());      
	  modal.find('#modal-peer2').val($("#peer"+rno).val() + "명"); 
	  modal.find('#modal-patient2').val($("#avgCnt"+rno).val() + "명");  
	  modal.find('#modal-work').val($("#work"+rno).text().trim());  
	  modal.find('#modal-detailWork2').val($("#detailWork"+rno).val().replace(/<br\>/g, '\n')); 
	  modal.find('#modal-etc2').val(etc);        
	  modal.find('#modal-addr2').val($("#addr"+rno).val());     
	  modal.find('#modal-lunchTime2').val($("#lunchStTime"+rno).val() + " ~ " + $("#lunchEnTime"+rno).val()); 
}); 

function listMatching(){
	stat = "L";
	updateStat();
}

function oneToOneMatching(){
	stat = "O"; 
	updateStat();
}
 
function updateStat(){
	param = {
		  userNo: userNo
		, matchStatus: stat	
	};
	
	$.ajax({
		url : CONTEXT_PATH + "/user/match/updateMatchStat", 
		type: "POST",
		data: param,     
		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
		success: function(data){
			console.log("update MatchFlag!");  
			if(data == "success"){
				alert("상태 업데이트 완료!");location.reload();
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
<script src="https://code.jquery.com/jquery-3.4.1.js" type="text/javascript"></script>	
</body>
</html>