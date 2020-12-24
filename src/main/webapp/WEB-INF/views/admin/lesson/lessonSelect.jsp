<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/css/admin/lesson/lesson-select.css" rel="stylesheet"/>

<div class="lesson-detail-box">
	<h2>강의 상세 조회</h2>
	<div class="">
		<div class="lesson-detail-item">
			<span class="lesson-info">강의명</span>
			<span>${lessonVO.lesNm}</span>			
		</div>
		<div class="lesson-detail-item">
			<span class="lesson-info">강의소개</span>
			<span>${lessonVO.lesCont}</span>
		</div>
		<div class="lesson-detail-item">
			<span class="lesson-info">담당선생님</span>
			<span>${lessonVO.tchNm}</span>
		</div>
		<div class="lesson-detail-item">
			<span class="lesson-info">강의기간</span>
			<span>${lessonVO.lesTerm}일</span>
		</div>
		<div class="lesson-detail-item">
			<span class="lesson-info">강의비용</span>
			<span>${lessonVO.lesCash}원</span>
		</div>
	</div>
	<div>
		<h3>강의 목차</h3>
		<table class="lesson-index-tb">
			<thead>
				<tr>
					<th scope="col">강의No.</th>
					<th scope="col">강의명</th>
					<th scope="col">동영상</th>
				</tr>
			</thead>
			<tbody id="lesTbody">
				<c:forEach items="${lessonVO.lessonIndexList}" var="lessonIndex" >
					<tr class="trtr">
						<td>${lessonIndex.lidxNum}강</td>
						<td>${lessonIndex.lidxCont}</td>
						<td>${lessonIndex.lidxPath}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

