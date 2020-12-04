<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="/css/teacher/lesson/lesson.css">
<link rel="stylesheet" href="/css/teacher/lesson/mypage-style.css">
<link rel="stylesheet" href="/css/teacher/lesson/button.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="/js/teacher/exam/exam.js"></script>

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
    margin-left: 140px;
    margin-bottom:20px;
}

#containerAddId{
    width: 1300px;
    margin-left: 140px;
    margin-top : 10px;
}
#addLesId{
	margin-right: 50px;
    margin-bottom: 20px;
}
#addLesBtn{
	height: 35px;
	font-size: 13px;
	margin-right: 20px;
	float:right;
}
.lesDiv{
	margin-bottom:40px;
}
.lesDiv{
	margin-bottom:20px;
}
#pl-lg-4-id{
	margin-top: 20px;}
	
#push, #cancel{
	height: 35px;
	font-size: 13px;
	float: right;
	
}	
.buttonDiv{
	margin-right: 100px;
}
.lesDiv2{
	background:#fbf2e4; 
	border-top: 10px solid #f7c573;
	margin-bottom: 20px;
}
.idxDelBtn{
	margin: 35px 0px 0 20px;
}
.IdxContDiv{
	width: 800px;
	float: left;
}
</style>

<script>
$(function(){
	$('#idxAdd').on('click','.idxDelBtn',function(){
		var lidxid = $(this).data("lidxid");
		console.log(lidxid);
		$.ajax({
				method:'get',
				url:'/teacherL/updateLessonIndex?lidxId='+lidxid,
				dataType:'html',
				success:function(data){
					$('#idxAdd').load('/teacherL/deleteLoadLesIdx');
				},
				error:function(data){
					alert('안됨');
				}
		})
	})
	
	
})

// function initData(){
// 	$('#lesNm').val('갑자기만드는 JAVA');
// 	$('#lesCont').val('갑자기 만드는 웹페이지');
// 	$('#lesCash').val('80000');
// 	$('#lesTerm').val('90');
// 	$('#lidxNum').val(1);
// 	$('#lidxCont').val('갑자기만드네');
// }

</script>

</head>

<!-- 강의 추가 -->
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin: 50px;">
			<div class="card" style="width: 1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">▪ 강의 수정</h2>
				<br>
				<form id="lesForm" action="" method="POST" >
				<input type="hidden" name="tchId">
				<input type="hidden" name="subId">
				<div class="lesDiv" style="background:#fbf2e4;">
            	<br>
            	<br>
                <div class="pl-lg-4">
                  <div class="row">
                   <div class="col-lg-7">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name" class="form-control form-control-alternative" >강의과목&nbsp;&nbsp;</label>
                        <label class="form-control-label" for="input-last-name" class="form-control form-control-alternative" >${lessonVO.subNm}</label>
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의명</label>
                         <input type="text"  class="form-control form-control-alternative" placeholder="강의명" name="lesNm" id="lesNm" value="${lessonVO.lesNm}" >
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의소개</label>
                         <input type="text"  class="form-control form-control-alternative" placeholder="강의소개" name="lesCont" id="lesCont" value="${lessonVO.lesCont}">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">강의 수강료</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="강의 수강료" name="lesCash" id="lesCash" value="${lessonVO.lesCash}">
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name">강의기간</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="강의기간"  name="lesTerm" id="lesTerm"  value="${lessonVO.lesTerm}">
                      </div>
                    </div>
                  </div>
                </div>
               </div> 
               <!-- 강의목차 추가 -->
               <div class="lesDiv2">
            	<br>
            	<br>
                 <br>
                 <br>
                <div id="idxAdd">
	              <c:forEach items="${lesIdxList}" var="lesIdxList">
	                <div class="pl-lg-4" id="pl-lg-4-id">
	                  <div class="row">	
	                    <div class="col-lg-2">
	                      <div class="form-group">
	                        <label class="form-control-label" for="input-email">강의 차수</label>
	                         <input type="text"  class="form-control form-control-alternative" placeholder="강의차수" name="lesIdxList[0].lidxNum" id="lidxNum" value="${lesIdxList.lidxNum}">
	                      </div>
	                    </div>
						<div class="IdxContDiv">
							<div class="col-lg-7">
								<div class="form-group">
									<label class="form-control-label" for="input-email">강의 내용</label> 
									<input type="text" class="form-control form-control-alternative" placeholder="강의내용" name="lesIdxList[0].lidxCont" id="lidxCont" value="${lesIdxList.lidxCont}">
								</div>
							</div>
						 	<div>
								<input type="button" class="idxDelBtn" value="삭제" data-lidxid=${lesIdxList.lidxId}>
							</div>
						</div>
					</div>
	               </div>
	              </c:forEach>
                </div>
                <br>
                <br>
               </div> 
        	</form>
			</div>
			<br>
			<br>
			<div class="buttonDiv">
				<button class="button button-inline button-small button-primary form-group label" id="push" >등록</button>
				<button type="reset" class="button button-inline button-small button-danger form-group label" id="cancel" >취소</button>
			</div>
			
		</div>
	</div>
</div>

</html>