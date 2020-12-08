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
</style>

<script>
$(function(){
		var index = 1;
	
	// 강의목록 추가
	$('#addLesBtn').on('click', function() {
		console.log('눌림');
		
		
		str="";
		str +='<div class="pl-lg-4" id="pl-lg-4-id">';
        str +='<div class="row">	';
        str +='  <div class="col-lg-2">';
        str +='    <div class="form-group">';
        str +='      <label class="form-control-label" for="input-email">강의 차수</label>';
        str +='        <input type="text"  class="form-control form-control-alternative" placeholder="lessonnumber" name="lesIdxList['+index+'].lidxNum" id="lidxNum">';
        str +='    </div>';
        str +='  </div>';
        str +='  <div class="col-lg-7">';
        str +='    <div class="form-group">';
        str +='      <label class="form-control-label" for="input-email">강의 내용</label>';
        str +='       <input type="text" class="form-control form-control-alternative" placeholder="lessoncontent" name="lesIdxList['+index+'].lidxCont" id="lidxCont" >';
        str +='    </div>';
        str +='  </div>';
        str +='</div>';
      	str +='</div>';
      	
      	index++;
      	
      	$('#idxAdd').append(str);
		
	})

	// 임시 데이터
	initData();
		
	// 강의등록 버튼
	$('#push').on('click', function(){
		$('#lesForm').submit();
	})
})

function initData(){
	$('#lesNm').val('갑자기만드는 JAVA');
	$('#lesCont').val('갑자기 만드는 웹페이지');
	$('#lesCash').val('80000');
	$('#lesTerm').val('90');
// 	$('#lidxNum').val(1);
// 	$('#lidxCont').val('갑자기만드네');
}

</script>

</head>

<!-- 강의 추가 -->
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin: 50px;">
			<div class="card" style="width: 1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">▪ 강의 추가</h2>
				<br>
				<form id="lesForm" action="${cp}/teacherL/insertLesson" method="POST" >
<!-- 				<input type="hidden" name="tchId"> -->
<!-- 				<input type="hidden" name="subId"> -->
				<div class="lesDiv" style="background:#fbf2e4;">
            	<br>
            	<br>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의명</label>
                         <input type="text"  class="form-control form-control-alternative" placeholder="lessonname" name="lesNm" id="lesNm">
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의소개</label>
                         <input type="text"  class="form-control form-control-alternative" placeholder="lessoncontent" name="lesCont" id="lesCont">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">강의 수강료</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="lessoncash" name="lesCash" id="lesCash">
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name">강의기간</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="lessonterm"  name="lesTerm" id="lesTerm" >
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name" class="form-control form-control-alternative" >강의과목&nbsp;&nbsp;</label>
    					<select name="subId" id="subId">
    						<option value="0">과목</option>
							<option value="SUB0001">DB</option>
							<option value="SUB0002">Spring</option>
							<option value="SUB0003">Java</option>
							<option value="SUB0004">Python</option>
							<option value="SUB0005">Jsp</option>
    					</select>                    
                      </div>
                    </div>
                  </div>
                </div>
               </div> 
               <!-- 강의목차 추가 -->
               <div class="lesDiv2">
            	<br>
            	<br>
                 <div>
                 	<button type="button" class="button button-inline button-small button-success form-group label"  id="addLesBtn">강의추가</button>
                 </div>
                 <br>
                 <br>
                <div id="idxAdd">
	                <div class="pl-lg-4" id="pl-lg-4-id">
	                  <div class="row">	
	                    <div class="col-lg-2">
	                      <div class="form-group">
	                        <label class="form-control-label" for="input-email">강의 차수</label>
	                         <input type="text"  class="form-control form-control-alternative" placeholder="lessonnumber" name="lesIdxList[0].lidxNum" id="lidxNum">
	                      </div>
	                    </div>
	                    <div class="col-lg-7">
	                      <div class="form-group">
	                        <label class="form-control-label" for="input-email">강의 내용</label>
	                         <input type="text" class="form-control form-control-alternative" placeholder="lessoncontent" name="lesIdxList[0].lidxCont" id="lidxCont" >
	                      </div>
	                    </div>
	                  </div>
	                </div>
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