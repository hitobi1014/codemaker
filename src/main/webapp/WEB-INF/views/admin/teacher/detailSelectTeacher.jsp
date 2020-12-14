<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link href="/css/admin/teacher/detailSelectTeacher.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="card">
	<div class="select-container-area">
		<div class="header-container">
			<h3>선생님 상세조회</h3>
			<div class="divider"></div>
		</div>
		<div class="info-teacher">
			<div>
				<div>
					<img id="img-teacher" alt="" src="/img/teacher/sky.jpg">
				</div>
				<div>
					선생님 구분 : ${teacherVo.tchGn}<br>
					아이디 : ${teacherVo.tchId}<br>
					전화번호 : ${teacherVo.tchTel}<br>
					이름 : ${teacherVo.tchNm}<br>
					
				</div>
			</div>
			
			입사일 : <fmt:formatDate value="${teacherVo.tchJoin}" pattern="yyyy-MM-dd"/><br>
			<c:if test="${teacherVo.tchRetire !=null}">
				퇴사일 : <fmt:formatDate value="${teacherVo.tchRetire}" pattern="yyyy-MM-dd"/><br>
			</c:if>
			소개말 : ${teacherVo.tchIntro} <br>
			
			<!-- 기업 아이디가 있는경우에는 기업정보도 추가 -->
			기업아이디 : ${teacherVo.comId} <br>
			
			<!-- 이력서 정보 -->
			이메일 : ${resumeVo.resMail} <br>
			학력 : ${resumeVo.resEdu} <br>
			자격증 : ${resumeVo.resLicense} <br>
			경력 :${resumeVo.resCareer}<br>
			
			
		</div>
	</div>
</div>