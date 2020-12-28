<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.idxUpBtn{
	margin: 35px 0px 0 0px;
}
.newIdxDelBtn{
	margin: 35px 0px 0 20px;
}

.IdxContDiv{
	width: 1100px;
	float: left;
}
#lineLeft{
	margin-left: 180px;
}
</style>

<script>
$(function(){
	
	var index = 0;
	// 강의목록 추가
	$('#addLesBtn').on('click', function() {
		console.log('눌림');
		
			str ='<div class="pl-lg-4" id="pl-lg-4-id_['+index+']">';
	        str +='  <div class="row">';	
	        str +='    <div class="col-lg-2">';
	        str +='      <div class="form-group">';
	        str +='        <label class="form-control-label" for="input-email">강의 차수</label>';
	        str +='         <input type="text"  class="form-control form-control-alternative" placeholder="강의차수" name="lesIdxListInsert['+index+'].lidxNum" id="lidxNum">';
	        str +='      </div>';
	        str +='    </div>';
			str +='    <div class="col-lg-7">';
			str +=' 	  <div class="form-group">';
			str +=' 			<label class="form-control-label" for="input-email">강의 내용</label>'; 
			str +=' 			<input type="text" class="form-control form-control-alternative" placeholder="강의내용" name="lesIdxListInsert['+index+'].lidxCont" id="lidxCont">';
			str +=' 	   </div>';
			str +='     </div>';
			str +=' 	<div class="IdxContDiv">';
		 	str +='			<div class="col-lg-5" id="lineLeft">';
			str +='				<div class="form-group">';
			str +='					<label class="form-control-label">강의 주소</label>';
			str +='					<input type="text" class="form-control form-control-alternative" placeholder="주소" name="lesIdxListInsert['+index+'].lidxPath" id="lidxPath" >';
			str +='				</div>';
			str +='			</div>';
			str +='			<div class="col-lg-2">';
			str +='				<div class="form-group">';
			str +='					<label class="form-control-label">강의 전체시간</label>';
			str +='					<input type="text" class="form-control form-control-alternative" placeholder="전체시간" name="lesIdxListInsert['+index+'].lidxDurtime" id="lidxDurtime" >';
			str +='				</div>';
			str +='			</div>';
			str +='			<div>';
			str +=' 			<input type="button" class="newIdxDelBtn" id="IdxDelBtn" value="삭제" data-del="pl-lg-4-id_['+index+']" >';
			str +=' 		</div>';
			str +=' 	</div>';
			str +='   </div>';
	        str +='</div>';
	        
		index++;
			
      	
      	$('#idxAdd').append(str);
		
	})
	
	// 새로 생성된 강의목차 삭제
	$('#idxAdd').on('click','.newIdxDelBtn',function(){
		console.log('삭제버튼!!');
		var del=$(this).data("del");
		console.log(del);
		$("div[id='"+del+"']").remove();
// 		$('#'+del).remove();
		console.log(del);
	})
	    
	
	// 원래있던 강의목차 삭제
	$('#idxAdd').on('click','.idxDelBtn',function(){
		alert("삭제됩니다!")
		var lidxId = $(this).data("lidxid");
		var del=$(this).data("del");
		console.log(lidxId);
		console.log(del);
		
		$("div[id=pl-lg-4-id"+del).remove();
		str ='<input type="hidden" name="lesIdxListDelete" value="'+lidxId+'" >';
		$('#lesForm').append(str);
		
	})
	
	
	// 원래있던 강의목차 수정
// 	$('#idxAdd').on('click', '.idxUpBtn', function(){
		
// 		var lidxId = $(this).data("lidxid");
// 		var lesId = $(this).data("lesid");
// 		var id = $(this).attr('id');
// 		var lidxNum =$('input[id=lidxNum'+id+']').val();
// 		var lidxCont =$('input[id=lidxCont'+id+']').val();
// 		console.log(lidxId);
// 		console.log(lesId);
// 		console.log(id);
// 		console.log(lidxNum);
// 		console.log(lidxCont);
		
// 		$.ajax({
// 				method:'get',
// 				url:'/teacherL/updateLessonIndex?lidxId='+lidxId+'&lesId='+lesId,
// 			    data:{'lidxCont': lidxCont
// 			    	  ,'lidxNum': lidxNum
// 			    	  },
// 				dataType:'html',
// 				success:function(data){
// 					console.log(lesId);
// 					$('#idxAdd').load('/teacherL/updateLoadLesIdx?lesId='+lesId);
// 				},
// 				error:function(data){
// 					alert('안됨');
// 				}
// 			})
// 		})
		
	// 저장버튼
	$('#push').on('click',function(){
		alert('수정되었습니다!');
		$('#lesForm').submit();
	})
	
	$('#tempoPush').on('click',function(){
		$('#lesForm').submit();
	})
	
	// 취소 버튼
	$('#cancel').on('click',function(){
		document.location="/teacherL/selectSubject";
	})
	
	
})


</script>


<!-- 강의 수정 -->
<div id="containerId">
	<div class="row shadow" style="background-color: white;">
		<div class="col-12" style="margin: 50px;">
			<div class="card" style="width: 1200px;">
				<div class="card-body text-center"></div>
				<h2 class="card-title m-b-0">▪ 강의 수정</h2>
				<br>
				<form id="lesForm" action="${cp}/teacherL/updateLesson" method="POST" >
<%-- 				<input type="hidden" name="tchId" value="${lessonVO.tchId}"> --%>
<%-- 				<input type="hidden" name="subId" value="${lessonVO.subId}"> --%>
				<input type="hidden" name="lesId" value="${lessonVO.lesId}">
				<div class="lesDiv" style="background:#fbf2e4;">
            	<br>
            	<br>
                <div class="pl-lg-4">
				<input type="hidden" name="subId">
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
                         <input type="text"  class="form-control form-control-alternative" placeholder="소개" name="lesCont" id="lesCont" value="${lessonVO.lesCont}">
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-first-name">강의 수강료</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="수강료" name="lesCash" id="lesCash" value="${lessonVO.lesCash}">
                      </div>
                    </div>
                    <div class="col-lg-3">
                      <div class="form-group focused">
                        <label class="form-control-label" for="input-last-name">강의기간</label>
                        <input type="text"  class="form-control form-control-alternative" placeholder="기간"  name="lesTerm" id="lesTerm"  value="${lessonVO.lesTerm}">
                      </div>
                    </div>
                    <div class="col-lg-7">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">강의 상세내용</label>
                         <textarea rows="6" cols="6" class="form-control form-control-alternative" placeholder="상세설명" name="lesDetail" id="lesDetail"  >${lessonVO.lesDetail}</textarea>
                      </div>
                    </div>
                  </div>
                </div>
               </div> 
               <!-- 강의목차 수정 -->
               <div class="lesDiv2">
            	<br>
            	<br>
            	<div>
                 	<button type="button" class="button button-inline button-small button-success form-group label"  id="addLesBtn">강의추가</button>
                 </div>
                 <br>
                 <br>
                <div id="idxAdd">
	               	<input type="hidden" value="lidxId">
		          		<c:forEach items="${lesIdxList}" var="lesIdxList"  varStatus="status">
			                <div class="pl-lg-4" id="pl-lg-4-id${status.index}">
				                  <div class="row">	
				                    <div class="col-lg-2">
				                      <div class="form-group">
				                        <label class="form-control-label" for="input-email">강의 차수</label>
				                         <label  class="form-control form-control-alternative" name="lesIdxList[${status.index}].lidxNum" id="lidxNum${status.index}" >${lesIdxList.lidxNum}</label>
				                      </div>
				                    </div>
										<div class="col-lg-7">
											<div class="form-group">
												<label class="form-control-label" for="input-email">강의 내용</label> 
												<input type="text" class="form-control form-control-alternative" placeholder="내용" name="lesIdxList[${status.index}].lidxCont" id="lidxCont${status.index}" value="${lesIdxList.lidxCont}">
											</div>
										</div>
									<div class="IdxContDiv">
											<div class="col-lg-5" id="lineLeft">
												<div class="form-group">
													<label class="form-control-label">강의 주소</label>
													<input type="text" class="form-control form-control-alternative" placeholder="주소" name="lesIdxList[${status.index}].lidxPath" id="lidxPath${status.index}" value="${lesIdxList.lidxPath}">
												</div>
											</div>
											<div class="col-lg-2">
												<div class="form-group">
													<label class="form-control-label">강의 전체시간</label>
													<input type="text" class="form-control form-control-alternative" placeholder="전체시간" name="lesIdxList[${status.index}].lidxDurtime" id="lidxDurtime${status.index}" value="${lesIdxList.lidxDurtime}">
												</div>
											</div>
											<input type="hidden" name="lesIdxList[${status.index}].lidxId" id="lidxId${status.index}" value="${lesIdxList.lidxId}" >
											<div>
											<input type="button"  class="idxDelBtn" value="삭제" data-lidxid="${lesIdxList.lidxId}"  data-del="${status.index}">
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
				<button class="button button-inline button-small button-primary form-group label" id="push" >저장</button>
				<button type="button" class="button button-inline button-small button-danger form-group label" id="cancel" >취소</button>
			</div>
		</div>
	</div>
</div>

