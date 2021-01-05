<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/user/board/community/select.css" rel="stylesheet" />

<div class="article">
	<div class="replyBox">
		<h3 class="fw-600">${PostVO.postTitle}</h3>
		<label class="dateL"><fmt:formatDate value="${PostVO.postDate}" pattern="yyyy-MM-dd HH:mm"/></label>
	</div>
	<div class="replyBox">
		<label><img id="postImg" src="/images/user/icons/user.png">
			${PostVO.userId}
		</label>
	</div>
	<div>
		<c:if test="${filesList.size() != 0}">
			<span>첨부파일 :</span>
		</c:if>
		<c:forEach items="${filesList}" var="PostFileVO">
			<button type="button" value="${postFileVO.fileNo}">${postFileVO.fileName}</button>
		</c:forEach>
	</div>
	
	<div class="con-size">
		<label>${PostVO.postContent}</label>
	</div>
	<br>
	<div class="btn-f">
		<button type="button" class="up-btn fw-600" id="updateCont" onclick="location.href='/user/community/update'">수정</button>
		<button type="button" class="de-btn fw-600" id="deleteCont">삭제</button>
	</div>
	<br><br>
</div>
<div class="article">
	<div class="replyBox">
		<textarea class="reText" placeholder="댓글을 입력해주세요." ></textarea>
		<button class="reBtn fw-600" type="button" value="">등록</button>
	</div>
</div>