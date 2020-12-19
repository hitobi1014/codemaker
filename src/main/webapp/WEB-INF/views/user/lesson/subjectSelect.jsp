<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<link href="/css/home_css.css" rel="stylesheet" type="text/css"> 
<%@ include file="/WEB-INF/views/user/main/layout/contentLib.jsp"%>


<style>
.card-body2 #cardDiv{height: 400px;}

.CourseCard__graphicHeader {
    height: 4.0rem;
    z-index: 0;
    position: relative;
    padding: .8rem 1rem 2.9rem;
    text-align: right;
    background: linear-gradient(50deg, #d8f0f6, #4e6ad1f7);
    margin-top: -10px;
    border-radius: 0px 70px 70px 0px;
    
}
.at{
	color: black;
	font-size: 0.7em;
}
/* .CourseCard__graphicHeader #cardDiv{background: linear-gradient:(45deg, #f6d8f6, #d14e97f7);} */

</style>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Content Row -->
	<div class="row" style="margin-top: 100px;">
		<c:forEach items="${subjectList}" var="subList">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-4 col-md-6 mb-4">
				<div class="card shadow h-100 py-2" style="border-radius: 0px 30px 0px 0px;">
					<div class="CourseCard__graphicHeader"  id="cardDiv">
					</div>
					<div class="card-body2" style="height: 300px;">
						<div class="row no-gutters align-items-center">
							<div class="col mr-3">
								<br>
								<div class="text-xm font-weight-bold text-primary text-uppercase mb-3" style="font-size: 2.2em; font-weight: 800; color: #182751">
									💻${subList.subNm}
								</div>
								<c:forEach items="${lessonList}" var="lesList">
									<c:choose>
										<c:when test="${subList.subId == lesList.subId}">
											<div class="h1 mb-0 font-weight-bold text-gray-900">
											<c:choose>
											<c:when test="${MEMBER_INFO != null }" >
												<a class="at" href="${cp}/user/selectLessonPageLogin?lesId=${lesList.lesId}" >${lesList.lesNm}</a>
											</c:when>
											<c:when test="${MEMBER_INFO == null }" >
												<a class="at" href="${cp}/user/selectLessonPage?lesId=${lesList.lesId}" >${lesList.lesNm}</a>
											</c:when>
											</c:choose>
												<br>
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