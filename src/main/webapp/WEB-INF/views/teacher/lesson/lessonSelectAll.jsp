<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<div class="container">
		<h2>강의 리스트</h2>
		<c:forEach items="${lessonList}" var="lesList">
			<div class="mb-3">
				<label>강의 이름 : </label> <label>${lesList.lesNm}</label>
			</div>
			<div class="mb-3">
				<label>강의 내용 : </label> <label>${lesList.lesCont}</label>
			</div>
			<div class="mb-3">
				<label>담당 쌤 : </label> <label>${lesList.tchId}</label>
			</div>
			<br>
		</c:forEach>
	</div>
	
