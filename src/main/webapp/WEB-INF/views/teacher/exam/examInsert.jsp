<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- js 추가 -->
<script src="/js/teacher/exam/exam.js"></script>

<script>
$(function() {
	
	// 문제 추가
	$('#plusBtn').on('click' , function() {
		createExam();
	})

	// #e6f4ea, que_answer, anw
	// 정답 체크시 오버레이
	$(document).on('click', 'input[name=queAnswerList]',function() {
		var ol = $(this).prevAll("div[class=overlay]");
		
		if($(this).is(":checked") == true){
			ol.attr('style','display: block');
		}else{
			ol.attr('style','display: none');
		}
	});
	
	// 임시저장, 등록
	$('.btns input[type=button]').on('click',function() {
		var bid = $(this).attr('id');
		
		// 빈칸 체크
		var state = 0;
		$('#examf').find('type="text"').each(function(index, data){
			if($(this).val().trim() == ''){
				alert('값이 입력되지 않았습니다.');
				state = 1;
				return false;
			}
		});
		if(state == 0){
			$('.comment').each(function(index, data){
				if($(this).val().trim() == ''){
					alert('해설이 입력되지 않았습니다.');
					state = 1;
					return false;
				}
			});
		}
		if(state == 0){
			if($('.chk:checked').length != $('.d5').length){
				alert('정답이 입력되지 않았습니다.');
				state = 1;
				return false;
			}
		}
		
		// examf
		// 임시저장 버튼일 경우
		if(state == 0){
			if(bid == 'temps'){
				str = '<input type="hidden" name="examState" value="1">';
			}else if(bid == 'regBtn'){ // 등록 버튼일 경우
				str = '<input type="hidden" name="examState" value="2">';
			}
			$('#examf').append(str);
			
			$.ajax({
				url : '/exam/insertExam',
				method : 'post',
				data : 
					$("#examf").serialize()
				,
				success : function(res){
					alert("시험이 등록되었습니다.");
					opener.parent.location.reload(); // 부모창 리로드
					// 초기화
					$('#examf')[0].reset();
					self.close();
				},
				error: function(xhr){
					alert("상태"+xhr.status);
				}
			});
		}
	});
	
	// 취소 버튼
	$('#cancle').on('click', function(){
		// 초기화
		$('#examf')[0].reset();
		opener.parent.location.reload(); // 부모창 리로드
		self.close();
	});
	
	// 문제 삭제
	$(document).on('click', '.delBtn' ,function(){
		// 해당 문제 삭제
		var parent = $(this).parents('div .d5');
		// 부모 삭제
		parent.remove();
	});
	
})
</script>
<title>examInsert</title>
<style>
body {
	background-color: rgb(240, 235, 248);
}
input{
	margin-top: 5px;
}
#d2 {
	text-align: center;
}
#d1 {
	background: rgb(103, 58, 183);
	display: inline-block;
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	height: 10px;
	width: calc(80% + 2px);
	margin-top: 30px;
}
#d3 {
	padding-left: 20px;
	display: inline-block;
	margin-top: -4px;
	background-color: white;
	width: calc(80% + 2px);
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
	height: 150px;
	text-align: left;
}
.d4 {
	background-color: #4285f4;
	display: inline-block;
	height: 515px;
	width: calc(1% + 2px);
	border-top-left-radius: 8px;
	border-bottom-left-radius: 8px;
	float: left;
}
.d5 {
	display: inline-block;
	margin-left: -6px;
	background-color: white;
	width: calc(80% + 2px);
	border-top-right-radius: 8px;
	border-bottom-right-radius: 8px;
	border-top-left-radius: 8px;
	height: 515px;
	text-align: left;
	margin-top: 10px;
}
.d6 {
	padding-left: 20px;
	padding-top: 5px;
}
.sel1 {
	margin-top : 5px;
}
.form-control {
	width: 800px;
}
.radi {
	display: inline-block;
	margin-right: 5px;
}
.anw {
	margin-top: 5px;
}
.btnd {
	text-align: right;
	margin-top: 10px;
	padding-right: 20px;
}
.btns {
	text-align: right;
	margin-top: 10px;
	padding-right: 20px;
	margin-right: 90px;
}
.comment {
	resize: none;
	text-align: left;
}
.chk {
	margin-left: 4px;
	margin-top: 10px;
	position: relative;
}
.rig{
	float: right;
}
.delBtn{
	margin-right: 60px;
    background-color: cadetblue;
}
.queS{
	display: inline-block;
	width: 200px;
}
</style>
</head>
<body>
	<form:form name="examVO" commandName="examVO" id="examf" action="/exam/insertExam">
		<form:input type="hidden" path="lesId" class="form-control" value="${lesId }"/>
		<form:input type="hidden" path="lidxId" class="form-control" value="${lidxId }"/>
		<div id="d2">
			<div id="d1"></div>
			<div id="d3">
				<h2>시험 등록</h2>
				<br> 
				<label for="sel0">시험 이름</label> <br>
				<form:input type="text" path="examNm" class="form-control" value="${examNm }" />
			</div>
			<br><br>
			<br>

			<div class="d5">
				<div class="d4"></div>
				<div class="d6">
					<label for="sel1" class="sel1"> 문제를 입력해주세요. </label> 
					<input type="text" name="queContList" class="form-control que" />
					<label for="sel4" class="sel4"> 배점을 입력해주세요.(숫자만 입력가능합니다.) &nbsp;&nbsp;&nbsp;</label>
					<input type="number" name="queScoreList" class="form-control que queS" />
					<br>
					<label for="sel2"> 보기를 입력해주세요. </label>
					<div class="anw">
						<input type="text" name="ansContList" class="form-control radi" placeholder="보기1"> 
						<input type="checkbox" name="queAnswerList" value="1" class="chk" />
					</div>
					<div class="anw">
						<input type="text" name="ansContList" class="form-control radi" placeholder="보기2"> 
						<input type="checkbox" name="queAnswerList" value="2" class="chk" />
					</div>
					<div class="anw">
						<input type="text" name="ansContList" class="form-control radi" placeholder="보기3"> 
						<input type="checkbox" name="queAnswerList" value="3" class="chk" />
					</div>
					<div class="anw">
						<input type="text" name="ansContList" class="form-control radi" placeholder="보기4"> 
						<input type="checkbox" name="queAnswerList" value="4" class="chk" />
					</div>
					<div class="anw">
						<label for="sel3"> 문제 해설을 입력해주세요. </label>
						<textarea class="form-control comment" rows="5" name="queExplainList"></textarea>
					</div>
					<div class="anw rig">
						<input type="button" class="btn btn-default delBtn" value="문제 삭제">
					</div>
				</div>
			</div>
		</div>
	</form:form>
	<div class="btns">
		<button type="button" class="btn btn-default" id="plusBtn">문제 추가</button>
		<input type="button" class="btn btn-default" id="temps" value="임시저장">
		<input type="button" class="btn btn-default" id="regBtn" value="등록하기">
		<button type="button" class="btn btn-default" id="cancle" >취소</button>
	</div>
</body>
</html>