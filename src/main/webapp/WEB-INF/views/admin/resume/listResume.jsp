<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.textColor{
		color: black;
	}

	#selectState{
		position: relative;
		left: 1300px;
		width: 200px;
		border: 1px solid #999;
		z-index: 1;
	}
</style>
<script>
	$(document).ready(function(){
		$('#listResume tr').on('click', function(){
			var resId = $(this).data("resid");
			var resState = $(this).data("resstate");
			document.location = "/admin/resume?resId="+resId+"&resState="+resState;
		});

		$('#selectState').on('change', function(){
			$('#hiddenState').val($('#selectState').val());
			$('#resumeForm').submit();
		});
	});
</script>
</head>
<body>

	<div class="row">

		<div class="col">
			<div class="card shadow">
				<div class="card-header border-0">
					<div>
						<select id="selectState" name="selectState" style="height: 28px;">
							<option value=""
								<c:if test="${resState eq ''}">selected="selected"</c:if>>전체</option>
							<option value="Y"
								<c:if test="${resState eq 'Y'}">selected="selected"</c:if>>승인완료</option>
							<option value="B"
								<c:if test="${resState eq 'B'}">selected="selected"</c:if>>승인대기</option>
							<option value="N"
								<c:if test="${resState eq 'N'}">selected="selected"</c:if>>미승인</option>
						</select>
					</div>
					<h1 class="mb-0">이력서 조회</h1>
				</div>
				<div class="table-responsive">
					<table class="table align-items-center table-flush">
						<tr>
							<th>아이디</th>
							<th>승인코드</th>
							<th>이름</th>
							<th>승인상태</th>
						</tr>
						<tbody id="listResume">
							<c:forEach items="${resumeList }" var="resume">
								<c:url value="/admin/resumeList" var="resumeList"/>
								<form action="${resumeList }" method="post" id="resumeForm">
									<tr data-resid="${resume.resId}" data-resstate="${resume.resState}"  style="cursor:pointer;">
										<td><a class="textColor">${resume.resId }</a></td>
										<td><a class="textColor">${resume.resCode }</a></td>
										<td><a class="textColor">${resume.resNm }</a></td>
										<c:choose>
											<c:when test="${resume.resState == 'Y'}">
												<td><a style="color: #3A913F;" id="stateName">승인완료</a></td>
											</c:when>
											<c:when test="${resume.resState == 'N'}">
												<td><a style="color: #EF3340;" id="stateName">미승인</a></td>
											</c:when>
											<c:when test="${resume.resState == null}">
												<td><a style="color: #505759;" id="stateName">승인대기</a></td>
											</c:when>
										</c:choose>
									</tr>
									<input type="hidden" id="hiddenState" name="resState">
								</form>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!--          <div class="card-footer py-4"> -->
				<!--             <nav aria-label="..."> -->
				<!--                <ul class="pagination justify-content-end mb-0"> -->
				<!--                   <li class="page-item disabled"> -->
				<!--                      <a class="page-link" href="#" tabindex="-1"> -->
				<!--                         <i class="fas fa-angle-left"></i> -->
				<!--                         <span class="sr-only">Previous</span> -->
				<!--                      </a> -->
				<!--                   </li> -->
				<!--                   <li class="page-item active"> -->
				<!--                      <a class="page-link" href="#">1</a> -->
				<!--                   </li> -->
				<!--                   <li class="page-item"> -->
				<!--                      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a> -->
				<!--                   </li> -->
				<!--                   <li class="page-item"><a class="page-link" href="#">3</a></li> -->
				<!--                   <li class="page-item"> -->
				<!--                      <a class="page-link" href="#"> -->
				<!--                         <i class="fas fa-angle-right"></i> -->
				<!--                         <span class="sr-only">Next</span> -->
				<!--                      </a> -->
				<!--                   </li> -->
				<!--                </ul> -->
				<!--             </nav> -->
				<!--          </div> card-footer -->
			</div>
		</div>
	</div>
</body>
</html>