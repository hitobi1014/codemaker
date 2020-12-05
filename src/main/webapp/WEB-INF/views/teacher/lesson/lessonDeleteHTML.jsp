<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${noLessonList}" var="no">
	<tr>
		<td ></td>
		<td class="ls">${no.lesId}</td>
		<td>${no.lesNm}</td>
		<c:choose>
			<c:when test="${no.lesState=='1'}">
				<td>
					<div>
						<div style="float: left; width:50%;">강의개설요청</div>
						 <div style="float: left;width:50%;">
							 <input id="delBtn" class="delClass"  type="button" value="삭제" data-lesid="${no.lesId}"> 
							 <input id="upBtn" class="upClass"  type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}">
							 <input id="reqBtn" class="reqClass"  type="button" value="요청" >
						 </div>   
					</div>
				</td>
			</c:when>
			<c:when test="${no.lesState=='2'}">
				<td>
					<div>
						<div style="float: left;width:50%;">승인요청중</div>
						<div style="float: left;width:50%;">
							<input id="delBtn2" class="delClass" type="button" value="삭제" data-lesid="${no.lesId}" >
							<input id="upBtn" class="upClass" type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}">
							<input id="reqBtn" class="reqClass"  type="button" value="요청" >
						</div> 
					</div>
				</td>
			</c:when>
			<c:when test="${no.lesState=='4'}">
				<td>
					<div>
						<div style="float: left;width:50%;">승인반환 </div>
						<div style="float: left;width:50%;">
							<input id="delBtn3" class="delClass" type="button" value="삭제" data-lesid="${no.lesId}" >
							<input id="upBtn" class="upClass"  type="button" value="수정" data-lesid="${no.lesId}" data-subid="${no.subId}">
							<input id="reqBtn" class="reqClass"  type="button" value="요청" >
						</div>
					</div>
				</td>
			</c:when>
		</c:choose>
	</tr>
</c:forEach>