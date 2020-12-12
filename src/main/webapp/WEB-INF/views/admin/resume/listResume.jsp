<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
		$('#listResume tr').on('click', function(){
			var resId = $(this).data("resid");
			document.location = "/admin/resume?resId=" + resId;
		})
	})
</script>
</head>
<body>

	<div class="row">

		<div class="col">
			<div class="card shadow">
				<div class="card-header border-0">
					<h2 class="mb-0">이력서 조회</h2>
				</div>
				<div class="table-responsive">
				<table class="table align-items-center table-flush">
					<tr>
						<th>아이디</th>
						<th>승인코드</th>
						<th>이름</th>
						<th>승인상태</th>
						<th></th>
					</tr>
					<tbody id="listResume">
						<c:forEach items="${resumeList }" var="resume">
							<form action="${cp }/admin/resumeList" method="post">
								<tr data-resid=${resume.resId }>
									<td>${resume.resId }</td>
									<td>${resume.resCode }</td>
									<td>${resume.resNm }</td>
									<td>${resume.resState }</td>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>
			</div>
<!-- 			<div class="card-footer py-4"> -->
<!-- 				<nav aria-label="..."> -->
<!-- 					<ul class="pagination justify-content-end mb-0"> -->
<!-- 						<li class="page-item disabled"> -->
<!-- 							<a class="page-link" href="#" tabindex="-1"> -->
<!-- 								<i class="fas fa-angle-left"></i> -->
<!-- 								<span class="sr-only">Previous</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 						<li class="page-item active"> -->
<!-- 							<a class="page-link" href="#">1</a> -->
<!-- 						</li> -->
<!-- 						<li class="page-item"> -->
<!-- 							<a class="page-link" href="#">2 <span class="sr-only">(current)</span></a> -->
<!-- 						</li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 						<li class="page-item"> -->
<!-- 							<a class="page-link" href="#"> -->
<!-- 								<i class="fas fa-angle-right"></i> -->
<!-- 								<span class="sr-only">Next</span> -->
<!-- 							</a> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</nav> -->
<!-- 			</div> card-footer -->
			</div>
		</div>
	</div>
</body>
</html>