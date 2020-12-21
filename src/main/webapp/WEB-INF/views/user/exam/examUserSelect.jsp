<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta charset="UTF-8">
<!-- bootstrap 사용 설정 -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

<!-- 시험 상세 내역 page css -->
<link href="/css/user/mypage/mypage-exam-select.css" rel="stylesheet"/>

<script>
$(function() {

	// 목록으로 가기
	$('#cancle').on('click', function(){
		$('#examf').submit();
	});
})

</script>
<title>examSelect</title>
<div class="exam-select-box shadow" role="main">
	<div class="exam-select-item">
		<form:form action="/examUser/selectAllExam" id="examf" method="post" commandName="examVO" name="examVO">
			<form:input type="hidden" path="searchEsFscore" class="form-control" id="searchEsFscore" value="${searchEsFscore }"/>
			<div id="d2">
				<div id="d1"></div>
				<div id="d3" class="divBC">
					<h2 id="hh2">시험 결과</h2>
					<br> 
					<label for="sel1" class="sel1"><h5>${examScoreVO.examNm }</h5></label>
					<label for="sel1" class="sel1">총 문제 수: ${examResultList.size() } / 맞힌 개수 : ${examResultList[0].answerCount }</label>
				</div>
				<br>
				<c:forEach items="${examResultList }" var="examResult" varStatus="status">
					<br>
					<div class="d5">
						<div class="d4"></div>
						<div class="d6 divBC">
							<label for="sel2" class="sel2">${status.count }. ${examResult.queCont }</label><br>
							<label for="sel4" class="sel4">배점 : ${examResult.queScore }</label>
							<br>
							
							<c:forEach begin="${status.index*4 }" end="${status.count*4-1 }" items="${answersheetLists }" varStatus="vs" var="answersheet">
								<div class="anw">
									<label for="sel4" class="sel4"
										<c:if test="${vs.count eq examResult.queAnswer }">
											style="background-color: rgba(230, 244, 234);"
										</c:if>>${vs.count }. ${answersheet.ansCont }</label>
								</div>
							</c:forEach>
							<hr>
							<div class="anw">
								<label for="sel5" class="sel5">입력한 답 : 
									<c:if test="${examResult.erAnswer != '0' }">
										${examResult.erAnswer }
									</c:if>
								</label><br>
								<label for="sel5" class="sel5">정답 : ${examResult.queAnswer } </label><br>
								<label for="sel5" class="sel5">문제해설 </label>
								<textarea class="form-control comment" rows="5" name="queExplain" readonly="readonly">${examResult.queExplain}</textarea>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</form:form>
		<div class="btns">
			<input type="button" class="btn btn-default" id="cancle" value="목록으로 가기">
		</div>
	</div>
</div>

