<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="/css/user/lesson/lesson-select.css" rel="stylesheet" type="text/css">



<div class="lesson-container" >
	<div class="lesson-header"  >
		<div class="lesson-header-left" >
			<div class="sub-info-id">
				<span class="fs-wf sub-id" >${lessonVO.subId}</span>
			</div>
			<div class="les-info-name">
				<span>${lessonVO.lesNm}</span>
			</div>
			<div class="les-info-cont">
				<span class="sub-cont">${lessonVO.lesCont}</span>
			</div>
		</div>
		<div class="lesson-header-right">
			<div class="les-btn-div">
				<div class="lesbtn" >
					<a class="fa-wf" onclick="addCart('${lesId}','${MEMBER_INFO.userId}')">강의담기</a><br>
				</div>
				<div class="lesbtn">
					<a class="fa-wf" href="${cp}/user/selectReview?lesId=${lesId}">강의후기</a>
				</div>
				<div class="lesbtn" >
					<c:url value="/user/payView" var="pay">
						<c:param name="lesId" value="${lesId}" />
					</c:url>
					<a class="fa-wf" href="${pay}">결제하기</a>
				</div>
			</div>
		</div>
	</div>


	<div class="lesson-content" >
		<div class="lesson-content-left" >
			<c:forEach items="${lesIdxList}" var="lesIdxList" varStatus="status">
				<div class="lesson-content-section" >
					<div class="lesson-content-section-in" >
						<div class="lesson-index bg-index"> 	
							<span class="lesson-index-num">${lesIdxList.lidxNum}</span>
							<div class="lesson_content_section">
							<div class="">
								<h2>${lesIdxList.lidxCont}</h2>
							</div>
							<c:if test="${MEMBER_INFO.userId != null && MEMBER_INFO.userId == lesIdxList.userId}">
								<div class="">
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
		<div class="lesson-content-right" >
			<div class="">
				<img id="teacher" src="/images/user/lesson/teacher.png">
			</div>
			<div class="">
				<div class="">
					<h3>강사 이름</h3>
				</div>
				<div class="">
					<p>강사 소개, 약력</p>
				</div>
			</div>
			
		</div>
		
	</div>

	<div class="">
		<div class="" id="">
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
