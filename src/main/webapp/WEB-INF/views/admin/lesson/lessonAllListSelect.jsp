<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${lessonAllList}" var="lesson" varStatus="status">
	<tr>
		<td></td>
		<td class="ls">${no.lesId}</td>
		<td>${no.lesNm}</td>
		<c:choose>
			<c:when test="${no.lesState=='1' }">
				<td>
					<div>
						<div style="float: left; width: 50%;">강의개설요청</div>
						<div style="float: left; width: 50%;">
							<input id="delBtn"
								class="delClass button button-inline button-small button-danger form-control-label"
								type="button" value="삭제" data-lesId="${no.lesId}"
								onclick="delLes()"> <input id="upBtn"
								class="upClass button button-inline button-small button-primary form-control-label"
								type="button" value="수정">
							<!-- 															 <input id="upBtn" class="upClass button button-inline button-small button-primary form-control-label"  type="button" value="승인요청" > -->
						</div>
					</div>
				</td>
			</c:when>
			<c:when test="${no.lesState=='2' }">
				<td>
					<div>
						<div style="float: left; width: 50%;">승인요청중</div>
						<div style="float: left; width: 50%;">
							<input id="delBtn"
								class="delClass button button-inline button-small button-danger form-control-label"
								type="button" value="삭제" data-lesId="${no.lesId}"
								onclick="delLes()"> <input id="upBtn"
								class="button button-inline button-small button-primary form-control-label"
								type="button" value="수정">
						</div>
					</div>
				</td>
			</c:when>
			<c:when test="${no.lesState=='4' }">
				<td>
					<div>
						<div style="float: left; width: 50%;">승인반환</div>
						<div style="float: left; width: 50%;">
							<input id="delBtn"
								class="delClass button button-inline button-small button-danger form-control-label"
								type="button" value="삭제" data-lesId="${no.lesId}"
								onclick="delLes()"> <input id="upBtn"
								class="button button-inline button-small button-primary form-control-label"
								type="button" value="수정">
						</div>
					</div>
				</td>
			</c:when>
		</c:choose>
	</tr>
</c:forEach>
