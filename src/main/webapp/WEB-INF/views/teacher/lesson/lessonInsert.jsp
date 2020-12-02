<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- js 추가 -->
<script src="/js/teacher/exam/exam.js"></script>

</script>
<title>examAllSelect</title>

<style>
#wul {
	width: 1100px;
	margin-left: 200px;
}

#hd {
	margin-left: 15px;
}

#subject {
	width: 100px;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 10px;
}
#lesson {
	width: 400px;
	display: inline-block;
	margin-right: 10px;
	margin-bottom: 10px;
}
#right {
	text-align: right;
}

#regBtn {
	margin-right: 10px;
	margin-bottom: 10px;
	margin-top: 8px;
}

#selectTab{
	padding-left: 30px;
	
}
#containerId{
    width: 1300px;
    margin:60px;
}
#addLesId{
	margin-right: 50px;
    margin-bottom: 20px;
}
#addLesBtn{
	width: 50px;
	height: 50px;
}

</style>



<title>Insert title here</title>
</head>
<body>

	<div class="container" role="main">
		<h2>강의추가</h2>
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

<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin:50px;">
			<div class="card" style="width:1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">📢강의 조회 및 개설</h2>
				<div id="addLesId">
					<button id="addLesBtn" style="float: right;"><img id="addId" src="/images/teacher/lesson/plus.png"></button>
				</div>
				<div id="right">
					<select class="form-control" id="subject" name="subId">
						<option value="0">과목</option>
						<option value="SUB0001">DB</option>
						<option value="SUB0002">Spring</option>
						<option value="SUB0003">Java</option>
						<option value="SUB0004">Python</option>
						<option value="SUB0005">Jsp</option>
					</select> <select class="form-control" id="lesson">
						<option value="99">강의</option>
						<option value="LESSON0001">Why Java?</option>
						<option value="0">Spring</option>
						<option value="1">Java</option>
						<option value="1">Python</option>
						<option value="1">Jsp</option>
					</select> <input id="selBtn" type="button" value="조회" onclick="selLesIdx()">
				</div>
				<br>
				<div class="table-responsive">
					<table class="table">
						<thead class="thead-light">
							<tr>
								<th><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span>
								</label></th>
								<th scope="col">강의No.</th>
								<th scope="col">강의목록명</th>
								<th scope="col">동영상</th>
							</tr>
						</thead>
						<tbody class="lesIdxTbody">

						</tbody>
					</table>
				</div>

				<h2 class="card-title m-b-0">📢임시 저장된 강의</h2>
				<div class="table-responsive">
					<table class="table">
							<thead class="thead-light">
								<tr>
									<th style="width:170px;"><label class="customcheckbox m-b-20"> <input type="checkbox" id="mainCheckbox"> <span class="checkmark"></span>
									</label></th>
									<th scope="col" style="width: 290px;">강의No.</th>
									<th scope="col" style="width: 389px;">강의목록명</th>
									<th scope="col">강의승인상태</th>
								</tr>
							</thead>
							<tbody id="lesTbody">
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
													 <div style="float: left;width:30%;"><input class="delClass" type="button" value="삭제" id="delBtn" onclick="delLes()"> <input type="button" value="수정" id="upBtn"></div>   
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


							</tbody>
					</table>
				</div>
			</div>
		</div>


		<c:if test="${examList.size() ne 0 }">
			<%-- pages : ${pages} --%>
			<!-- 현재 있는 페이지 번호 출력 -->
			<%-- page : ${page} --%>
			<div class="text-center">
				<ul class="pagination">

				</ul>
			</div>
		</c:if>

	</div>
</div>