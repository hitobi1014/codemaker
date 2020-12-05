<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/user/mypage/mypage-style3.css">
<link rel="stylesheet" href="/css/user/mypage/mypage-style.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">

<!-- 썸머노트 설정 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.0/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js" defer></script>

<script>
	$(function() {
		// 페이지 이동
		$('.pageMove').on('click', function(){
			var page = $(this).data("page");
// 			console.log(page);
			document.location = "/note/selectPageNote?page=" + page;
		});
		
		// 상세페이지 이동
		$('#noteList tr td').on('click', function() {
			if ($(this).attr('class') == 'm') {
				// data-userid : data("속성명")
				var noteId = $(this).parent('tr').data("noteid");
				document.location = "/note/selectNote?noteId=" + noteId;
			}
		});

		// pdf 파일 다운로드
		$('#downBtn').on('click', function() {
			var noteIds = [];

			$('input:checkbox[name=chk]').each(function() {
				if ($(this).is(':checked')) {
					var noteId = $(this).val();
					noteIds.push(noteId);
				}
			});
			
			// ajax에서 배열로 보내면 url이 이상해진다...[] 붙어서 넘어감.
			if(noteIds.length > 0){
				document.location = "/note/noteDownload?noteIds=" + noteIds;
			}else{
				alert("다운받을 파일을 선택해주세요.");
			}
		});
		
		// 노트 등록 화면 요청
		$('#regBtn').on('click', function(){
			var windowObj = window.open('/note/insertViewNote','noteInsert', 'width=630,height=800,resizable=no,scrollbars=yes,left=1200,top=50');
		});

	})
</script>
<style>
#pt {
	font-size: 25px;
}

#pdfd {
	text-align: right;
	margin-right: 10px;
	margin-bottom: 10px;
}
</style>
<div id="alld">
	<div class="main-content">
		<div class="container mt-7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">

						<div class="card-header border-0">
							<p class="mb-0" id="pt">
								<strong>필기 노트 내역</strong>
							</p>
						</div>
						<div id="pdfd">
							<button type="button" class="btn btn-sm btn-primary" id="regBtn">노트 작성하기</button>
							<button type="button" class="btn btn-sm btn-primary" id="downBtn">pdf 다운로드</button>
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
											<td class="m">${status.count}</td>
											<td class="m"><span class="badge badge-dot mr-4">
													${note.noteTitle } </span></td>
											<td class="m"><fmt:formatDate value="${note.noteDate}" pattern="yyyy-MM-dd" /></td>
											<td><input type="checkbox" class="chb" name="chk" value="${note.noteId}"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

						<div class="card-footer py-4">
							<c:if test="${noteList.size() ne 0 }">
								<ul class="pagination justify-content-end mb-0">
									<!-- 첫페이지가 아닐때 -->
									<c:if test="${noteRequestVO.page ne noteRequestVO.startPage }">
										<!-- 첫페이지로 가기 -->
										<li class="page-item active">
											<input type="button" class="page-link pageMove" value="&laquo;" data-page="${noteRequestVO.startPage}">
										</li>
										<!-- 이전 페이지로 가기 -->
										<li class="page-item active">
											<input type="button" class="page-link pageMove" value="&lt;" data-page="${noteRequestVO.page-1 }">
										</li>
									</c:if>

									<c:forEach begin="1" end="${pages }" var="i">
										<!-- 현재 있는 페이지와 구분 -->
										<c:choose>
											<c:when test="${i == noteRequestVO.page }">
												<!-- 보고 있는 페이지와 현재 선택된 페이지가 같을 때 -->
												<li class="page-item active"><span class="page-link"><strong>${i }</strong></span></li>
											</c:when>
											<c:otherwise>
												<li class="page-item active">
													<input type="button" class="page-link pageMove" value="${i}" data-page="${i}">
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>

									<!-- 마지막페이지가 아닐때 -->
									<c:if test="${noteRequestVO.page ne noteRequestVO.endPage }">
										<!-- 다음 페이지로 이동 -->
										<li class="page-item active">
											<input type="button" class="page-link pageMove" value="&gt;" data-page="${noteRequestVO.page+1 }">
										</li>
										<!-- 마지막 페이지로 이동 -->
										<li class="page-item active">
											<input type="button" class="page-link pageMove" value="&raquo;" data-page="${noteRequestVO.endPage }">
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
</div>
