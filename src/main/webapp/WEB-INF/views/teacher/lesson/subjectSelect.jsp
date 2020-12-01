<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%@ include file="/WEB-INF/views/user/main/layout/contentLib.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Content Row -->
	<div class="row">
		<c:forEach items="${subjectList}" var="subList">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-6 mb-4">
				<div class="card shadow h-100 py-2">
					<div class="card-body2">
						<div class="row no-gutters align-items-center">
							<div class="col mr-3">
								<br>
								<div class="text-xm font-weight-bold text-primary text-uppercase mb-1">
									${subList.subNm}
								</div>
								<c:forEach items="${lessonList}" var="lesList">
									<c:choose>
										<c:when test="${subList.subId == lesList.subId}">
											<div class="h1 mb-0 font-weight-bold text-gray-900">
												<a id="at" href="${cp}/teacherL/selectLessonPage?lesId=${lesList.lesId}" style="font-size: 0.7em;">${lesList.lesNm}
												</a> <br>
											</div>
										</c:when>
									</c:choose>
									<!-- Content Row -->
									<!-- 			/.container-fluid -->
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<!-- End of Main Content -->
</div>