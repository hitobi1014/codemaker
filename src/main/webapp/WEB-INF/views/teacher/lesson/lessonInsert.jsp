<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
#lineLeft{
	margin-left: 200px;
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
        str +='   <div class="row">	';
        str +='     <div class="col-lg-2">';
        str +='       <div class="form-group">';
        str +='         <label class="form-control-label">강의 차수</label>';
        str +='           <input type="text"  class="form-control form-control-alternative" placeholder="lessonnumber" name="lesIdxList['+index+'].lidxNum" id="lidxNum">';
        str +='       </div>';
        str +='     </div>';
        str +='     <div class="col-lg-7">';
        str +='       <div class="form-group">';
        str +='         <label class="form-control-label">강의 내용</label>';
        str +='          <input type="text" class="form-control form-control-alternative" placeholder="lessoncontent" name="lesIdxList['+index+'].lidxCont" id="lidxCont" >';
        str +='       </div>';
        str +='     </div>';
        str +='     <div class="col-lg-5" id="lineLeft">';
	    str +='       <div class="form-group">';
	    str +='         <label class="form-control-label">강의 주소</label>';
	    str +='          <input type="text" class="form-control form-control-alternative" placeholder="lessonpath" name="lesIdxList['+index+'].lidxPath" id="lidxPath" >';
	    str +='       </div>';
        str +='     </div>';
        str +='     <div class="col-lg-2">';
        str +='   		<div class="form-group">';
        str +='     	  <label class="form-control-label" >강의 전체시간</label>';
        str +='      	  <input type="text"  class="form-control form-control-alternative" placeholder="lessondurtime" name="lesIdxList[0].lidxDurtime" id="lidxDurtime">';
        str +='   		</div>';
      	str +='     </div>';
        str +='   </div>';
      	str +='</div>';
      	
      	index++;
      	
      	$('#idxAdd').append(str);
		
	})

	// 임시 데이터
	initData();
		
	// 강의등록 버튼
	$('#push').on('click', function(){
// 		alert('등록');
		lessonChk();
	})
	
	// 취소 버튼
	$('#cancel').on('click',function(){
		$('form').each(function(){
			this.reset();
		})
	})
	
})

function initData(){
	$('#lesNm').val('갑자기만드는 JAVA');
	$('#lesCont').val('갑자기 만드는 웹페이지');
	$('#lesCash').val('80000');
	$('#lesTerm').val('90');
}

// 강의등록 빈칸 체크
function lessonChk(){
	if($('#lesNm').val() == ""){
		alert('강의명을 입력하시오');
		return false;
	}
	if($('#lesCont').val() == ""){
		alert('강의내용을 입력하시오');
		return false;
	}
	if($('#lesCash').val() == ""){
		alert('강의수강료를 입력하시오');
		return false;
	}
	if($('#lesTerm').val() == ""){
		alert('강의기간을 입력하시오');
		return false;
	}
// 	if($('#subId').val() == ""){
// 		alert('과목을 선택하시오');
// 		return false;
// 	}
	
	if($('#lidxNum').val() == ""){
		alert('차수을 입력하시오');
		return false;
	}
	if($('#lidxCont').val() == ""){
		alert('내용을 입력하시오');
		return false;
	}
	if($('#lidxPath').val() == ""){
		alert('주소을 입력하시오');
		return false;
	}
	if($('#lidxDurtime').val() == ""){
		alert('강의시간을 입력하시오');
		return false;
	}
	
	else{
		$('#lesForm').submit();
	}
}

</script>


<!-- 강의 추가 -->
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin: 50px;">
			<div class="card" style="width: 1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">▪ 강의 추가</h2>
				<br>
				<form id="lesForm" action="${cp}/teacherL/insertLesson" method="POST" >
				<div class="lesDiv" style="background:#fbf2e4;">
            	<br>
            	<br>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의명</label>
                         <input type="text"  class="form-control form-control-alternative" placeholder="강의명" name="lesNm" id="lesNm">
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의소개</label>
                         <input type="text"  class="form-control form-control-alternative" placeholder="소개" name="lesCont" id="lesCont">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-2">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의 개설날짜</label>
                         <input type="date"  class="form-control form-control-alternative"  name="lesSdate" id="lesSdate">
                      </div>
                    </div>
                    <div class="col-lg-2">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의 종료날짜</label>
                         <input type="date" class="form-control form-control-alternative" name="lesEdate" id="lesEdate">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">강의 수강료</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="수강료" name="lesCash" id="lesCash">
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name">강의기간</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="기간"  name="lesTerm" id="lesTerm" >
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name" class="form-control form-control-alternative" >강의과목&nbsp;&nbsp;</label>
    					<select name="subId" id="subId">
    						<option value="0">과목</option>
							<c:forEach items="${subjectList}" var="sub"	>
								<c:choose>
									<c:when test="${sub.subOut == 'N'}">
										<option value="${sub.subId}">${sub.subNm}</option>
									</c:when>
								</c:choose>
							</c:forEach>
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
	                        <label class="form-control-label" >강의 차수</label>
	                         <input type="text"  class="form-control form-control-alternative" placeholder="차수" name="lesIdxList[0].lidxNum" id="lidxNum">
	                      </div>
	                    </div>
	                    <div class="col-lg-7">
	                      <div class="form-group">
	                        <label class="form-control-label" >목차 내용</label>
	                         <input type="text" class="form-control form-control-alternative" placeholder="내용" name="lesIdxList[0].lidxCont" id="lidxCont" >
	                      </div>
	                    </div>
	                    <br>
	                    <div class="col-lg-2" >
	                      <div class="form-group" >
	                      </div>
	                    </div>
	                    <div class="col-lg-5" id="lineLeft">
	                      <div class="form-group">
	                        <label class="form-control-label">강의 주소</label>
	                         <input type="text" class="form-control form-control-alternative" placeholder="lessonpath" name="lesIdxList[0].lidxPath" id="lidxPath" >
	                      </div>
	                    </div>
	                    <div class="col-lg-2">
	                      <div class="form-group">
	                        <label class="form-control-label" >강의 전체시간</label>
	                         <input type="text"  class="form-control form-control-alternative" placeholder="lessondurtime" name="lesIdxList[0].lidxDurtime" id="lidxDurtime">
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
				<button type="button" class="button button-inline button-small button-danger form-group label" id="cancel" >취소</button>
			</div>
			
		</div>
	</div>
</div>

