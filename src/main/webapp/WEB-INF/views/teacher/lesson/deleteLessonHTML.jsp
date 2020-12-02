<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach items="${noLessonList}" var="no">
			<tr data-lesId="${no.lesId}">
				<td ></td>
				<td class="ls">${no.lesId}</td>
				<td>${no.lesCont}</td>
				<c:choose>
					<c:when test="${no.lesState=='1' }">
						<td>
							<div>
								<div style="float: left; width:70%;">강의개설요청</div>
								 <div style="float: left;width:30%;"><input class="delClass" type="button" value="삭제" id="delBtn"> <input type="button" value="수정" id="upBtn"></div>   
							</div>
						</td>
					</c:when>
					<c:when test="${no.lesState=='2' }">
						<td>
							<div>
								<div style="float: left;width:70%;">승인요청중</div>
								<div style="float: left;width:30%;"><input  class="delClass" type="button" value="삭제" id="delBtn" onclick="delLes()"><input type="button" value="수정" id="upBtn"></div> 
							</div>
						</td>
					</c:when>
					<c:when test="${no.lesState=='4' }">
						<td>
							<div>
								<div style="float: left;width:70%;">승인반환 </div>
								<div style="float: left;width:30%;"><input  class="delClass" type="button" value="삭제" id="delBtn" onclick="delLes()"> <input type="button" value="수정" id="upBtn"></div>
							</div>
						</td>
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>