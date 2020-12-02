<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$('#noteList tr').on('click', function() {
		// data-userid : data("속성명")
		console.log('add');
		var noteId = $(this).data("noteid");
		console.log("noteId : " + noteId);

		// 클릭시 상세페이지로 이동
		document.location = "/note/selectNote?noteId=" + noteId;
	});
})
</script>

<body>
	<div class="main-content">
		<div class="container mt-7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">

						<div class="card-header border-0">
							<h3 class="mb-0">필기 노트 내역</h3>
						</div>

						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<thead class="thead-light">
									<tr>
										<th scope="col">NUM</th>
										<th scope="col">TITLE</th>
										<th scope="col">DATE</th>
										<th scope="col">-</th>
									</tr>
								</thead>

								<tbody id="noteList">
									<c:forEach items="${noteList }" var="note" varStatus="status">
										<tr data-noteid="${note.noteId}">
											<td>${status.count}</td>
											<td><span class="badge badge-dot mr-4">
													${note.noteTitle } </span></td>
											<td><fmt:formatDate value="${note.noteDate}"
													pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="card-footer py-4">
							<c:if test="${postList.size() ne 0 }">
								<ul class="pagination justify-content-end mb-0">
									<!-- 첫페이지가 아닐때 -->
									<c:if test="${noteRequestVo.page ne noteRequestVo.startPage }">
										<li class="page-item active">
											<a  class="page-link" href="${cp }/post/selectAllPost?boardid=${boardid}&page=${noteRequestVo.startPage}">
											</a>
										</li>
										<li class="page-item active">
											<a class="page-link" href="${cp }/post/selectAllPost?boardid=${boardid}&page=${noteRequestVo.page-1}">
											</a>
										</li>
									</c:if>
									
									<c:forEach begin="1" end="${pages }" var="i">
										<!-- 현재 있는 페이지와 구분 -->
										<c:choose>
											<c:when test="${i == noteRequestVo.page }">
												<!-- 보고 있는 페이지와 현재 선택된 페이지가 같을 때 -->
												<li class="page-item active">
													<span>${i }</span>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item active">
													<a class="page-link" href="${cp }/post/selectAllPost?boardid=${boardid}&page=${i}">${i}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<!-- 마지막페이지가 아닐때 -->
									<c:if test="${noteRequestVo.page ne noteRequestVo.endPage }">
										<li class="page-item active">
											<a class="page-link" href="${cp }/post/selectAllPost?boardid=${boardid}&page=${noteRequestVo.page+1}">
											</a>
										</li>
										<li class="page-item active">
											<a class="page-link" href="${cp }/post/selectAllPost?boardid=${boardid}&page=${noteRequestVo.endPage}">
											</a>
										</li>
									</c:if>
									
								</ul>
							</c:if>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>