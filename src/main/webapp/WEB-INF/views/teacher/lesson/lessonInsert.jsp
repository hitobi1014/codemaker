<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"> 

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(function(){
	$('#btnSave').on('click',function(){
		alert('삐꼭');
		$('#form').submit();
	})	
})

</script>

<title>Insert title here</title>
</head>
<body>

	<div class="container" role="main">
		<h2>강의 추가</h2>
		<form name="form" id="form" role="form" method="post" action="${pageContext.request.contextPath}/teacherL/insert">
			<div class="mb-3">
				<label for="title">강의 이름</label>
				<input type="text" class="form-control" name="les_nm" id="les_nm" placeholder="강의이름을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="reg_id">강의 소개</label>
				<textarea class="form-control" rows="5" name="les_cont" id="les_cont" placeholder="강의를 소개해주세요" ></textarea>
			</div>
			<div class="mb-3">
				<label for="content">담당 쌤</label>
				<input type="text" class="form-control" name="tch_id" id="tch_id" placeholder="담당 쌤">
			</div>
		</form>
		<div >
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
		</div>
	</div>
</body>
</html>