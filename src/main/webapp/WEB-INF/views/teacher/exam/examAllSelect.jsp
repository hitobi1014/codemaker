<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 시험 내역 page css -->
<link href="/css/teacher/exam/exam-AllSelect.css" rel="stylesheet"/>

<script>
$(function() {
	
	// 처음 요청했을 화면
    $('#subf').attr("action", "/exam/selectAllExam");
    $('#subf').attr("target", "");
	selectLesson('${examVO.searchSubId}');
	
	// 시험 등록 폼 제공
	$('.regBtn').on('click', function(){
		// data-lesinfo="${exam.lesId }/${exam.lidxId}/${exam.lidxCont }"
		var lesId = $(this).data('lesinfo').split("/")[0];
		var lidxId = $(this).data('lesinfo').split("/")[1];
		var lidxCont = $(this).data('lesinfo').split("/")[2] + '_테스트';
		
		
		str = '<input type="hidden" name="lesId" value="'+ lesId +'">';
		str += '<input type="hidden" name="lidxId" value="'+ lidxId +'">';
		str += '<input type="hidden" name="examNm" value="'+ lidxCont +'">';
		
		$('#subf').append(str);
        window.open('', "examInsert", 'width=1100,height=1100,resizable=no,scrollbars=yes,left=500,top=50') ;
         
        $('#subf').attr("action", "/exam/insertExamView");
        $('#subf').attr("target", "examInsert");
        $('#subf').submit();
	});

	// 강의 조회 - 과목을 변경했을 경우에 조회
	$('#subject').on('change', function(){
		selectLesson($(this).val());
	});
	
	// 시험 조회
	$(document).on('change','#lesson', function(){
		$('#subf').submit();
	});
	
	// 조건에 따라 조회 - 등록상태
	$('#search').on('change', function(){
		$('#subf').submit();
	});
	
	// 시험 상세페이지 이동 data-exam_id
	$(document).on('click', '#examList tr td', function(){
		var searchLesId = $('#lesson').val();
		var searchSubId = $('#subject').val();
		var searchExamState = $('#search').val();
		
		if ($(this).attr('class') == 'm') {
			var examId = $(this).parent('tr').data("examid");
			
			if(examId != ''){
				var str = '<input type="hidden" name="examId" value="'+ examId +'">';
				$('#subf').append(str);
				
				$('#subf').attr('action', '/exam/selectExam');
				$('#subf').submit();
			}
		}
	});
	
	// 페이징 처리 data-page
	$('.pageMV').on('click', function(){
		var page = $(this).data('page');
		str = '<input type="hidden" name="page" value="' + page + '">';
		$('#subf').append(str);
		
		$('#subf').submit();
	})
	
	
});

// 강의 조회 함수
var selectLesson = function(subId){
	$.ajax({
		url : '/exam/selectAllLesson',
		method : 'post',
		data : {
			subId : subId
		},
		success : function(res){
			str = '<select name="searchLesId" class="form-control" id="lesson">';
			str += '<option value="">강의</option>';
			
			console.log(res.lessonList);
			console.log(res.lessonList.length);
			
// 			if(res.lessonList.length != 0){
				$.each(res.lessonList, function(index, data){
					if(data.lesId == '${examVO.searchLesId}'){
						str += '<option selected="selected" value="'+ data.lesId +'">'+ data.lesNm +'</option>';
					}else{
						str += '<option value="'+ data.lesId +'">'+ data.Nm +'</option>';
					}
				})
// 			}
			str += '</select>';
			
			$('#les').html(str);
		},
		error: function(xhr){
			alert("상태"+xhr.status);
		}
	});
}

</script>
<title>examAllSelect</title>


</head>
<body>
<div class="card shadow exam-box">
	<div class="exam-box-item">
		<h3 id="hd">시험 내역</h3>
		<div class="exam-item-cont">
			<form:form name="examVO" commandName="examVO" id="subf" action="/exam/selectAllExam" method="post">
				<div id="right">
						<form:select path="searchSubId" cssClass="form-control" id="subject">
							<form:option value="">과목</form:option>
							<form:options items="${subjectList }" itemLabel="subNm" itemValue="subId"/>
						</form:select>
						
						<div id="les"></div>
					
						<form:select path="searchExamState" cssClass="form-control" id="search">
							<form:option value="">등록 상태</form:option>
							<form:option value="0">시험 등록</form:option>
							<form:option value="1">수정중</form:option>
							<form:option value="2">등록완료</form:option>
							<form:option value="3">시험 배포</form:option>
							<form:option value="4">반려</form:option>
						</form:select>
				</div>
				
				<table class="exam-tb" id="wul">
					<thead id ="tthe">
						<tr>
							<th style="vertical-align : text-bottom; width: 70px;">순</th>
							<th style="vertical-align : text-bottom; width: 450px;">강의 목차명</th>
							<th style="vertical-align : text-bottom; width: 500px;">시험명</th>
							<th style="vertical-align : text-bottom; width: 220px;">작성일</th>
							<th style="vertical-align : text-bottom; width: 220px;">등록 상태</th>
						</tr>
					</thead>
					<tbody id="examList">
						<!-- 시험 문제 리스트 -->
						<c:if test="${examList.size() == 0}">
							<tr>
								<td colspan="6" style="text-align: center;">조회한 데이터가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach items="${examList}" var="exam" varStatus="status">
							<tr data-examid='${exam.examId }'>
								<!-- 시험 문제를 볼때 -->
								<td class='m'>${status.count }</td>
								<td class='m'>${exam.lidxCont }</td>
								<td class='m'>
									<c:choose>
										<c:when test="${exam.examNm != null }">
											${exam.examNm }
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td class='m'>
									<c:choose>
										<c:when test="${exam.examDate != null }">
											<fmt:formatDate value="${exam.examDate }" pattern="yyyy-MM-dd" />
										</c:when>
										<c:otherwise>
											-
										</c:otherwise>
									</c:choose>
								</td>
								<td data-examstate='${exam.examState }' class='m'>
									<c:choose>
										<c:when test="${exam.examState == '4' }">
											시험반려
										</c:when>
										<c:when test="${exam.examState == '3' }">
											배포완료
										</c:when>
										<c:when test="${exam.examState == '2' }">
											등록완료
										</c:when>
										<c:when test="${exam.examState == '1' }">
											수정중
										</c:when>
										<c:otherwise>
											<input type="button" class="btn btn-default regBtn" data-lesinfo="${exam.lesId }/${exam.lidxId}/${exam.lidxCont }" value="시험 등록"> 
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이징 처리 -->
				<div class="py-4">
					<c:if test="${examList.size() ne 0 }">
						<ul class="pagination justify-content-end mb-0">
							<!-- 첫페이지가 아닐때 -->
							<c:if test="${examVO.page ne 1 }">
								<!-- 첫페이지로 가기 -->
								<li class="page-item active">
									<input type="button" class="page-link pageMove pageMV" value="&laquo;" data-page="1">
								</li>
								<!-- 이전 페이지로 가기 -->
								<li class="page-item active">
									<input type="button" class="page-link pageMove pageMV" value="&lt;" data-page="${examVO.page-1 }">
								</li>
							</c:if>
			
							<c:forEach begin="1" end="${pages }" var="i">
								<!-- 현재 있는 페이지와 구분 -->
								<c:choose>
									<c:when test="${i == examVO.page }">
										<!-- 보고 있는 페이지와 현재 선택된 페이지가 같을 때 -->
										<li class="page-item active"><span class="page-link"><strong>${i }</strong></span></li>
									</c:when>
									<c:otherwise>
										<li class="page-item active">
											<input type="button" class="page-link pageMove pageMV" value="${i}" data-page="${i}">
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
			
							<!-- 마지막페이지가 아닐때 -->
							<c:if test="${examVO.page ne pages }">
								<!-- 다음 페이지로 이동 -->
								<li class="page-item active">
									<input type="button" class="page-link pageMove pageMV" value="&gt;" data-page="${examVO.page+1 }">
								</li>
								<!-- 마지막 페이지로 이동 -->
								<li class="page-item active">
									<input type="button" class="page-link pageMove pageMV" value="&raquo;" data-page="${pages }">
								</li>
							</c:if>
			
						</ul>
					</c:if>
				</div>
			</form:form>
		</div>
	</div>
</div>
</body>
</html>