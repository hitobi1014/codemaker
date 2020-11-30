<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
$(document).ready(function() {
       $('.summernote').summernote({
	        width : 500,
			height: 300,
	        lang: "ko-KR"
       });
       
       $('#fileAddBtn').on('click', function(){
	        $('#fileup').append("&nbsp;&nbsp;<input type='file' name='realfile' multiple='multiple'>")
	    })

    $(".del_file").on("click", function() {
        a = $(this).val();
        del_count++
        $('#fileup').append("<input type='hidden' name='del_files' value='"+a+"'>")
        
        $('#del_count').val(del_count)
        $(this).parent().remove();

    })
})       
</script>
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
	<form id="frm" class="form-horizontal" method="POST" action="${cp}/adminNotice/updateNotice" enctype="multipart/form-data">
		
=======
	<form id="frm" class="form-horizontal" method="POST"
		action="${cp}/notice/updateNotice" enctype="multipart/form-data">

>>>>>>> VO수정
		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 타이틀</label>
			<div class="col-sm-10">
				<select id="notice_head" name="notice_head">
					<c:if test="${noticeVo.notice_head == 1}">
						<option value="1" selected>이벤트</option>
						<option value="2">자주묻는질문</option>
						<option value="3">알림</option>
					</c:if>
					<c:if test="${noticeVo.notice_head == 2}">
						<option value="1">이벤트</option>
						<option value="2" selected>자주묻는질문</option>
						<option value="3">알림</option>
					</c:if>
					<c:if test="${noticeVo.notice_head == 3}">
						<option value="1">이벤트</option>
						<option value="2">자주묻는질문</option>
						<option value="3" selected>알림</option>
					</c:if>
				</select>
			</div>
		</div>


		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 제목</label>
			<div class="col-sm-10">
				<input type=text name="notice_title" style="width: 500px;"
					value="${noticeVo.notice_title}">
			</div>
		</div>

		<div class="form-group">
			<label for="userNm" class="col-sm-2 control-label">공지사항 내용</label>
			<div class="col-sm-10">
				<textarea class="summernote" name="notice_cont">${noticeVo.notice_cont}</textarea>
			</div>
		</div>
<<<<<<< HEAD
		
=======
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="notice_date"
					value="${noticeVo.notice_date}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="notice_out"
					value="${noticeVo.notice_out}" />
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="admin_id" value="${noticeVo.admin_id}" />
			</div>
		</div>
>>>>>>> VO수정
		<div class="form-group">
			<div class="col-sm-10">
				<input type="hidden" name="notice_id" value="${noticeVo.notice_id}" />
			</div>
		</div>

		<label class="col-sm-2 control-label">첨부파일</label> <br> <br>

		<c:forEach items="${filesVo}" var="filesVo">
			<div class="form-group">
				<div id="${filesVo.files_id}">
					&emsp;&emsp;&emsp;&emsp;${filesVo.files_nm}
					<button class="del_file" type="button" class="btn btn-default"
						value="${filesVo.files_id}">삭제</button>
				</div>
			</div>
		</c:forEach>

		<button type="button" id="fileAddBtn">파일추가</button>
		<br>
<<<<<<< HEAD
		<div class="col-sm-10" id="fileup" class="col-sm-10">
		</div>
		<input id="del_count" name="del_count" type="hidden" value="0">
		<br>
		
=======
		<div class="col-sm-10" id="fileup" class="col-sm-10"></div>

>>>>>>> VO수정

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">공지사항 수정</button>
			</div>
		</div>
	</form>
</body>
</html>