<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/css/user/lesson/lesson-select.css" rel="stylesheet" type="text/css">



<div class="container" >
	<div class="card shadow lessonHeader" id="lessonInt" >
		<div class="lesNm">
			${lessonVO.lesNm}
		</div>
		<div class="lesCont">
			<div id="subNmDiv">
				<div id="subNmBox">
					<span>${lessonVO.subId}</span>
				</div>
			</div>
			<div id="lescont">
				${lessonVO.lesCont}
			</div>
			<div id="lescontBtn">
				<div class="btn" >
					<a onclick="addCart('${lesId}','${MEMBER_INFO.userId}')">강의담기</a><br>
				</div>
				<div class="btn" ">
					<a href="${cp}/user/selectReview?lesId=${lesId}">강의후기</a>
				</div>
				<div id="payBtn" class="btn" >
					<c:url value="/user/payView" var="pay">
						<c:param name="lesId" value="${lesId}" />
					</c:url>
					<a href="${pay}">결제하기</a>
				</div>
			</div>
		</div>
	</div>


	<div class="container_lesson" >
		<div class="container_left" >
			<c:forEach items="${lesIdxList}" var="lesIdxList" varStatus="status">
				<div class="container_lessonIndex" >
					<div class="container_lessonIndex_In" >
						<div class="container_lessonIndex_section bg-index"> 	
							<span class="lessonIndex">${lesIdxList.lidxNum}</span>
							<div class="container_lessonCont_section">
							<div class="lidxCont">
								<h2>${lesIdxList.lidxCont}</h2>
							</div>
							<c:if test="${MEMBER_INFO.userId != null && MEMBER_INFO.userId == lesIdxList.userId}">
								<div class="lidxImg">
									<span><a href="#" id="videoClick_${status.index}" value="${lesIdxList.lidxPath}" class="videoA" data-lidxid="${lesIdxList.lidxId}" ><img class="video" src="/images/user/lesson/video2.png"></a><a href=""><img class="note" src="/images/user/lesson/note.png"></a></span>
									<c:choose>
										<c:when test="${lesIdxList.lidxCurtime /lesIdxList.lidxDurtime == 1}">
											<span id="spanText">완료</span>
										</c:when>
										<c:when test="${lesIdxList.lidxCurtime /lesIdxList.lidxDurtime != 1}">
											<span>미완료(<fmt:formatNumber value="${lesIdxList.lidxCurtime /lesIdxList.lidxDurtime}" type="percent"/>)</span>
										</c:when>
									</c:choose>
								</div>
							</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="container_right" >
			<div class="container_teacher_top">
				<img id="teacher" src="/images/user/lesson/teacher.png">
			</div>
			<div class="container_teacher_bottom">
				<div class="teacher_title">
					<h3>강사 이름</h3>
				</div>
				<div class="teacher_cont">
					<p>강사 소개, 약력</p>
				</div>
			</div>
			
		</div>
		
	</div>

	<div class="container">
		<div class="lessonHeader" id="lessonCont"style="border: 1px solid black; width: 900px;">
		시험
		</div>
	</div>
</div>
<script>
function addCart(lesId,userId){
	console.log(lesId,userId);
	$.ajax({
		method : "post",
		url : "/user/cart",
		data : {lesId:lesId,userId:userId},
		dataType : "json",
		success : function(res){
			if(res.code==0){
				alert(res.msg);
			}else{
				var check = confirm("장바구니에 강의를 담았습니다\n장바구니로 이동하시겠습니까?");
				if(check){
					location.href="${pageContext.request.contextPath}/user/cartView";
				}
			}
		}
	})
}
// 강의영상 클릭시
$(function() {
	$('a[id^="videoClick_"]').on('click',function(){
		var path = $(this).attr('value');
		var lidxId = $(this).data('lidxid');
		window.open("/user/selectYoutube?lidxPath="+path+"&lidxId="+lidxId, "video_popup", "width=1100,height=900, left=30, top=30");
	})

})
</script>
