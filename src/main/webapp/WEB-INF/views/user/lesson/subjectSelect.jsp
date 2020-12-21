<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/user/lesson/subject-select.css"/>
<!-- 컨텐츠부분 메인박스 -->
<div class="lesson-main-box">
	<!-- 리스트 박스 -->
	<div class="lesson-list-box">
		<c:forEach items="${subjectList}" var="subList">
			<!-- 과목박스 -->		
			<div class="sublist-box shadow">
				<!-- 과목 나타내는 -->
				<c:choose>
					<c:when test="${subList.subNm =='DB'}">
						<div class="subject-header" style="background: rgb(0,94,135);">
							<div class="subject-subnm-box" style="background: rgb(3 47 66);"><span>${subList.subNm}</span></div>
						</div>
						<div class="img-box">
							<div class="img-cont"><img alt="database" src="/img/icon/database-storage.svg"></div>
						</div>
					</c:when>
					<c:when test="${subList.subNm =='Spring'}">
						<div class="subject-header" style="background: #008000b8;">
							<div class="subject-subnm-box" style="background: #064806;"><span>${subList.subNm}</span></div>
						</div>
						<div class="img-box" >
							<div class="img-cont" style="left: 754px;"><img alt="database" src="/img/icon/leaf.svg"></div>
						</div>
					</c:when>
					<c:when test="${subList.subNm =='Java'}">
						<div class="subject-header" style="background: #b52121b5;">
							<div class="subject-subnm-box" style="background: #920d0d;"><span>${subList.subNm}</span></div>
						</div>
						<div class="img-box" >
							<div class="img-cont" style="left: 1186px;"><img alt="database" src="/img/icon/java.svg"></div>
						</div>
					</c:when>
					<c:when test="${subList.subNm =='Python'}">
						<div class="subject-header" style="background: #800080ab;">
							<div class="subject-subnm-box" style="background: #750075;"><span>${subList.subNm}</span></div>
						</div>
						<div class="img-box" >
							<div class="img-cont" style="top: 588px;"><img alt="database" src="/img/icon/file.svg"></div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="subject-header" style="background: #828282d1;">
							<div class="subject-subnm-box" style="background: #463c3cd1;"><span>${subList.subNm}</span></div>
						</div>
						<div class="img-box" >
							<div class="img-cont" style="top: 588px;left:754px;">
								<img alt="database" src="/img/icon/jsp-file-format-symbol.svg">
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- 박스안에 글 시작부분 -->
				<div class="sub-coment-box">
					<!-- 과목정보 -->
					<div class="sub-coment-item">
						<c:forEach items="${lessonList}" var="lesList">
							<c:choose>
								<c:when test="${subList.subId == lesList.subId}">
									<div class="">
										<c:url value="/user/selectLessonPage" var="selectLessonPage">
											<c:param name="lesId" value="${lesList.lesId}"/>
										</c:url>
										<span class="info-lesnm"><a href="${selectLessonPage}">${lesList.lesNm}</a></span>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
					<!-- 과목 상자 안에 hr -->
					<div class="divider">
						<div></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>