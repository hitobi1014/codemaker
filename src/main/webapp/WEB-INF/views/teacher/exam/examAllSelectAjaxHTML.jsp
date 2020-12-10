<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 시험 문제 리스트 -->
<c:forEach items="${lessonVO.examList }" var="exam" varStatus="status">
	<tr data-examid='${exam.examId }'>
		<!-- 시험 문제를 볼때 -->
		<td class='m'>${status.count }</td>
		<td class='m'>${exam.lidxCont }</td>
		<td class='m'>${exam.examNm }_테스트</td>
		<td class='m'><fmt:formatDate value="${exam.examDate }" pattern="yyyy-MM-dd" /></td>
		<td data-examstate='${exam.examState }' class='m'>
			<c:choose>
				<c:when test="${exam.examState == 'Y' }">
					등록완료
				</c:when>
				<c:otherwise>
					수정중
				</c:otherwise>
			</c:choose>
		
		</td>
		<td><input type="checkbox" value='${exam.examId }' class='echk'>
		</td>
	</tr>
</c:forEach>
