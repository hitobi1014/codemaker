<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- Main css -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

<style>
.reviewBox{
    max-width: 1000px;
    margin: 0 auto;
    margin-top: 50px;
}
.reviewHeader {
    border-bottom: 1px solid #e7e8ea;
    line-height: normal;
    width: 65%;
}
.divide {
    width: 100%;
    height: 1px;
    background: #0000001f;
    margin-bottom: 10px;
}
h1 {
    font-weight: 600;
    margin-bottom: 1.2em;
    font-size: 3.5rem;
}
.rating-block {
    margin: 15px 52% 0 19%;
}
img#starimg {
    width: 30px;
}
.ReviewTemplate{
	background-color: #005F86;
	border-radius: 2em;
	height: 220px;
}
.Review_rating{
	background-color: white;
	height: 200px;
	display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 23px;
}
.ReviewRatingAvg{
/* 	background-color: black; */
	display: flex;
    justify-content: center;
    align-items: center;
}
.ReviewRatingAvg__avg {
    font-size: 6.3em;
    text-align: center;
}
.review_rating_rowbar1{
	display: inline-block;
}
.review_rating_rowbar2 {
	width: 22rem;
    margin-left: 1.6rem;
    min-height: 1.7rem;
    display: inherit;
    flex: 1;
    border-top-left-radius: .2rem;
    border-bottom-left-radius: .2rem;
    background-color: #f5f1eb;
    display: inline-block;
}
.ReviewRatingRow__bar__inner {
/*     display: list-item; */
     border-radius: .2rem; 
    background-color: #ffd653;
}
.rating_bar_header {
/*     background-color: black; */
    display: inline-block;
    width: 95%;
    padding: 35px;
}
.Review_middle{
	display: flex;
    justify-content: center;
    align-items: center;
}
.message{
	color: white;
}
.textbox {
    display: table-row;
    box-sizing: border-box;
    transition: all .3s ease;
}
.imgbox{
	display: table-cell;
    padding: 21px 30px;
    vertical-align: middle;
    width: 210px;
    background-color: white;
    color: #323232;
    text-align: left;
    font-weight: bold;
    word-break: break-all;
    border-bottom: 1px solid #e7e8ea;

}
.textboxbox{
/* 	background-color:black; */
    display: flex;
    padding: 21px 30px;
    vertical-align: middle;
    border-bottom: 1px solid #e7e8ea;
    color: #323232;
}
.textbox{
   display: table;
    border-top: 1px solid #e7e8ea;
    width: 96%
}
textarea {
    width: 641px;
    height: 108px;
}
button.reviewBtn {
    background-color: grey;
    width: 14%;
}
.starbox {
    width: 100%;
    text-align: center;
    margin: 30px 21px 54px 0px;
}
.starbtn-img{
 	height: 40px;
}
.reviewbox {
    width: 100%;
    background-color: white;
    height: 160px;
    margin: 26px 0 15px 0px;
    border-radius: 1.3rem;
}

</style>

<body>
<div class="reviewBox">
	<h1>수강후기</h1>
	<div class="divide"></div>


	<div class="ReviewTemplate">
		<div class="Review_header">
			<p class="message">수강생이 직접 작성한<br>생생한 후기를 읽어보세요</p>
				<p class="message">단 한 글자의 편집없이 코드잇 강의를 직접 들은 사람들만<br>
					<span class="message">작성할 수 있는 생생한 후기! <span>5만명 이상의 코드잇 유저</span>들이</span><br>
					코드잇에서 느낀 특별한 경험을 함께 해요.
				</p>
		</div>
	</div>


	<div class="Review_rating">
	<div class="Review_middle"> 
	<div class="ReviewRatingAvg">
		<span class="ReviewRatingAvg__avg">4.8</span>
		<c:forEach var="i" begin="1" end="${reviewAvg}">
			<img src="${cp}/images/user/icons/review-star.svg" id="starimg">
		</c:forEach>
	</div>

	<div class="rating_bar_header">
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>5</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 100%;"></span>
		</div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>4</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 80%;"></span>
		</div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>3</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 60%;"></span>
		</div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>2</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 40%;"></span>
		</div>
	</div>
	<div class="review_rating_bar">
		<div class="review_rating_rowbar1">
		<span><b>1</b><img src="${cp}/images/user/icons/review-star.svg"></span>
		</div>
		<div class="review_rating_rowbar2">
			<span class="ReviewRatingRow__bar__inner" style="width: 20%;"></span>
		</div>
	</div>
	</div>	
	</div>
	</div>
	
	<div class="starbox">
		<span><b>강의 내용은 어떠셨나요?</b></span><br>
		<span><b>평점과 함께 후기를 남겨주세요.</b></span><br><br>
		<c:forEach var="i" begin="1" end="5">
			<button type="button" name="star" id="reviewstar"><img class="starbtn-img" src="/images/user/icons/staroff.png"></button>
		</c:forEach>
	</div>

	<div class="textbox">
		<div class="textboxbox">
			<div class="imgbox">
				<img>회원사진
			</div>
			<div class="textbox">
				<textarea style="resize: none;"></textarea>
			</div>
			<button type="button" class="reviewBtn">후기등록</button>
		</div>
	</div>
	
	
	<div class="reviewTemplate">
		<div class="reviewbox">
		
		
		</div>
	</div>
			
	

	</div>
</body>
