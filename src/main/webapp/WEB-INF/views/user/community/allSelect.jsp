<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<link href="/css/user/board/community/allSelect.css" rel="stylesheet"/>

<div class="article">
	<div>
		<div class="ds-flex">
			<h2 class="fw-600">커뮤니티 게시판</h2>
		</div>
		<div class="rightText">
			<select style="height: 30px;">
				<option value="1" selected="selected">제목</option>
				<option value="2">회원아이디</option>
			</select>
			<input type="text" class="textBt">
			<button type="button" class="btnCol">검색</button>
		</div>
		<br><br>
		<div>
			<div class="">
				<table>
					<tr style="font-size: 20px;">
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>작성자</th>
					</tr>
					<tbody>
						<c:forEach items="${postList}" var="postList">
							<tr style="font-size: 18px;">
								<td>${postList.postNo}</td>
								<td><a style="color: black; font-size: 18px;" href="${cp}/user/community/select?postNo=${postList.postNo}">${postList.postId}</a></td>
								<td><fmt:formatDate value="${postList.postDate}" pattern="yyyy-MM-dd" /></td>
								<td>${postList.postViews}</td>
								<td>${postList.userId}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>