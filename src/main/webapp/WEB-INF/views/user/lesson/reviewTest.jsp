<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- Main css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/user/review/review-style3.css">

<script>
var startCount = 0;
$(function() {

	$('button[name^="star"]').on('click', function() {
		var cl =$(this).children('img');
// 		var cl = $('.starbtn-img').attr('src');
// alert(cl);
			console.log(cl);
		if (cl.attr('src') == '/images/user/icons/staroff.png') {
			startCount++;
			console.log(startCount);
			$(cl).attr('src', '/images/user/icons/staron.png');
		} else {
			startCount--;
			console.log(startCount);
			$(cl).attr('src', '/images/user/icons/staroff.png');
		}
		
	});

	$("#reviewDel").on('click', function() {
		alert("수강후기가 삭제되었습니다.");
	});
	
	
	$(document).ready(function(){
		$('#reviewb').on("click", function(){
			
			$('input[name=reviewStar]').attr('value',startCount).val();
			$("textarea[name=reviewCont]").val();
			
			if(startCount==0){
				alert("별점을 체크해 주세요.");
				return false;
			}
			var lesId= $("#lesId").val();
			var flag=true;
			
			$.ajax({
				url : "${cp}/user/insertReview",
				type : "post",
				data : $("#reviewform").serialize(),
				dataType : 'json',
				async: false, //비동기식인 ajax를 동기식으로 설정
				success : function(res) {
					if (res == "0") {
						alert("회원님이 수강한 강의가 아닙니다.");
						$('#new-review').val('');
						flag=false;
					}else {
						alert("수강후기를 작성합니다.");
						location.href="${cp}/user/selectReview?lesId="+lesId;
					}
				}
			});
				return flag;
			})
		});
})
</script>


<body>
<div class="reviewBox">
	<h1>수강후기</h1>
	<div class="divide"></div>


	<div class="ReviewTemplate">
		<div class="Review_header">
			<div class="msgbox">
				<p class="message_title">수강생이 직접 작성한<br>생생한 후기를 읽어보세요</p>
				<p class="message">단 한 글자의 편집없이 코드메이커 강의를 직접 들은 사람들만<br>
					<span class="message">작성할 수 있는 생생한 후기! <span class="pointmsg">교육을 마친 수료생</span>들이</span><br>
						코드메이커에서 느낀 특별한 경험을 함께 해요.
				</p>
			</div>
			<div class="mainimgbox">
				<img class="review_mainimg" src="/images/user/icons/pngegg.png">
			</div>
		</div>
	</div>


	<div class="Review_rating">
	<div class="Review_middle"> 
	<div class="ReviewRatingAvg">
		<span class="ReviewRatingAvg__avg">${reviewAvg}<span class="avgpoint">/ 5</span></span>
		<div class="staravg">
			<c:forEach var="i" begin="1" end="${reviewAvg}">
				<img src="${cp}/images/user/icons/review-star.svg" id="starimg">
			</c:forEach>
		</div>	
	</div>

	<div class="rating_bar_header">
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>5</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner"  style="width: 100%;"></span>
		</div>
		<div class="pull-right" style="margin-left:10px;"><b>${reviewStarVo.five}</b></div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>4</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 80%;"></span>
		</div>
		<div class="pull-right" style="margin-left:10px;"><b>${reviewStarVo.four}</b></div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>3</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 60%;"></span>
		</div>
		<div class="pull-right" style="margin-left:10px;"><b>${reviewStarVo.three}</b></div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>2</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 40%;"></span>
		</div>
		<div class="pull-right" style="margin-left:10px;"><b>${reviewStarVo.two}</b></div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>1</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 20%;"></span>
		</div>
		<div class="pull-right" style="margin-left:10px;"><b>${reviewStarVo.one}</b></div>
	</div>
	</div>	
	</div>
	</div>
	
	<form id="reviewform" action="${cp}/user/insertReview?lesId=${lesId}" method="POST">
	<input type="hidden" value="${lesId}" id="lesId" name="lesId">
	<div class="starbox">
		<span><b>강의 내용은 어떠셨나요?</b></span><br>
		<span><b>평점과 함께 후기를 남겨주세요.</b></span><br><br>
		<input type="hidden" name="reviewStar" value="">
		<c:forEach var="i" begin="1" end="5">
			<button type="button" name="star" id="reviewstar"><img class="starbtn-img" src="/images/user/icons/staroff.png"></button>
		</c:forEach>
	</div>

	<div class="textbox">
		<div class="textboxbox">
<!-- 			<div class="imgbox"> -->
<!-- 					<img src="/images/user/icons/reviewimage2.png" class="imgboximg"> -->
<!-- 			</div> -->
			<div class="textbox">
				<textarea class="textareabox" id="new-review" name="reviewCont" placeholder="수강후기를 작성해주세요." style="resize: none;"></textarea>
			</div>
			<button type="button" id="reviewb" class="reviewBtn">후기등록</button>
		</div>
	</div>
	</form>
	
	
	<div class="reviewTemplate">
		<c:forEach items="${reviewList }" var="reviewList">
		<div class="reviewbox">
			<div class="reviewbox_probox">
				<div class="reviewbox_profile">
					<div class="reviewbox_profile_user">
						<div class="reviewbox_profile_img">
							<img src="/user/reviewprofile?lesId=${lesId}" class="userimg">
							<span class="username">‍${reviewList.userId}</span>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="reviewbox_contbox">
				<div class="reviewbox_cont">
				
						<div class="reviewbox_contstar">
							<c:forEach var="i" begin="1" end="${reviewList.reviewStar}">
								<img src="${cp}/images/user/icons/review-star.svg">
							</c:forEach>
							<fmt:formatDate value="${reviewList.reviewDate}" pattern="yyyy-MM-dd"/>
							
							<c:choose>
								<c:when test="${reviewList.userId == MEMBER_INFO.userId}">
									<button id="reviewDel" class="btn btn-sm btn-default float-right" onclick="location.href='${cp}/user/deleteReview?lesId=${lesId}&reviewId=${reviewList.reviewId}'">삭제</button>
								</c:when>
							</c:choose>
								<input type="hidden" value="${reviewList.reviewId}">
						</div>
						
						<div class="reviewbox_conttext">
							<div class="reviewbox_review">
								<strong>${reviewList.reviewCont}</strong>
							</div>
						</div>
						
				</div>
			</div>
		</div>
		</c:forEach>				
	</div>
			
	

	</div>
</body>
