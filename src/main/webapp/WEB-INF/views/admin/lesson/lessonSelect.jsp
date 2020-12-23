<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="/css/admin/lesson/lesson-select.css" rel="stylesheet"/>
<div id="cont">
<h2 class="card-title m-b-0">📢강의 상세 조회</h2>
		<label for="lesNm" class="nfn"><strong>강의명</strong></label>
		<div class="mb-3">
			<input type="text" id="lesNm"  value="${lessonVO.lesNm}" />
		</div>
		<label for="lesCont" class="nfn"><strong>강의 소개</strong></label>
		<div class="mb-3">
			<input type="text" id="lesCont" value="${lessonVO.lesCont}" />
		</div>
		<label for="tchNm" class="nfn"><strong>담당선생님</strong></label>
		<div class="mb-3">
			<input type="text" id="tchNm"  value="${lessonVO.tchNm}" />
		</div>
		<label for="lesTerm" class="nfn"><strong>강의기간(일)</strong></label>
		<div class="mb-3">
			<input type="text" id="lesTerm" value="${lessonVO.lesTerm}" />
		</div>
		<label for="lesCash" class="nfn"><strong>강의비용(원)</strong></label>
		<div class="mb-3">
			<input type="text" id="lesCash" value="${lessonVO.lesCash}" />
		</div>
		<br>
		<h3 class="card-title m-b-0">📢강의 목차</h3>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th scope="col" style="width: 290px; font-size: 13px;">강의No.</th>
					<th scope="col" style="width: 389px; font-size: 13px;">강의명</th>
					<th scope="col" style="font-size: 13px;">동영상</th>
				</tr>
			</thead>
			<tbody id="lesTbody">
				<c:forEach items="${lessonVO.lessonIndexList}" var="lessonIndex" >
					<tr>
						<td>${lessonIndex.lidxNum}강</td>
						<td>${lessonIndex.lidxCont}</td>
						<td>${lessonIndex.lidxPath}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</div>

