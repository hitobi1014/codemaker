<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>장학금 관리</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
$(function(){
	findIdShow();
	
	$('#fIBtn').on('click', function(){
		findIdShow();
	});
	
	$('#fPBtn').on('click', function(){
		findPwShow();
	});
	
	// 과목 검색 조건 - 장학금 지급할 내역
	$('#searchSubject').on('change', function(){
		$('#schof').submit();
	});
	
	// 과목 검색 조건 - 장학금 지급한 내역
	$('#searchASubject').on('change', function(){
		$('#schof').submit();
	});
	
})

function findIdShow(){
	$("#last").attr('class','findLi lastCol addLine-b');
	$("#first").attr('class','findLi firstCol addLine');
	$("#fCId").css({
		color : "#007fb2",
		"font-weight" : "bold"
	})
	$("#fCPw").css({
		color : "black",
		"font-weight": "normal"
	})
	$('#inschl').attr('style', 'display: block;');
	$('#outschl').attr('style', 'display: none;');
	$('#searchSubject').attr('style', 'display: block;');
	$('#searchASubject').attr('style', 'display: none;');
}

function findPwShow(){
	$('#inschl').attr('style', 'display: none;');
	$('#outschl').attr('style', 'display: block;');
	$('#searchSubject').attr('style', 'display: none;');
	$('#searchASubject').attr('style', 'display: block;');
	
	$("#first").attr('class','findLi firstCol addLine-b');
	$("#last").attr('class','findLi lastCol addLine');
	$("#fCPw").css({
		color : "#007fb2",
		"font-weight" : "bold"
	})
	$("#fCId").css({
		color : "black",
		"font-weight": "normal"
	})
}
</script>
<style>
.row{
	width: 100%;
    height: 1000px;
    margin-left: -2px;
}
.findLi{
	display: table-cell;
    font-size: 30px;
}
.addLine{
    border-left: solid 3px #005f86;
	border-top: solid 3px #005f86;
    border-right: solid 3px #005f86;
}
.addLine-b{
	border-bottom : solid 3px #005f86;
}
.findAtag{
	display: inline-block;
	width: 100%;
	height: 100%;
}
.firstCol{
	width : 270px;
	height : 40px; 
	float : left;
}
.lastCol{
	width : 270px;
	height :40px; 
	float : right;
}
button:focus{
	outline: none;
}
.table-responsive{
	height: 90%;
}
.thead-light{
	text-align: center;
}
.total{
	color: green;
}
.lsecnt{
	color: blue;
}
.examcnt{
	color: red;
}
.tdc{
	text-align: center;
}
.right{
    margin-top: 50px;
    margin-bottom: 15px;
}
</style>
<body>
<form:form action="/scholarship/selectAllScholarship" id="schof" commandName="scholarshipVO" name="ScholarshipVO" method="post">
	<div class="limiter" style="background-color:#f4f4f4">
		<div class="container-login100" style="padding: 40px;" >
			<div class="row" style="border:1px solid #ededed; padding:20px;background-color:white;">
				<div id="cng" class="div2">
					<ul>
						<li class="findLi firstCol" id="first">
							<button id="fIBtn" class="findAtag" type="button">
								<span id="fCId">장학금 지급</span>
							</button>
						</li>
						<li class="findLi lastCol" id="last">
							<button id="fPBtn" class="findAtag" type="button" >
								<span id="fCPw">장학금 지급 내역</span>
							</button>
						</li>
					</ul>
				</div>
				<div class="right">
					<form:select path="searchSubject" cssClass="form-control" id="searchSubject">
						<form:option value="">과목</form:option>
						<form:options items="${subjectList }" itemLabel="subNm" itemValue="subId"/>
					</form:select>
					
					<form:select path="searchASubject" cssClass="form-control" id="searchASubject">
						<form:option value="">과목</form:option>
						<form:options items="${subjectList }" itemLabel="subNm" itemValue="subId"/>
					</form:select>
				</div>
				<div class="table-responsive" id="inschl">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col" style="width: 10%;">순</th>
								<th scope="col" style="width: 50%;">강의명</th>
								<th scope="col" style="width: 15%;">수강중인<br>회원 수</th>
								<th scope="col" style="width: 10%;">완강한<br>회원 수</th>
								<th scope="col" style="width: 15%;">시험을 완료한<br>회원 수</th>
							</tr>
						</thead>
						<tbody id="lesidx">
							<c:choose>
								<c:when test="${scholarshipList.size() ne 0}">
									<c:forEach items="${scholarshipList}" var="scholarship" varStatus="status">
										<tr data-lesid='${scholarship.lesId }'>
											<td class="tdc">${status.count }</td>
											<td>${scholarship.lesNm }</td>
											<td class="tdc"><a class="total" href="">${scholarship.totalCnt }</a></td>
											<td class="tdc"><a class="lescnt" href="">${scholarship.completeLesCnt }</a></td>
											<td class="tdc"><a class="examcnt" href="">${scholarship.completeExamCnt }</a></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				
				<div class="table-responsive" id="outschl">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th scope="col" style="width: 5%;">순</th>
								<th scope="col" style="width: 50%;">강의명</th>
								<th scope="col" style="width: 10%;">지급일</th>
								<th scope="col" style="width: 10%;">완강<br>지급 수</th>
								<th scope="col" style="width: 10%;">시험<br>지급 수</th>
								<th scope="col" style="width: 15%;">총<br>지급 금액</th>
							</tr>
						</thead>
						<tbody id="lesidx">
							<c:choose>
								<c:when test="${scholarshipAList.size() ne 0}">
									<c:forEach items="${scholarshipAList}" var="scholarship" varStatus="status">
										<tr data-lesid='${scholarship.lesId }'>
											<td>${status.count }</td>
											<td>${scholarship.lesNm }</td>
											<td><fmt:formatDate value="${scholarship.schlDate }" pattern="yyyy-MM-dd" /></td>
											<td>${scholarship.completeLesPay }</td>
											<td>${scholarship.completeExamPay }</td>
											<td>${scholarship.totalPay }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</form:form>
</body>
</html>