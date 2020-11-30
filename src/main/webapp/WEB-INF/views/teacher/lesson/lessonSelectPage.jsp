<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
#cont1{padding-top:80px;margin-right: -15px; margin-left: -15px;}
#lessonCont{border-radius:10px; padding: 20px 0 22px; text-align:center;font-size: 26px;}
</style>

	<div class="container">
		<h2>강의 리스트</h2>
			<div id="cont1" style="border:1px solid blue;">
			
				<div id="lessonCont" style="border:1px solid black;">
					강의소개
					<br>
					<br>
					<br>	
					
				</div>
				<div style="border:1px solid black;">
					장바구니<br>
					담기
				</div>
				<aside>
				
				</aside>
			
			
			</div>
			
			<div id="lessonCont" style="border:1px solid black;">
				<c:forEach items="${lesIdxList}" var="lesIdxList">
					강의목차
						<br>
						<br>
					<div class="mb-3">
						 <label>${lesIdxList.lidxNum}</label>
					</div>
					<div class="mb-3">
						 <a><label>${lesIdxList.lidxCont}</label></a>
					</div>
				</c:forEach>
			</div>
			
	</div>
	
