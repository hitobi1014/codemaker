<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

</style>

<script>
$(function(){
	$('#subject').change(function(){
		
// 		console.log('a');
		$('#lesson').find('option').each(function(){
			$(this).remove();
		
		})
		
		var option = "<option value= 'SELECT'></option>";
		
		$('#lesson').append('option');
		
		var selectVal = $(this).val();
		
		$.ajax({
			type:'POST',
			url:'/teacherL/selectSubject',
			data:{'subId':selectVal},
			dataType:'json',
			success:function(data){
// 				alert('data');
				console.log(data);
// 					var list = data.lessonList;
					
				for (var i=0; i<data.length; i++){
					$('#lesson').html("<option value='" + data[i].lesId +"'>" + data[i].lesNm + "</option>");
				}
			},
			error:function(data){
				alert('안됨');
			}
			
		})
		
	})
})	



</script>


	<h2 id="hd">Lesson LIST</h2>
	<div id="right">
		<select class="form-control" id="subject" name="subId">
			<option value="0">과목</option>
			<option value="SUB0001">DB</option>
			<option value="SUB0002">Spring</option>
			<option value="SUB0003">Java</option>
			<option value="SUB0004">Python</option>
			<option value="SUB0005">Jsp</option>
		</select> 
		<select class="form-control" id="lesson">
			<option value="99">강의</option>
			<option value="LESSON0001">Why Java?</option>
			<option value="0">Spring</option>
			<option value="1">Java</option>
			<option value="1">Python</option>
			<option value="1">Jsp</option>
		</select> 
		<input type="button" value="조회">
	</div>
	<table class="w3-hoverable w3-table w3-striped w3-bordered" id="wul">
		<thead>
			<tr class="w3-light-grey" id="selectTab">
				<th style="padding-left: 100px;width: 200px;">순번</th>
				<th>강의목록명</th>
				<th style="text-align: center;">동영상</th>
				</tr>
		</thead>
		<tbody id="examList">
			<!-- 	    <tr> -->
			<!-- 	      <td>Jill</td> -->
			<!-- 	      <td>Smith</td> -->
			<!-- 	      <td>50</td> -->
			<!-- 	    </tr> -->
		</tbody>
	</table>

	<c:if test="${examList.size() ne 0 }">
		<%-- pages : ${pages} --%>
		<!-- 현재 있는 페이지 번호 출력 -->
		<%-- page : ${page} --%>
		<div class="text-center">
			<ul class="pagination">

			</ul>
		</div>
	</c:if>
