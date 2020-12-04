<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${lessonIndexList }" var="lessonIndex" varStatus="status">
	<tr>
		<td>${lessonIndex.lidxNum } 강</td>
		<td>${lessonIndex.lidxCont }</td>
		<td>${lessonIndex.lidxPath }</td>
	</tr>
</c:forEach>
fin
<input type="button" class="btn btn-sm btn-primary" value="승인" id="regBtn" data-lesid="${lessonIndexList[0].lesId }">
<input type="button" class="btn btn-sm btn-primary" value="반려" id="cancle" data-lesid="${lessonIndexList[0].lesId }">
fin
<c:if test="${lessonIndexList.size() ne 0 }">
	<ul class="pagination justify-content-end mb-0">
		<!-- 첫페이지가 아닐때 -->
		<c:if test="${lessonVO.page ne lessonVO.startPage }">
			<!-- 첫페이지로 가기 -->
			<li class="page-item active">
				<input type="button" class="page-link pageMove" value="&laquo;" data-page="${lessonVO.startPage}">
			</li>
			<!-- 이전 페이지로 가기 -->
			<li class="page-item active">
				<input type="button" class="page-link pageMove" value="&lt;" data-page="${lessonVO.page-1 }">
			</li>
		</c:if>
	
		<c:forEach begin="1" end="${pages }" var="i">
			<!-- 현재 있는 페이지와 구분 -->
			<c:choose>
				<c:when test="${i == lessonVO.page }">
					<!-- 보고 있는 페이지와 현재 선택된 페이지가 같을 때 -->
					<li class="page-item active" ><span class="page-link" style="float:none;"><strong>${i }</strong></span></li>
				</c:when>
				<c:otherwise>
					<li class="page-item active">
						<input type="button" class="page-link pageMove" value="${i}" data-page="${i}">
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	
		<!-- 마지막페이지가 아닐때 -->
		<c:if test="${lessonVO.page ne lessonVO.endPage }">
			<!-- 다음 페이지로 이동 -->
			<li class="page-item active">
				<input type="button" class="page-link pageMove" value="&gt;" data-page="${lessonVO.page+1 }">
			</li>
			<!-- 마지막 페이지로 이동 -->
			<li class="page-item active">
				<input type="button" class="page-link pageMove" value="&raquo;" data-page="${lessonVO.endPage }">
			</li>
		</c:if>
		
	</ul>
</c:if>
	
